import { create } from 'zustand';
const useSocketStore = create((set, get) => ({
    stompClient : null,
    setStompClient : (stompClient) => set({stompClient})
}));

export default useSocketStore;