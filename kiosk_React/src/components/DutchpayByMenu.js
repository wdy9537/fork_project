import Button from 'react-bootstrap/Button';
import { Link, useNavigate } from 'react-router-dom';
import DutchpaySelectPayModal from './DutchpaySelectPayModal ';
import { paymentModalStore } from '../store/paymentModalStore';
import { useState } from 'react';
import useCartStore from '../store/cartStore';
import useSaveData from '../store/saveData';
import { useReceiptStore } from '../store/receiptViewStore';
import useSocketStore from '../store/socketStore';
import paymentProcessStore from '../store/paymentProcessStore';
import Modal from 'react-bootstrap/Modal';

const DutchpayByMenu = (props) => {

    const [show, setShow] = useState(false);
  
    const handleClose = () => setShow(false);
    const handleShow = (e) => {
        e.stopPropagation();
        e.preventDefault();
        setShow(true)
    };
    // true 결제중 false 결제x
    const { setPaymentProcess, getPaymentProcess } = paymentProcessStore();

    const springUrl = 'http://192.168.30.14:8082/user';
    const navigate = useNavigate();
    const [receiptNo , setReceiptNo] = useState([]);

    // 받아온 영수증 번호 담아주기
    const addReceiptNo = (newReceiptNo) => {
        setReceiptNo([...receiptNo, newReceiptNo]);
        return [...receiptNo, newReceiptNo];
    }
    // 소켓통신이 완료되면 영수증 번호 지워주기
    const resetReceiptNo = () => {
        setReceiptNo([]);
    }

    // 장바구니에 있는 값 가져오기
    const {cartItems, setNewCartAfterDutchByMenu } = useCartStore();
    const {totalCashPrice, setTotalCashPrice , getTotalCashPrice} = paymentModalStore();
    // 키오스크 번호
    const kioskNo = useReceiptStore((state) => state.kioskNo);

    // 결제 방법별 모달
    const [modalShow, setModalShow] = useState(false);
    const { selectedPaymentMethod, setSelectedPaymentMethod,updatedTotalCashPrice } = paymentModalStore();

    // 카드결제 버튼 클릭 시 모달 열기
    const handleCardPaymentClick = () => {
        setSelectedPaymentMethod('카드결제');
        setModalShow(true);
    };
    
    // 현금합계 소켓 연결 설정
    const {stompClient , setStompClient} = useSocketStore();

    // 현금합계 기본값
    let cashPrice = 0;

    // 현금결제 버튼 클릭 시 모달 열기
    const handleCashPaymentClick = (menu) => {
        setSelectedPaymentMethod('현금결제');
        cashPrice = totalCashPrice+menu.totalPrice;
        setTotalCashPrice(cashPrice);
        setModalShow(true);
    };

    // 결제한 메뉴 스토어에서 지우기
    const handleSetNewCartAfterDutchByMenu = (menu, menuTotalPrice) => {      
        return setNewCartAfterDutchByMenu(menu, menuTotalPrice);
    }

    // 결제
    const { dutchPay } = useSaveData();
    const handleDutchPay = async (menu) => {
        let result = await dutchPay(kioskNo, menu, menu.totalPrice);
        if(result > 0){
            // 결제 성공
            // 영수증번호 배열에 담아주기
            let receiptNoList = addReceiptNo(result);
            let message = {
                kioskNo : kioskNo,
                price : cashPrice == 0 ? null : getTotalCashPrice(),
                receiptNoList : receiptNoList
            };
            setPaymentProcess(true);

            if(!handleSetNewCartAfterDutchByMenu(menu, menu.totalPrice).length){
                // 모두 결제된 경우
                // 소켓 보내주는곳
                stompClient?.send(`/user/send/${kioskNo}`,{} , JSON.stringify(message));
                
                resetReceiptNo();
                setPaymentProcess(false);
                navigate("/")
            }
        } else {
            // 결제 실패
            resetReceiptNo();
        }
        setTotalCashPrice(0);
    }

    return (
        <div className="content-wrap">
            <Modal show={show} onHide={handleClose} size="lg" aria-labelledby="contained-modal-title-vcenter" centered>
                <Modal.Header closeButton>
                <Modal.Title><br></br> </Modal.Title>
                </Modal.Header>
                <Modal.Body><div style={{"font-size":"1.5vw"}}>결제를 모두 종료 후 이용해주세요.</div></Modal.Body>
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
                            <p className="main-content-detail-category">메뉴별 분할결제</p>
                        </div>
                        <div className="dutchpay-button">
                            <Button variant="secondary" id="button-dutchpayByMenu"><Link to="/dutchpayByMenu">메뉴별</Link></Button>
                            <Button variant="secondary" id="button-dutchpayByPrice"><Link to="/dutchpayByPrice" onClick={getPaymentProcess() ? (e) => handleShow(e) : {}}>금액별</Link></Button>
                        </div>
                    </div>

                    <div className="dutchpayByMenu-content">
                        <div className="pay-list">
                            {
                                cartItems.map(menu => (
                                    <ul id={menu.menuNo+menu.menuName+menu.totalPrice}>
                                        <li>
                                            <img src={springUrl + menu.filePath + menu.changeName} alt="메뉴사진" onError={(e) => { e.target.src = require('../resources/image/defaultimg.jpg') }} />
                                        </li>
                                        <li>
                                            {menu.menuName}
                                        </li>
                                        <li>
                                            수량 : {menu.count}
                                        </li>
                                        <li>
                                            {menu.totalPrice.toLocaleString('ko-KR')}원
                                        </li>
                                        <li>
                                            <Button variant="secondary" onClick={() => {handleCardPaymentClick(); handleDutchPay(menu);} }>카드결제</Button>{' '}
                                            <Button variant="secondary" onClick={() => {handleCashPaymentClick(menu); handleDutchPay(menu);} }>현금결제</Button>
                                        </li>
                                    </ul>
                                ))
                            }
                        </div>
                        <DutchpaySelectPayModal show={modalShow} onHide={() => setModalShow(false)} selectedPaymentMethod={selectedPaymentMethod}/>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default DutchpayByMenu;
