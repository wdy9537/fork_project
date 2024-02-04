import { create } from 'zustand';
import axios from 'axios';

const useSaveData = create((set, get) => ({
    // 기본결제시
    basicPay: async (kioskNo, cartItems, cartTotalPrice) => {
        let result = await axios.post("http://192.168.30.14:3000/kiosk/basicPay/"+kioskNo , {cartItems , cartTotalPrice} )
            .then( (response) => {
                if(response.data > 0){
                    console.log('결제 성공');
                    return response.data;
                } else {
                    console.log('결제 실패');
                    return 0;
                }
            }).catch( (error) => {
                console.log(error);
                return 0;
            });
        return result;
    },
    // 분할결제시
    dutchPay: async (kioskNo, cartItems, totalPrice) => {
        let result = await axios.post("http://192.168.30.14:3000/kiosk/dutchPay/"+kioskNo , {cartItems , totalPrice})
            .then( (response) => {
                if(response.data > 0){
                    console.log('결제 성공');
                    // 영수증번호 return
                    return response.data;
                } else {
                    console.log('결제 실패');
                    return 0;
                }
            }).catch( (error) => {
                console.log(error);
                return 0;
            });
        return result;
    },
}));

export default useSaveData;