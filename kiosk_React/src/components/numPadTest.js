import Keyboard from "react-simple-keyboard";
import "react-simple-keyboard/build/css/index.css";
import numpadStore from '../store/numpadStore';
import { useState , useRef } from "react";
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
const Numpad = (props) => {

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const { getInputId , getItems , setItems } = numpadStore();
    //총 금액 얻어와서 결제할수 있는 금액을 제한
    const keyboard = useRef();

    const [inputPrice, setInputPrice] = useState(0); // 클릭한 금액의 값으로

    // 숫자 버튼 클릭 시 실행되는 함수
    const onChange = (number) => {
        setInputPrice((prevInputPrice) => number);
    };

    // 입력값을 지우는 함수
    const handleClear  = () => {
        setInputPrice("");
        keyboard?.current?.clearInput();
    };

    const handleCloseModal = () => {
        // 타이머가 실행 중이면 클리어
        handleClear();
        props.onHide();
    };

    const onSubmitHandler = (e) => {
        const itemId = getInputId();
        
        const items = getItems();
        let inputCheck = true;
        const updatedItems = items.map((item) => {
            if (item.id == itemId) {
                if(item.maximumPrice <inputPrice){
                    handleShow();
                    inputCheck = false;
                    return item;
                }
                return { ...item, price: Number(inputPrice) };
            }
            return item;
        })
        setItems(updatedItems);

        if(inputCheck){
            handleCloseModal();
        } else{
            handleClear();
        }     
      };


    const onKeyPress = (button) => {
        if (button === "{clear}") {
            handleClear();
            return;
        }

        if (button === "{bksp}") {
            setInputPrice( inputPrice.toString().substring(0, inputPrice.toString().length -2 ) );
            return 
        }
      };


    return (
        <>
            <Modal
                {...props}
                size="sm"
                aria-labelledby="contained-modal-title-vcenter"
                centered
                // 모달이 닫힐 때 resetPayMethod 함수 호출
                onHide={handleCloseModal}
            >
                <Modal.Header>
                    <Modal.Title id="contained-modal-title-vcenter">
                        금액별 결제
                        <input type="text" value={inputPrice} />
                    </Modal.Title>
                </Modal.Header>
                <Modal.Body>

                    <Keyboard
                        keyboardRef={(r) => (keyboard.current = r)} 
                        theme={
                            "hg-theme-default hg-theme-numeric hg-layout-numeric numeric-theme"
                        }
                        layout={{
                            default: ["1 2 3", "4 5 6", "7 8 9", "{clear} 0 {bksp}"]
                        }}
                        mergeDisplay
                        display={{
                            "{clear}": "Clear",
                            "{bksp}": "&#8592"
                        }}
                        maxLength={9}
                        onChange={(number) => onChange(number)}
                        onKeyPress={(button) => onKeyPress(button)}
                    />

                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={onSubmitHandler}>Submit</Button>
                    <Button variant="secondary" onClick={handleCloseModal}>Close</Button>
                </Modal.Footer>
            </Modal>

            <Modal show={show} onHide={handleClose} size="lg" aria-labelledby="contained-modal-title-vcenter" centered>
                <Modal.Header closeButton>
                <Modal.Title><br></br></Modal.Title>
                </Modal.Header>
                <Modal.Body><div style={{"font-size":"1.5vw"}}>입력하신 금액과 총결제 금액이 일치하지 않습니다.</div></Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    닫기
                </Button>
                </Modal.Footer>
            </Modal>
        </>
    )
}

export default Numpad;
