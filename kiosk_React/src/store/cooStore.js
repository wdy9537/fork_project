import { create } from 'zustand';
import axios from 'axios';

const useCooStore = create((set, get) => ({
    cooList: [],
    getCoo: async() => {
    const cooList = get().cooList.length == 0 ?
        (await axios.get('/kiosk/coo')).data
        : get().cooList;

    set({ cooList });

    return cooList;
    }
}))

export default useCooStore;