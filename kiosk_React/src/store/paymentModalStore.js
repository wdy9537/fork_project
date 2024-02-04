import { create } from "zustand";

export const paymentModalStore = create((set, get) => ({
    selectedPaymentMethod: null,
    setSelectedPaymentMethod: (method) => {
        set({ selectedPaymentMethod: method })
    },
    resetSelectedPaymentMethod: () => set({ selectedPaymentMethod: null }),
    totalCashPrice : 0,
    setTotalCashPrice : (totalCashPrice) => set({totalCashPrice}),
    getTotalCashPrice : () => get().totalCashPrice,
}));