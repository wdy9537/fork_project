import Button from 'react-bootstrap/Button';
import { Link, useNavigate } from 'react-router-dom';
import { useState , useEffect } from 'react';
import DutchpayByPriceModal from './DutchpayByPriceModal';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import useCartStore from '../store/cartStore';
import useSaveData from '../store/saveData';
import { useReceiptStore } from '../store/receiptViewStore';
import Numpad from './numPadTest'; 
import numpadStore from '../store/numpadStore';
import Modal from 'react-bootstrap/Modal';
import useSocketStore from '../store/socketStore';
import paymentProcessStore from '../store/paymentProcessStore';

const DutchpayByPrice = (props) => {

    const { setPaymentProcess, getPaymentProcess } = paymentProcessStore();

    const [show2, setShow2] = useState(false);
  
    const handleClose2 = () => setShow(false);
    const handleShow2 = (e) => {
        e.stopPropagation();
        e.preventDefault();
        setShow2(true)
    };

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const [receiptNo , setReceiptNo] = useState([]);
    // 받아온 영수증 번호 담아주기
    const addReceiptNo = (newReceiptNo) => {
        setReceiptNo([...receiptNo, newReceiptNo]);
        return [...receiptNo, newReceiptNo];
    }
    // 모두 결제가 되었을때 마지막 영수증 번호 담아주기
    const lastAddReceiptNo = (prevReceiptNoList, newReceiptNo) => {
        setReceiptNo([...prevReceiptNoList, newReceiptNo]);
        return ([...prevReceiptNoList, newReceiptNo]);
    }
    // 소켓통신이 완료되면 영수증 번호 지워주기
    const { stompClient, setStompClient } = useSocketStore();
    const {totalCashPrice, setTotalCashPrice , getTotalCashPrice} = paymentModalStore();
    const navigate = useNavigate();
    
    const resetReceiptNo = () => {
        setReceiptNo([]);
    }
    // 키오스크 번호
    const kioskNo = useReceiptStore((state) => state.kioskNo);
    
    const [paidPrice, setPaidPrice] = useState(0);

    const addPaidPrice = (newPaidPrice) => {
        setPaidPrice(paidPrice + newPaidPrice);
        return (paidPrice + newPaidPrice);
    }

    // 장바구니 비우기
    const handleResetCartStore = () => {
        resetCartStore();
    }    

    // 결제
    const { dutchPay, basicPay } = useSaveData();
    const handleDutchPay = async (price, index) => {
        let result = await dutchPay(kioskNo,{}, price);
        if(result > 0){
            // 결제 성공
            let prevReceiptNoList = addReceiptNo(result);
            let paidPriceSum = addPaidPrice(price);
            setPaymentProcess(true);
            
            if(paidPriceSum == cartTotalPrice){ // 모두 결제된 경우
                // 가격없이 아이템들 basicPay로 데이터 넣어주기
                let result = await basicPay(kioskNo, cartItems, 0);
                if (result > 0) {
                    // 결제 성공
                    let receiptNoList = lastAddReceiptNo( prevReceiptNoList,result);
                    let message = {
                        kioskNo : kioskNo,
                        price : (getTotalCashPrice() == 0 ? null : getTotalCashPrice() ),
                        receiptNoList : receiptNoList
                    };

                    stompClient?.send(`/user/send/${kioskNo}`, {}, JSON.stringify(message));
                    console.log(message);
                    handleResetCartStore(); // 카트비워주기
                    resetReceiptNo(); // 영수증번호 리스트 비워주기
                    setTotalCashPrice(0);
                    setPaymentProcess(false);
                    navigate("/") // 결제 완료 후 메인화면으로
                } else {
                    // 결제 실패
                    // 영수증번호 리스트 비워주기
                    resetReceiptNo();
                }
            }
        } else {
            // 결제 실패
            // 영수증번호 리스트 비워주기
            resetReceiptNo();
        }
    }


    // 최대개수 넘어가면 모달
    const [modalShow, setModalShow] = useState(false);
    const [numpadModalShow , setNumpadModalShow] = useState(false);
    const {setInputId} = numpadStore();
    // 결제 방법별 모달
    const { selectedPaymentMethod, setSelectedPaymentMethod, resetSelectedPaymentMethod } = paymentModalStore();
    const {cartTotalPrice, setCartTotalPrice, cartItems, resetCartStore} = useCartStore();

    const checkTotalInputPrice = () => {
        const totalInputPrice = items.reduce( (total , item) => {
            return total + item.price
        }, 0);
        console.log(totalInputPrice , cartTotalPrice)
        if(totalInputPrice != cartTotalPrice ){
            handleShow();
            return false;
        }
        return true;
    }

    const updatePaymentStatus = (itemId) => {
        const updateditems = items.map((item) =>{
            if(item.id == itemId){
                return {...item , paymentStatus: true }
            }
            return item;
        })
        setItems(updateditems);
    }
    // 카드결제 버튼 클릭 시 모달 열기
    const handleCardPaymentClick = (item) => {
        if(checkTotalInputPrice()){
            setSelectedPaymentMethod('카드결제');
            setModalShow(true);
            updatePaymentStatus(item.id);
            handleDutchPay(item.price);
        }
    };

    // 현금결제 버튼 클릭 시 모달 열기
    let cashPrice = 0;
    const handleCashPaymentClick = (item) => {
        if(checkTotalInputPrice()){
            setSelectedPaymentMethod('현금결제');
            setModalShow(true);
            updatePaymentStatus(item.id);
            cashPrice = totalCashPrice+item.price;
            setTotalCashPrice(cashPrice);
            console.log("현금결제 금액금액",cashPrice);
            handleDutchPay(item.price);
        }
    };

    const paymentStatusCheck = (item) =>{     
        return item.paymentStatus;
    }

    //최소하나 초기값 필요 
    const [pricePerPerson, setPricePerPerson] = useState(cartTotalPrice);
    const {items, setItems} = numpadStore();
    useEffect(() =>{
        setItems([ {
            id: 0,
            price: pricePerPerson,
            maximumPrice : cartTotalPrice,
            paymentStatus : false
        }])
    },[])

    const [count, setCount] = useState(1);

    const handleAddItem = () => {
        if (items.length < 10) {
            setCount(count + 1);
            const unPaymentItems = items.filter( item => !item.paymentStatus); // 결제안함
            const paymentItems = items.filter( item => item.paymentStatus); // 결제함
            const leftPrice = pricePerPerson - paymentItems.reduce((total , item ) => {return total + item.price} , 0);

            const newPrice = Math.floor(leftPrice / (unPaymentItems.length + 1));
            const modPrice = leftPrice % (unPaymentItems.length + 1); // 나머지값

            const updatedItems = unPaymentItems.map((item, index) => ({
                ...item,
                price: newPrice + (index < modPrice ? 1 : 0),
            }));
            setItems([...paymentItems,  ...updatedItems, { id: count, price: newPrice , maximumPrice : cartTotalPrice , paymentStatus : false }]);
        } else { // 10개 이상이라면 모달창으로 안내
            setSelectedPaymentMethod("최대개수");
            setModalShow(true);
        }
    };

    const handleRemoveItem = (keyToRemove) => {

        const newItems = items.filter(item => item.id !== keyToRemove);

        const unPaymentItems = newItems.filter( item => !item.paymentStatus); // 결제안함
        const paymentItems = newItems.filter( item => item.paymentStatus); // 결제함

        const leftPrice = pricePerPerson - paymentItems.reduce((total , item ) => {return total + item.price} , 0);

        const newPrice = Math.floor(leftPrice / (unPaymentItems.length));
        const modPrice = leftPrice % (unPaymentItems.length); // 나머지값

        const updatedItems = unPaymentItems.map((item, index) => ({
            ...item,
            price: newPrice + (index < modPrice ? 1 : 0),
        }))
        setItems([...paymentItems , ...updatedItems]);
    }

    // 숫자패드
    const handleNumPad = (e) => {
        const next = e.target.nextElementSibling
        const id = e.target.id;
        setInputId(id);
        if(next){
            next.style.display = 'block';
        }
    }

    return (
        <div className="content-wrap">
            <Modal show={show2} onHide={handleClose2} size="lg" aria-labelledby="contained-modal-title-vcenter" centered>
                <Modal.Header closeButton>
                <Modal.Title><br></br> </Modal.Title>
                </Modal.Header>
                <Modal.Body><div style={{"font-size":"1.5vw"}}>결제를 모두 종료 후 이용해주세요.</div></Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleClose2}>
                    닫기
                </Button>
                </Modal.Footer>
            </Modal>

            <Modal show={show} onHide={handleClose} size="lg" aria-labelledby="contained-modal-title-vcenter" centered>
                <Modal.Header closeButton>
                <Modal.Title><br></br> </Modal.Title>
                </Modal.Header>
                <Modal.Body><div style={{"font-size":"1.5vw"}}>입력하신 금액과 총결제 금액이 일치하지 않습니다.</div></Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    닫기
                </Button>
                </Modal.Footer>
            </Modal>
            <div className="main-content">
                <div className="main-content-dutchpay">
                    <div className="page-head">
                        <div className="dutchpay-head-title">
                            <p className="main-content-detail-category">금액별 분할결제</p>
                        </div>
                        <div className="dutchpay-button">
                            <Button variant="secondary" id="button-dutchpayByMenu"><Link to="/dutchpayByMenu" onClick={getPaymentProcess() ? (e) => handleShow(e) : {}}>메뉴별</Link></Button>
                            <Button variant="secondary" id="button-dutchpayByPrice"><Link to="/dutchpayByPrice">금액별</Link></Button>
                        </div>
                    </div>
                    <div className="dutchpayByPrice-content">
                        <div className="totalPrice">
                            <table className='dutchPrice-table'>
                                <tbody className='dutchPrice-body'>
                                    <tr className='dutchPrice-tr'>
                                        <th>총 금액 : </th>
                                        <td>&nbsp;{pricePerPerson.toLocaleString()}원</td>
                                        <td colSpan="3" className='inputValueTotalPrice'>현재 입력한 금액 : {items.reduce((total ,item) => {return (total+item.price)},0).toLocaleString()}원&nbsp;&nbsp;&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div className="pay-list">
                            {items.map((item, index) => (
                                item.paymentStatus ? (
                                    <ul key={item.id} id='paidUlInDutch'>
                                        <li>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <th>금액</th>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <input type="text" id={item.id} readOnly value={item.price.toLocaleString()} onClick={(e) => { if(!paymentStatusCheck(item)) {handleNumPad(e, this); setNumpadModalShow(items.length > 1);}}}/>
                                        </li>
                                        <li>
                                            결제완료
                                        </li>
                                    </ul>
                                ) : (
                                    <ul key={item.id}>
                                        <li>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <th>금액</th>
                                                        {/* <td><CloseButton variant="white" onClick={() => handleRemoveItem(item.id)}/></td> */}
                                                        <td><img className='closeBtn' src={require('../resources/image/close-button.png')} onClick={() => {if(!paymentStatusCheck(item)) handleRemoveItem(item.id)}} /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <input type="text" id={item.id} readOnly value={item.price.toLocaleString()} onClick={(e) => { if(!paymentStatusCheck(item)) {handleNumPad(e, this); setNumpadModalShow(items.length > 1);}}}/>
                                            {/* <Numpad items={items} setItems={setItems} /> */}
                                        </li>
                                        <li>
                                            <Button variant="secondary" onClick={() => {if(!paymentStatusCheck(item)) handleCardPaymentClick(item); }}>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={() => {if(!paymentStatusCheck(item)) handleCashPaymentClick(item); }}>현금결제</Button>
                                        </li>
                                    </ul>
                                )
                                
                            ))}
                            <ul>
                                <li className="userAddLi" onClick={handleAddItem}>
                                    <img className='userAddBtn' src={require('../resources/image/add (3).png')} alt='추가' />
                                </li>
                                <DutchpaySelectPayModal show={modalShow} onHide={() => setModalShow(false)} selectedPaymentMethod={selectedPaymentMethod}/>
                                <Numpad show={numpadModalShow} onHide={() => setNumpadModalShow(false)} />
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByPrice;
