import React, { useState, useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';

function DutchpayByPriceModal(props) {

    const [modalTimer, setModalTimer] = useState(3); // 모달 시간 설정

    useEffect(() => {

        let timer;

        // 모달이 열릴 때 타이머 시작
        if (props.show) {
            timer = setInterval(() => {
                if (modalTimer === 0) {
                    props.onHide();
                    clearInterval(timer);
                } else {
                    setModalTimer(modalTimer - 1);
                }
            }, 1000); // 1초마다 실행
        } else {
            // 모달이 닫힐 때 타이머 초기화
            setModalTimer(3);
        }

        // 컴포넌트가 언마운트될 때 타이머 초기화
        return () => {
            clearInterval(timer);
        };
    }, [modalTimer, props]);

    return (
        <Modal
            {...props}
            size="lg"
            aria-labelledby="contained-modal-title-vcenter"
            centered
        >
            <Modal.Header>
                <Modal.Title id="contained-modal-title-vcenter">
                    <div> <br></br></div>
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div>
                    <h1>금액별 결제는 최대 10개까지 가능합니다.</h1> <br/>
                    <h1>{modalTimer}초 후에 자동으로 창이 닫힙니다.</h1>
                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={props.onHide}>Close</Button>
            </Modal.Footer>
        </Modal>
    );
}

export default DutchpayByPriceModal;