import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import LoginView from './components/LoginView';

const root = ReactDOM.createRoot(document.getElementById('root'));
const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true';

root.render(
    <>
        {isLoggedIn ? <App /> : <LoginView />}
    </>
);


