import {create} from 'zustand';

const numpadStore = create((set ,get) => ({
  inputId : null , 
  items : [], 
  setItems : (items) => set({items}),
  setInputId : (inputId) =>  set({ inputId }),
  getInputId : () => get().inputId,
  getItems : () => get().items,
}));

export default numpadStore;