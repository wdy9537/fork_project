import { Link } from 'react-router-dom';
import { useCategoryStore } from '../store/mainViewStore';
import React, { useEffect } from 'react';
import useScrollToSubCategoryStore from '../store/scrollListStore';

const MenuList = () => {
    const subCategorys = useCategoryStore((state) => state.subCategorys);
    const springUrl = 'http://192.168.30.14:8082/user';

    // 헤더에서 카테고리 클릭시 해당 카테고리로 스크롤
    const subCategoryRefs = {};
    const { scrollToSubCategory } = useScrollToSubCategoryStore();
    useEffect(() => {
        for (const subCategoryName in subCategoryRefs) {
            if (subCategoryRefs.hasOwnProperty(subCategoryName)) {
                scrollToSubCategory(subCategoryName, subCategoryRefs[subCategoryName]);
            }
        }
    }, [scrollToSubCategory, subCategoryRefs]);

    return (
        <div className="content-wrap" id='topSection'>
            <div className="main-content">
                <div className="main-content-menu">
                    {subCategorys && subCategorys.map(subCategory => {
                        return (
                            <div key={subCategory.categoryName}>
                                <div className="page-head" id={subCategory.categoryName} ref={subCategoryRefs[subCategory.categoryName]}>
                                    <p className="main-content-detail-category">{subCategory.categoryName}</p>
                                </div>
                                <div className="menu-list">
                                    {subCategory.menuList && subCategory.menuList.map(menu => {
                                        return (
                                            <ul key={menu.menuName}>
                                                <Link to="menuDetail" state={menu}>
                                                    <li><img src={springUrl + menu.filePath + menu.changeName} alt="메뉴사진" onError={(e) => { e.target.src = require('../resources/image/defaultimg.jpg') }} /></li>
                                                    <li>{menu.menuName}</li>
                                                    <li>{menu.price.toLocaleString('ko-KR')} 원</li>
                                                </Link>
                                            </ul>
                                        )
                                    })}
                                </div>
                            </div>
                        )
                    })}
                </div>
            </div>
        </div>
    );
}

export default MenuList;