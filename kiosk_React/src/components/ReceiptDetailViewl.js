import React, { useEffect, useRef, useState } from "react";
import { useReceiptStore } from "../store/receiptViewStore";
const ReceiptDetailViewl = () => {
    const receiptItem = useReceiptStore((store) => store.selectedReceipt);
    // console.log(receiptItem);
    // 영수증 목록들
    /*
    필요 연결 테이블 옵션OPT, 메뉴MENU, 결제PAY, 영수증RECEIPT. 영수증+메뉴(영수증별 메뉴 상세)RECEIPT_MENU
    영수증 메뉴+옵션(메뉴별 옵션 상세)RECEIPT_OPTION
    */
    // const { receiptItem } = props;

    // 통화단위 콤마찍기
    function formatCurrencyToKRW(number) {
        return new Intl.NumberFormat('ko-KR', {
            style: 'currency',
            currency: 'KRW'
        }).format(number);
    }

    const handleCloseReceipt = () => {
        const receiptDetailTop = document.querySelector(".receipt-detail-header-wrap");
        receiptDetailTop.style.display = "none";

        // 닫기 버튼 누르면 다시 영수증 목록 보이게 반복문 돌려돌려
        const receiptViews = document.querySelectorAll(".receipt-view");
        for (const view of receiptViews) {
            view.style.display = "block";
        }
    }

    // console.log(receiptItem); 왜때문에 빈배열;;;
    return (
        <div className="receipt-detail-header-wrap scrollable">
            <div key={receiptItem?.receiptNo}>
                <div className="receipt-detail-top">
                    <div className="receipt-detail-top-1">
                        <div colSpan="3">주문내역</div>
                        <div>
                            <img onClick={handleCloseReceipt} className="close int"
                                src={require('../resources/image/closeLogo6.png')} alt="닫기" />
                        </div>
                    </div>
                    <div className="receipt-detail-top-2">
                        <div>
                            <div colSpan="4">사업장 이름</div>
                        </div>
                        <div>
                            <div colSpan="4">동동포차</div>
                        </div>
                        <div>
                            <div colSpan="4">사업자 번호 : <span className="">123-45-67890</span></div>
                        </div>
                        <div>
                            <div colSpan="2" className="receipt-detail-top-2-1">{receiptItem?.payDate}</div>
                        </div>
                    </div>
                </div>
                <div className="receipt-detail-mid">
                    <div className="receipt-detail-mid-1">
                        <div>메뉴명</div>
                        <div>단가</div>
                        <div>수량</div>
                        <div>금액</div>
                    </div>
                    {(receiptItem?.menuItems || [])?.map((receiptItem, index) => (

                        <div key={index} className="menu-item">
                            <div className="receipt-detail-mid-2">
                                <div className="receipt-deail-mid-2-1">
                                    {receiptItem?.menu?.menuName ? 
                                        <>
                                        <div>{receiptItem?.menu?.menuName}</div>
                                        <div>{receiptItem?.menu?.price?.toLocaleString()}</div>
                                        <div>{receiptItem?.cnt == 0 ? null : receiptItem?.cnt}</div>
                                        <div>{receiptItem?.menuAddPrice?.toLocaleString() + "원" == "0원" ? null : receiptItem?.menuAddPrice?.toLocaleString() + "원"}</div>
                                        </>
                                     : <div className="information">금액별 결제입니다. 총 영수증을 확인해주세요</div>}
                                </div>
                                {(receiptItem?.roList || [])?.map((option, index) => (
                                    <div key={index} className="receipt-deail-mid-2-1 receipt-deail-mid-2-2">
                                        {option?.opt?.optionName === null ? <div></div> :
                                            <div>{option?.opt?.optionName}</div>
                                        }
                                        <div>{option?.opt?.price?.toLocaleString()}</div>
                                        <div></div>
                                        {/* 수량 입력하는곳 생각해보니까 메뉴와 옵션이 모두 같을 때 옵션 개수를? 굳이... 굳이.... */}
                                        {(option?.opt?.price) ? (
                                            <div>{(option?.opt?.price * receiptItem?.cnt)?.toLocaleString()}</div>
                                        ) : <div></div>}
                                    </div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
                <div className="receipt-detail-last">
                    <div className="receipt-detail-last-1">
                        <div className="receipt-detail-last-1-1">
                            <div>주문합계</div>
                            <div colSpan="3">{receiptItem?.totalPrice?.toLocaleString()}</div>
                        </div>
                        <div className="receipt-detail-last-1-1">
                            <div>공급가액</div>
                            <div colSpan="3">{receiptItem?.supplyValue?.toLocaleString()}</div>
                        </div>
                        <div className="receipt-detail-last-1-1">
                            <div>부가세</div>

                            <div colSpan="3">{receiptItem?.addedTax?.toLocaleString()}</div>
                        </div>
                    </div>
                </div>
                <div className="receipt-detail-last-3">
                    <div>Total</div>
                    <div colSpan="3">{formatCurrencyToKRW(receiptItem?.totalPrice)}</div>
                </div>
            </div>
        </div>
    );
}

export default ReceiptDetailViewl;