import { create } from "zustand";

const useCartStore = create((set, get) => ({
    cartItems : [],
    cartId : 0,
    cartTotalPrice : 0,
    setCartTotalPrice : (cartTotalPrice) => set({cartTotalPrice}),
    setCartItems : (cartItems) => {
        set({cartItems});
       // get().saveCartToLocalStorage();
    },
    // setSelectedPaymentMethod: (method) => set({ selectedPaymentMethod: method }),
    addToCart : (menuItem) => {
        // menuItem.id = await get().cartId;
        // set((state) => ({...state , cartId : state.cartId +1}))
        set((state) => {
            let cartTotalPrice = state.cartItems.reduce((prev , curr) => prev + curr.totalPrice , 0);
            const newItem = {...menuItem, id: state.cartId};
            cartTotalPrice = cartTotalPrice + newItem.totalPrice;
            return {cartItems: [...state.cartItems, newItem], cartId: state.cartId+1 , cartTotalPrice};
        })
       //get().saveCartToLocalStorage();
    },
    resetCartStore : () =>  set({ cartItems: [], cartId: 0, cartTotalPrice: 0 }),
    setNewCartAfterDutchByMenu : (menu, menuTotalPrice) => {
        set((state) => {
            // 메뉴 매개변수와 일치하는 항목을 cartItems에서 필터링하여 제거합니다.
            const updatedCartItems = state.cartItems.filter((item) => {
                return item.menuNo !== menu.menuNo || item.totalPrice !== menuTotalPrice;
            });
    
            // menuTotalPrice를 뺀 새로운 cartTotalPrice를 계산합니다.
            const newCartTotalPrice = state.cartTotalPrice - menuTotalPrice;
    
            return { cartItems: updatedCartItems, cartId: state.cartId, cartTotalPrice: newCartTotalPrice };
        });
        return get().cartItems;
    },

    saveCartToLocalStorage : () => {
        const {cartItems, cartId, cartTotalPrice } = get();
        const cartData = {cartItems, cartId, cartTotalPrice};
        localStorage.setItem("cartData", JSON.stringify(cartData));
    },

    restoreCartFromLocalStorage: () => {
        const savedCartData = localStorage.getItem("cartData");
        if(savedCartData) {
            const {cartItems, cartId, cartTotalPrice} = JSON.parse(savedCartData);
            set({ cartItems, cartId, cartTotalPrice});
        }
    }
}));

export default useCartStore;