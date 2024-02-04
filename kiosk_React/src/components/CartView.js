import React, { useEffect, useRef, useState } from "react";
import SelectPayModal from './SelectPayModal';
import Button from 'react-bootstrap/Button';
import useCartStore from '../store/cartStore';
import SelectPayModal2 from './SelectPayModal2';

const CartView = () => {

    const springUrl = 'http://192.168.30.14:8082/user';

    // 결제 모달
    const [modalShow, setModalShow] = useState(false);
    const [modalShow2, setModalShow2] = useState(false);
    const {cartItems, setCartItems , cartTotalPrice, setCartTotalPrice, restoreCartFromLocalStorage } = useCartStore();
    // {
    //얻어온 데이터를 바탕으로 메뉴정보 보여주기 
    // 메뉴정보 : 메뉴 이미지, 메뉴이름, total가격 , 옵션리슽, 개수
    //동일한 메뉴, 옵션들 인 경우 개수 증가
  
    const min = 1;
    const max = 10;
    const [count, setCount] = useState(1);
    // const [cartItems, setCartItems] = useState([

    const removeCartItem = (itemId) => {
        const removedItem = cartItems.find(item => item.id === itemId);
        if(removedItem) {
            const newTotalPrice = cartTotalPrice - removedItem.addPrice * removedItem.count;
            console.log("removedItem", removedItem.addPrice*removedItem.count);
            setCartTotalPrice(newTotalPrice);
        }
        
        const cartItemsresult = cartItems.filter(item => item.id !== itemId)
        setCartItems(cartItemsresult);
    };

    const decreaseCount = (itemId) => {
        const cartItemsresult = cartItems.map(item => {
            if (item.id === itemId) {
                const newTotalPrice = item.totalPrice - item.addPrice;
                setCartTotalPrice(cartTotalPrice - item.addPrice);
                return item.count > min ? { ...item, count: item.count - 1, totalPrice : newTotalPrice } : null;
            } else {
                return item;
            }
        }).filter(item => item !== null);
        setCartItems(cartItemsresult);
    }

    const increaseCount = (itemId) => {
        const cartItemsresult =  cartItems.map(item => {
                if (item.id === itemId && item.count < max) {
                    const newTotalPrice = item.totalPrice + item.addPrice;
                    setCartTotalPrice(cartTotalPrice + item.addPrice);
                    return { ...item, count: item.count + 1, totalPrice : newTotalPrice };
                }
                return item;
            })
        setCartItems(cartItemsresult);
    }

    useEffect(() => {
        restoreCartFromLocalStorage();
    },[]);

    return (
        <>
            <div className="cart-wrap">
                <form className="cart-form">
                    <div className="cart-view ">
                        {cartItems.length === 0 ? (
                            <div className="empty-cart-message">
                                장바구니가 비어있습니다.
                            </div>
                        ) : (
                            <div className="">
                                {cartItems.map(item => (
                                    <div key={item.id} className="cart-order-wrap">
                                        <div className="cart-menu-pic">
                                            <img src={springUrl + item.filePath + item.changeName} alt="메뉴사진" onError={(e) => {e.target.src = require('../resources/image/defaultimg.jpg')}}/>
                                        </div>
                                        <div className="cart-menu-details">
                                            <div className="cart-menu-name">
                                                <span className="cart-menu-name-1">{item.menuName}</span>
                                                <span className="cart-menu-name-2"> {item.totalPrice.toLocaleString('ko-KR')}원 </span>
                                                <span onClick={() => removeCartItem(item.id)}>
                                                    <img className="close int" src={require('../resources/image/closeLogo6.png')} alt="닫기"/>
                                                </span>
                                            </div>
                                            <div className="cart-menu-option">
                                                {item.selectedOption.map((option) => (
                                                    <div>
                                                    {`-${option.prOptionName} ${option.optionName} ${option.price.toLocaleString('ko-KR')}원`}
                                                    </div>
                                                ))}
                                            </div>
                                            <div className="count-wrap _count">
                                                <button type="button" className="minus int" onClick={() => decreaseCount(item.id)}>-</button>
                                                {item.count > 10 ? alert("ddddd") :
                                                    <input type="text" className="inp" value={item.count} readOnly />}
                                                <button type="button" className="plus int" onClick={() => increaseCount(item.id)}>+</button>
                                            </div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                        {/* {cartTotalPrice ? (
                        <div className="cartview-total-price">총합 : {cartTotalPrice.toLocaleString('ko-KR')}원</div>
                        ) : null} */}
                    </div>
                    <div className="cart-order">
                        <Button id="button-coo" variant="light" onClick={() => {
                            if(cartTotalPrice){
                                setModalShow(true)
                            }else{
                                setModalShow2(true)
                            }}
                    }> {cartTotalPrice.toLocaleString('ko-KR')}원 결제하기 </Button>
                        <SelectPayModal show={modalShow} onHide={() => setModalShow(false)} />
                        <SelectPayModal2 show={modalShow2} onHide={() => setModalShow2(false)} />
                    </div>
                </form>
            </div>
        </>
    );
}

export default CartView;