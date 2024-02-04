import React, { useEffect, useRef, useState } from "react";
import ReceiptDetailViewl from "./ReceiptDetailViewl";
import { useReceiptStore } from "../store/receiptViewStore";

const transformData = (receiptItems) => {
    if(receiptItems === undefined){
        return [];
    }
        const updatedItems = receiptItems.map(receiptItem => {
            //debugger;
            const updateMenuItems = receiptItem.rmList.map(menu => 
                {
                    const menuPrice = menu.menu?.price || 0;
                    const menuCnt = menu.cnt || 0;
                    return {
                        ...menu,
                        menuAddPrice: menuPrice * menuCnt,
                    }
                });
                const totalPrice = (updateMenuItems.reduce((total, menu) => {
                    const menuTotal = menu.menuAddPrice + menu.roList.reduce((optionTotal, opt) => optionTotal + ( !(opt?.opt?.price) ? 0 : opt?.opt?.price * menu.cnt), 0); 
                    return total + menuTotal;
                    
                }, 0) ) || receiptItem?.pay?.price;
                
                return {
                    ...receiptItem, menuItems: updateMenuItems, totalPrice: parseInt(totalPrice),
                    supplyValue: Math.floor(totalPrice / 1.1), addedTax: totalPrice - Math.floor(totalPrice / 1.1),
                }
            })
            return updatedItems;
}

const ReceiptView = () => {

    // 데이터 확인 확인용
    const { kioskNo, receiptItems, setReceiptItems, setSelectedReceipt, selectedReceipt } = useReceiptStore();
    
    const groupedReceipts = transformData(receiptItems?.rlist);
    // console.log(typeof receiptItems.menuTotal);
    // console.log("야 이게 맞냐....", receiptItems);

    // 수정수정수정

    // 인덱스 번호로 영수증별 상세영수증 조회 필요함
    const handleReceiptClick = (receiptNo) => {
        const selectedReceipt = groupedReceipts?.find(receiptItem => receiptItem.receiptNo === receiptNo);
        console.log(selectedReceipt);
        setSelectedReceipt(selectedReceipt);
    };
    
    useEffect(() => {
      // 장바구니 영수증 보여지게.
      let documentMouseUpHandler = null;
      const mustRemoveEventArray =[];

      function hideAndShow(wrapper, button, className) {
        button.addEventListener('click', function (e) {
          button.classList.add("btn-focus");
          button.children[0].classList.add("btn-focused");
          wrapper.style.display = "block";
          wrapper.classList.add(className);
          button.querySelector('a').style.color = 'black';
        });
        documentMouseUpHandler =  (e) => {
            if (!wrapper.contains(e.target) && wrapper !== e.target) {
              wrapper.style.display = 'none';
              wrapper.classList.remove(className);
              button.classList.remove("btn-focus");
              button.children[0].classList.remove("btn-focused");
              button.querySelector('a').style.color = '';
            }
          }
        document.addEventListener('mouseup', documentMouseUpHandler);
        mustRemoveEventArray.push(documentMouseUpHandler);
      }
      const receipt = document.querySelector(".receipt-wrap");
      hideAndShow(receipt, document.querySelector(".receipt-header-wrap"), 'emphasized');
  
      const receiptDetailButtons = document.querySelectorAll(".receipt-detail-btn");
      const receiptDetailTop = document.querySelector(".receipt-detail-header-wrap");
      const receiptHeaderButton = document.querySelector(".receipt-header-wrap");
  
      hideAndShow(receipt, receiptHeaderButton, 'emphasized');
  
      // 수정================ 반복문 돌려돌려돌림판
      receiptDetailButtons.forEach(receiptDetailButton => {
        receiptDetailButton.addEventListener("click", function () {
          const receiptViews = document.querySelectorAll(".receipt-view");
          for (const view of receiptViews) {
            view.style.display = "none";
          }
          // 반복문 돌린 다음에 상세정보 보이게
          receiptDetailTop.style.display = "block";
        });
      })
      return () => {
        mustRemoveEventArray.forEach( event => {
            document.removeEventListener('mouseup' , event);
        })
    }
    }, [receiptItems, selectedReceipt]);

    return (
        <div>
            <div scrollable="true" emphasizeddiv="true" className="receipt-wrap scrollable">
                {receiptItems == [] ? <div>결제영수증이 없습니다.</div> : 
                <>
                {groupedReceipts && groupedReceipts?.map((receiptItem, index) => (
                    <div key={index} className="receipt-view">
                        <div className="receipt-view-head">
                            <div className="receipt-view-head-controll" >
                                <div >영수증</div>
                                <button className="int receipt-detail-btn" onClick={() => handleReceiptClick(receiptItem?.receiptNo)}>상세보기</button>
                            </div>
                        </div>
                        <div className="receipt-view-body">
                            <div>
                                <span>결제정보 : </span>
                                <span>{receiptItem?.payNo}</span>
                            </div>
                            <div>
                                <span>결제금액 : </span>
                                <span>{receiptItem?.pay?.price?.toLocaleString()}</span>
                            </div>
                        </div>
                    </div>
                ))}
                <ReceiptDetailViewl />
                </>}</div>
        </div>
    );

}

export default ReceiptView;