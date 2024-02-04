import { create } from "zustand";

const paymentProcessStore = create((set, get) => ({
    paymentProcess : false,
    setPaymentProcess : (paymentProcess) => {set({paymentProcess})},
    getPaymentProcess : () => {
        return get().paymentProcess;
    }
}))

export default paymentProcessStore;