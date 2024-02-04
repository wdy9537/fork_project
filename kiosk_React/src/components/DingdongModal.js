import React, { useState, useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';

function Dingdong(props) {

    const [modalTimer, setModalTimer] = useState(10); // 모달 시간 설정

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
            setModalTimer(10);
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
                    직원호출
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div>
                    <h1>직원을 호출하셨습니다.</h1> <br />
                    <h1>잠시만 기다려주세요.</h1> <br />
                    <h1>{modalTimer}초 후에 자동으로 창이 닫힙니다.</h1>
                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => { props.onHide();}}>Close</Button>
            </Modal.Footer>
        </Modal>
    );
}

export default Dingdong;