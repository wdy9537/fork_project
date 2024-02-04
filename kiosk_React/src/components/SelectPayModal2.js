import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';;

function SelectPayModal2(props) {
  
    // 모달이 닫힐 때 setPayMethod(null) 자동 실행
    const handleCloseModal = () => {
        if (props.onHide) {
            props.onHide();
        }
    };

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
                    결제
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>
            <h3>결제할 금액이 없습니다</h3>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseModal}>Close</Button>
            </Modal.Footer>
        </Modal>
    );

}

export default SelectPayModal2;