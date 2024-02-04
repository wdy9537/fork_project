import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { Link } from 'react-router-dom';
import { useState, useEffect } from 'react';
import { paymentModalStore } from '../store/paymentModalStore';

function DutchpaySelectPayModal(props) {
    const { selectedPaymentMethod, setSelectedPaymentMethod, resetSelectedPaymentMethod } = paymentModalStore();
    const [modalTimer, setModalTimer] = useState(3); // 초 단위로 설정
    const [timer, setTimer] = useState(null);


    // 모달이 닫힐 때 setPayMethod(null) 자동 실행
    const handleCloseModal = () => {
        // 타이머가 실행 중이면 클리어
        if (timer) {
            clearInterval(timer);
        }
        setSelectedPaymentMethod(null);
        if (props.onHide) {
            props.onHide();
        }
        setModalTimer(3);
    };

    // 현금결제가 선택되었을 때 3초 후에 handleCloseModal 함수 실행
    useEffect(() => {
        if (selectedPaymentMethod === "현금결제") {
            const newTimer = setInterval(() => {
                setModalTimer((prevTime) => {
                    if (prevTime === 1) {
                        // 시간이 만료되면 모달을 닫음
                        clearInterval(newTimer);
                        handleCloseModal();
                        console.log(props);
                        return 3;
                    }
                    return prevTime - 1;
                });
            }, 1000); // 1초마다 실행

            // 타이머 ID 저장 
            setTimer(newTimer);

            return () => clearInterval(newTimer); // 컴포넌트가 언마운트되면 타이머 클리어
        }
    }, [selectedPaymentMethod, modalTimer]);
    
    return (
        <Modal
            {...props}
            size="lg"
            aria-labelledby="contained-modal-title-vcenter"
            centered
            // 모달이 닫힐 때 resetPayMethod 함수 호출
            onHide={handleCloseModal}
        >
            <Modal.Header>
                <Modal.Title id="contained-modal-title-vcenter">
                    {selectedPaymentMethod === "현금결제" || selectedPaymentMethod === "카드결제" ? "결제" : <br />}
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>

                <div className='selectPayModal2'>

                    {selectedPaymentMethod === '카드결제' && (
                        <div className='cardPayWrap'>
                            <h3 className="cardPay">ic 카드를 리더기에 넣어주세요</h3>
                            <p className="cardPay">
                                <img src={require('../resources/image/insert-card2.png')} />
                            </p>
                        </div>
                    )}

                    {selectedPaymentMethod === '현금결제' && (
                        <div>
                            <h1>직원이 현금을 받으러 갑니다.</h1> <br />
                            <h1>현금을 미리 준비해주세요.</h1> <br />
                            <h1>{modalTimer}초 후에 자동으로 창이 닫힙니다.</h1>
                        </div>
                        
                    )}

                    {selectedPaymentMethod === "최대개수" && (
                        <div>
                            <h1>금액별 결제는 최대 10개까지 가능합니다.</h1> <br />
                        </div>
                    )}
                </div>

            </Modal.Body >
            <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseModal}>Close</Button>
            </Modal.Footer>
        </Modal >
    );
}

export default DutchpaySelectPayModal;