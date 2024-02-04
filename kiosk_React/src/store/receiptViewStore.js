
import { create } from 'zustand';

export const useReceiptStore = create( (set ,get) => ({
    kioskNo : sessionStorage.getItem('kioskNo') == null ? null : sessionStorage.getItem('kioskNo'),
    setKioskNo : (kioskNo) => set({kioskNo}),
    receiptItems : sessionStorage.getItem('receiptList') == [] || sessionStorage.getItem('receiptList') == null ? [] :  JSON.parse(sessionStorage.getItem('receiptList')),
    setReceiptItems : (receiptItems) => set({receiptItems}),
    selectedReceipt: [],
    setSelectedReceipt : (selectedReceipt) => set({selectedReceipt}),

}));