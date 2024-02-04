import { create } from "zustand";

const useScrollToSubCategoryStore = create((set) => ({
    scrollToSubCategory: (subCategoryName) => {
        // 여기서 스크롤 동작을 처리하도록 수정
        const element = document.getElementById(subCategoryName);
        if (element) {
            element.scrollIntoView({ behavior: 'smooth' });
        }else{
            let top = document.querySelector("#topSection");
            if(top) top.scrollTop = 0;
        }
    },
}));

export default useScrollToSubCategoryStore ;  