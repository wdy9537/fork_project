import React, { useState,useEffect } from 'react'
import { useCategoryStore } from '../store/mainViewStore';
import useScrollToSubCategoryStore from '../store/scrollListStore';
import { Link } from 'react-router-dom';
import axios from 'axios';
import {useReceiptStore} from '../store/receiptViewStore';
import { useNavigate } from 'react-router-dom';
import paymentProcessStore from '../store/paymentProcessStore';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';

const Headers = () => {

  const { getPaymentProcess } = paymentProcessStore();

  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = (e) => {
    e.stopPropagation();
    e.preventDefault();
    setShow(true)
  };
  
  const kioskNo = useReceiptStore((state) => state.kioskNo);
  const {setReceiptItems} = useReceiptStore();

  const navigate = useNavigate();
  const subCategorys = useCategoryStore((state) => state.subCategorys);
  const { scrollToSubCategory } = useScrollToSubCategoryStore();

  const handleCallReceipt = async () => {
    await axios?.post(`/kiosk/receipt/${kioskNo}`)?.then((response) => {
        setReceiptItems(response.data);
    }).catch((error) => {
        console.error('오류', error);
    });
  }

  const toHome = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
    navigate("/");
  }

  return (
    <div className="header-wrap">
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
      <div className="header-content">
        <div className="header-logo-wrap">
          <img id='header-logo' src={`${process.env.PUBLIC_URL}/forkLogo.PNG`} alt='로고' onClick={getPaymentProcess() ? (e) => handleShow(e) : toHome}></img>
        </div>
        <div id='flag'>
          No.{kioskNo}
        </div>
        <div className="header category-wrap">

          {subCategorys && subCategorys.map(subCategory => {
             return <div className="detail-category" key={subCategory.categoryName}><Link to="/" onClick={getPaymentProcess() ? (e) => handleShow(e) : () => scrollToSubCategory(subCategory.categoryName)}>{subCategory.categoryName}</Link></div>
          })}
         
        </div>
        <div className="header-utils" id="header-utils">
          <div className="receipt-header-wrap">
            <div className="receipt-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/bill.png`} alt='영수증로고' onClick={getPaymentProcess() ? (e) => handleShow(e) : handleCallReceipt}></img></a>
            </div>
          </div>
          <div className="cart-header-wrap">
            <div className="cart-header">
              <a><img className="int-header" src={`${process.env.PUBLIC_URL}/add-cart.png`} alt='장바구니로고'></img></a>
            </div>
          </div>
        </div>
      </div>
    </div>

  );

}

export default Headers
