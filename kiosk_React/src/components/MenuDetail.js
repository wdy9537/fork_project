import { useEffect, useState } from 'react';
import CooModal from './CooModal';
import Button from 'react-bootstrap/Button';
import ButtonGroup from 'react-bootstrap/ButtonGroup';
import DropdownButton from 'react-bootstrap/DropdownButton';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import DropdownItem from 'react-bootstrap/esm/DropdownItem';
import useCartStore from '../store/cartStore';
import useModalStore from '../store/useModalStore';

const MenuDetail = (props) => {

    // 원산지 모달
    const [modalShow, setModalShow] = useState(false);
    const {standeByTimer , setStandeByTimer , getStandeByTimer} = useModalStore();

    // 나가기 버튼
    const navigate = useNavigate();
    const exit = () => {
        navigate(-1);
    }

    // 메뉴리스트에서 값을 받아옴
    const location = useLocation();
    const menu = location.state;
    const springUrl = 'http://192.168.30.14:8082/user';
    // 선택된 옵션 담아주기
    const [selectedOption, setSelectedOption] = useState([]);
    const [totalPrice, setTotalPrice] = useState(menu.price);

    const menuItem = {
        ...menu,
        selectedOption,
        totalPrice,
        addPrice: totalPrice,
        count: 1,
    };
    const {cartItems, setCartItems , cartTotalPrice,  setCartTotalPrice} = useCartStore();
    const addToCart = useCartStore((state) => state.addToCart);

    const handleAddToCart = (menuItem) => {
        // 담기하면 카트스토어에 담기
        // 일치하는 메뉴가 있는지 확인해서 count+1 해주기
        const existingItem = cartItems.find(item => {
            return (
                item.menuNo === menuItem.menuNo &&
                JSON.stringify(item.selectedOption) === JSON.stringify(menuItem.selectedOption)
            );
        });
    
        if (existingItem) {
            existingItem.count++;
            existingItem.totalPrice += menuItem.totalPrice;
            setCartTotalPrice(cartTotalPrice+menuItem.totalPrice)
            setCartItems([...cartItems]);
        } else {
            addToCart(menuItem);
        }
    };

    useEffect(() => {
        const totalPrice = menu.price + selectedOption.reduce((optionTotal, opt) => optionTotal + (!(opt.price) ? 0 : opt.price), 0);
        setTotalPrice(totalPrice);
    })

    const handleSelectedOption = (opt, options) => {
        const updateSelectedOption = selectedOption.filter((_opt) => _opt.prOptionNo !== opt.prOptionNo);
        opt.prOptionName = options.optionName;
        setSelectedOption([...updateSelectedOption, opt]);
    }

    function findSubOption(opt) {
        return selectedOption.find((_opt) => _opt.prOptionNo === opt.optionNo)
    }
    return (
        <div className="content-wrap">
            <div className="main-content">
                <div className="main-content-detailmenu">
                    <div className="page-head">
                        <div className="page-head-title">
                            <p className="main-content-detail-category">상세정보</p>
                        </div>
                        <div className="page-head-button">
                            <Button id="button-coo" variant="secondary" onClick={() => setModalShow(true)}> 원산지 </Button>
                            <CooModal show={modalShow} onHide={() => setModalShow(false)} />
                            <Button id="button-prev" variant="secondary" onClick={exit}> 나가기 </Button>
                        </div>
                    </div>
                    <div className="detailmenu-content">
                        <div className="detailmenu-content-left">
                            <img src={springUrl + menu.filePath + menu.changeName} alt="메뉴사진" onError={(e) => { e.target.src = require('../resources/image/defaultimg.jpg') }} />
                            <ul>
                                <li>
                                    {menu.menuDetail}
                                </li>
                            </ul>
                        </div>
                        <div className="detailmenu-content-right">
                            <div className="detailmenu-menuname">
                                <ul>
                                    <li>{menu.menuName}</li>
                                    <li>{menu.price.toLocaleString('ko-KR')} 원</li>
                                </ul>
                            </div>
                            <div className="detailmenu-option">
                                <div className="detailmenu-option-list">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th colSpan="3">옵션선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {menu.optList[0].optList.length > 0 ? (menu.optList.map((options) => {
                                                return (
                                                    <tr>
                                                        <td>{options.optionName}</td>
                                                        <td id='dropdownbtn'>
                                                            {/* <DropdownButton as={ButtonGroup} key={options.optionNo} id={'dropdown-variants-' + options.optionName} title={prOptionName[options.optList.optionName] || options.optionName} variant='secondary'> */}
                                                            {/* <DropdownButton as={ButtonGroup} key={options.optionNo} id={'dropdown-variants-' + options.optionName} title={selectedOptionName[options.optList.optionName]?.optionName || options.optionName} variant='secondary'> */}
                                                            <DropdownButton as={ButtonGroup} key={options.optionNo} id={'dropdown-variants-' + options.optionName}
                                                                title={findSubOption(options) ? findSubOption(options).optionName : options.optionName} variant='secondary'>
                                                                {options && options.optList.map(opt => {
                                                                    return (
                                                                        <DropdownItem onClick={() => { handleSelectedOption(opt, options) }}>
                                                                            {opt.optionName}
                                                                        </DropdownItem>
                                                                    );
                                                                })}
                                                            </DropdownButton>
                                                        </td>
                                                        <td>{findSubOption(options) ? "+ " + findSubOption(options).price.toLocaleString('ko-KR') + '원' : ""}</td>
                                                    </tr>
                                                )
                                            })) : (
                                                <tr>
                                                    <td colSpan="2">
                                                        해당 메뉴는 옵션이 없습니다.
                                                    </td>
                                                </tr>
                                            )
                                            }
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td>총 금액 : </td>
                                                <td></td>
                                                <td>{totalPrice.toLocaleString('ko-KR')}원</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div className="detailmenu-option-button">
                                    <Link to='/' ><Button id="button-prev" variant="secondary" onClick={() => handleAddToCart(menuItem)}> 담기 </Button></Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default MenuDetail;