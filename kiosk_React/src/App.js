// css
import './resources/css/nav, sidbar, receipt, cart.css';
import './resources/css/kiosk.css';
// components
import { BrowserRouter as Router, Routes, Route, Link   } from 'react-router-dom';
import Headers from './components/Headers';
import Sidebar from './components/Sidebar';
import ReceiptView from './components/ReceiptView';
import CartView from './components/CartView';
import MenuList from './components/MenuList';
import MenuDetail from './components/MenuDetail';
import DutchpayByMenu from './components/DutchpayByMenu';
import DutchpayByPrice from './components/DutchpayByPrice';
import useFullscreen from './components/useFullscreen';
import React, { useEffect, useState } from 'react';
import { useCategoryStore } from './store/mainViewStore';
import { useReceiptStore } from './store/receiptViewStore';
import useModalStore from './store/useModalStore';

import SockJS from 'sockjs-client';
import { Stomp } from '@stomp/stompjs';
import useSocketStore from "./store/socketStore";

// 화면보호기 화면
const standByScreen1 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen1.png')} /></div>
const standByScreen2 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen2.png')} /></div>
const standByScreen3 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen3.png')} /></div>
const standByScreen4 = () => <div id='standByScreen'><img src={require('./resources/image/standByScreen4.png')} /></div>

function App() {
  // interval제거용 배열
  const timerArr = [];

  // 동연 시작  

  // 풀스크린 기능 시작
  const { isFullscreen, enterFullscreen, exitFullscreen } = useFullscreen();

  const toggleFullscreen = () => {
    if (isFullscreen) {
      exitFullscreen();
    } else {
      enterFullscreen();
    }
  };
  // 풀스크린 끝
  
  // 화면보호기 기능 시작
  const [standByScreenIndex, setStandByScreenIndex] = useState(0);
  // 화면보호기 화면 리스트
  const standByScreenList = [
    standByScreen1,
    standByScreen2,
    standByScreen3,
    standByScreen4
  ];
  // 화면 변경
  const changeStandByScreen = () => {
    setStandByScreenIndex((prevIndex) => {
      return (prevIndex + 1) % standByScreenList.length
    });
  };
  // 5초마다 변경
  useEffect(() => {
    const intervalScreen = setInterval(changeStandByScreen, 5000);
    timerArr.push(intervalScreen);
    setStandeByTimer(timerArr);
    // 언마운트 될 때 인터벌 제거
    return () => {
      clearInterval(intervalScreen);
    }

  }, []);

  const [standByScreen, setStandByScreen] = useState(false);
 
  const {setStandeByTimer , getStandeByTimer} = useModalStore();

  useEffect(  () => {
    let standeByTimer;
    const resetStandByTimer = () => {
      // 해당 시간동안 동작이 없으면 실행
      standeByTimer = setTimeout(() => {
        setStandByScreen(true);
      }, 2 * 100 * 100);
      timerArr.push(standeByTimer);
      setStandeByTimer(timerArr);
    };

    const handleUserUsing = () => {
      // 사용자가 사용시 타이머 재설정
      clearTimeout(standeByTimer);
      timerArr.pop();
      setStandByScreen(false);
      resetStandByTimer();
    };

    // 화면이 처음 로드될때 타이머 설정
    resetStandByTimer();

    // 사용자가 사용하고 타이머 재설정
    document.addEventListener('click', () => {

      let timer = setTimeout(() => {
        handleUserUsing()
      }, 100)
      timerArr.push(timer);
      setStandeByTimer(timerArr);
    });

    const deleteFullScreen = () => {
      getStandeByTimer()?.forEach( timer =>clearTimeout(timer))
    }
    document.addEventListener('keydown', handleUserUsing);
    document.addEventListener('click',deleteFullScreen);
    // 언마운트될때 이벤트 제거
    return () => {
      document.removeEventListener('click', handleUserUsing);
      document.removeEventListener('keydown', handleUserUsing);
      document.removeEventListener('click', deleteFullScreen);
      clearTimeout(standeByTimer);
    };
  }, [standByScreen]);

  // 화면보호기 끝

  // 동연 끝
  
  // 서뉴 시작
  
  const getCategory = useCategoryStore((state) => state.getCategory);
  const setSubCategory = useCategoryStore((state) => state.setSubCategory);
  
  useEffect( () => {
    const fetchData = async () => {
      await getCategory();
      await setSubCategory(1);
    }
    fetchData();

    // 장바구니 영수증 보여지게.
    function hideAndShow(wrapper, button, className) {
      button.addEventListener('click', function (e) {
        button.classList.add("btn-focus");
        button.children[0].classList.add("btn-focused");
        wrapper.style.display = "block";
        wrapper.classList.add(className);
        button.querySelector('a').style.color = 'black';
      });

      document.addEventListener('mouseup', function (e) {
        if (!wrapper.contains(e.target) && wrapper !== e.target) {
          wrapper.style.display = 'none';
          wrapper.classList.remove(className);
          button.classList.remove("btn-focus");
          button.children[0].classList.remove("btn-focused");
          button.querySelector('a').style.color = '';
        }
      });
    }

    const cart = document.querySelector(".cart-wrap");
    hideAndShow(cart, document.querySelector(".cart-header-wrap"), 'emphasized');

  }, []);

  //headers에 있던거 옮김
  const {stompClient , setStompClient} = useSocketStore();
  const kioskNo = useReceiptStore((state) => state.kioskNo);

  useEffect(() => {
      // 스프링 부트 서버의 SockJS 엔드포인트 URL
      const createWebSocket = () => new SockJS('http://192.168.30.14:8083/kiosk/user'); // 스프링 부트 서버 주소로 변경
      const stompClient = Stomp.over(createWebSocket); // 최적화 1) 연결종료시 재연결할수있는 웹소켓 생성 팩토리 전달

      stompClient.connect({}, (frame) => {
          console.log("웹소켓 연결", frame);
        // 여기서 컨트롤러로 연결 여러개 추가 가능
          stompClient.subscribe( `/kiosk/clearTable/${kioskNo}` ,frame => {
            console.log(frame.body);
          });
          stompClient.subscribe( `/kiosk/end/${kioskNo}` ,frame => {
            console.log(frame.body);
          });
          stompClient.subscribe( `/kiosk/${kioskNo}` ,frame => {
            alert("잘 받음");
          });
          // stompClient.send(`/user/send/${kioskNo}`,{} , '잘가니가니??');
          setStompClient(stompClient);
      });
      
      return () => {
          console.log('연결해제')
          stompClient.disconnect();
      }
  },[]);

  // 선유 끝

  return (
    <>
      {standByScreen && (
        <div className='screenContainer'>
          {standByScreenList.map((Screen, index) => (
            <div
              key={index}
              className={`screen ${index === standByScreenIndex ? 'slide-in' : 'slide-out'}`}
            >
              <Screen />
            </div>
          ))}
        </div>
      )}

      <Router>
        {/* 전체화면 보기 버튼 */}
        {isFullscreen ? null : (
          <button onClick={toggleFullscreen}>
            전체화면으로 보기
          </button>
        )}
      
        <div className="main-wrap">
          <Headers />
          <div className="body-wrap">
            <Sidebar />
            <ReceiptView />
            <CartView />
            <Routes>
              <Route path='/' element={<MenuList />} />
              <Route path='/menuDetail' element={<MenuDetail />} />
              <Route path='/dutchpayByMenu' element={<DutchpayByMenu />} />
              <Route path='/dutchpayByPrice' element={<DutchpayByPrice />} />
            </Routes>
          </div>
        </div>
      </Router>

    </>
  );
}

export default App;
