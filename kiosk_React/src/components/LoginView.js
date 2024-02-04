import React,{useState} from 'react';
import '../resources/css/login.css';
import {useReceiptStore} from '../store/receiptViewStore';
import axios from 'axios';

const LoginView = () => {
    const kioskNo = useReceiptStore((state) => state.kioskNo);
    const setKioskNo = useReceiptStore((state) => state.setKioskNo);
   //const receiptList = useReceiptStore((state) => state.receiptList);
    // const setReceiptList = useReceiptStore((state) => state.setReceiptList);
    const {setReceiptItems} = useReceiptStore();
    const [loginSuccess, setLoginSuccess] = useState(false);
    
    //const {setIsLoggedIn} = prop;

    const handleLogin = (e) => {
        e.preventDefault();
        
        setLoginSuccess(true);

        sessionStorage.setItem('isLoggedIn','true');
        sessionStorage.setItem('kioskNo',kioskNo);
        // 로그인할 때 데이터 넘기게
        axios.post(`/kiosk/receipt/${kioskNo}`).then((response) => {
            // 여기에 데이터?를? 담아줘?
            console.log(11,response.data);
            //setIsLoggedIn('true');
            sessionStorage.setItem('receiptList',JSON.stringify(response.data));
            //setReceiptItems(response.data);
            e.target.submit();
        }).catch((error) => {
            console.error('오오오류류류류', error);
        });
    }

    return (
        <body oncontextmenu='return false' class='snippet-body'>
            <div class="wrapper bg-white">
                <div class="h2 text-center">
                    <img id='header-logo' src={`${process.env.PUBLIC_URL}/forkLogo.PNG`} alt='로고'></img>
                </div>
                <form class="pt-3" onSubmit={handleLogin}>
                    <div class="form-group py-2">
                        <div class="input-field">
                            <span class="far fa-user p-2"></span>
                            <input type="text" placeholder='테이블 번호를 입력하세요' vlaue={kioskNo} onChange={(e) => setKioskNo(e.target.value)} required/>
                        </div>
                    </div>

                    <button class="btn btn-block text-center my-3" >로그인</button>
                </form>
            </div>
        </body>
    );

}

export default LoginView;