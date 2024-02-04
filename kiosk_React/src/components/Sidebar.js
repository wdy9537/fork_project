import React, { useReducer, useRef, useState } from 'react'
import Button from 'react-bootstrap/Button';
import Dingdong from './DingdongModal';
import { useCategoryStore } from '../store/mainViewStore';
import useScrollToSubCategoryStore from '../store/scrollListStore';
import { Link } from 'react-router-dom';
import useSocketStore from '../store/socketStore';
import { useReceiptStore } from '../store/receiptViewStore';
import useModalStore from '../store/useModalStore';
import Modal from 'react-bootstrap/Modal';
import paymentProcessStore from '../store/paymentProcessStore';
const Sidebar = () => {
    
    const { getPaymentProcess } = paymentProcessStore();

    const [show, setShow] = useState(false);
  
    const handleClose = () => setShow(false);
    const handleShow = (e) => {
        e.stopPropagation();
        e.preventDefault();
        setShow(true)
    };

    // 직원호출 모달
    const [modalShow, setModalShow] = useState(false);
    const categorys = useCategoryStore((state) => state.categorys);
    const setSubCategory = useCategoryStore((state) => state.setSubCategory);

    const { stompClient, setStompClient } = useSocketStore();

    const { scrollToSubCategory } = useScrollToSubCategoryStore();
    const {getStandeByTimer} = useModalStore();

    const kioskNo = useReceiptStore((state) => state.kioskNo);
    
    const handleSendMsg = () => {
        getStandeByTimer()?.forEach( timer =>clearTimeout(timer));
        let message = {
            kioskNo: kioskNo,
            price: 0,
        };
        stompClient?.send(`/user/send/${kioskNo}`, {}, JSON.stringify(message));
        console.log(message);
    }

    return (

        <div className="left-nav-wrap">
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
            {/* 여기만 반복 */}
            {/* {console.log(categorys)}  5초마다 실행됨 수정 필요 */}
            {categorys && categorys.map((category) => (
                <div key ={category.categoryNo} className="category" ><Link to="/" onClick={getPaymentProcess() ? (e) => handleShow(e) : () => {setSubCategory(category.categoryNo); scrollToSubCategory(); } }>{category.categoryName}</Link></div>
            ))}


            <div className="ding-dong">
                {/* <button className="int">직원호출</button> */}
                <Button className='int' id="button-dingdong" variant="secondary" onClick={() => {handleSendMsg(); setModalShow(true); }}> 직원호출 </Button>
                <Dingdong show={modalShow} onHide={() => setModalShow(false)} />
            </div>
        </div>

    );
}

export default Sidebar;