import axios from 'axios';
import { create } from 'zustand';

export const useCategoryStore = create( (set ,get) => ({
    categorys : [],
    subCategorys : [],
    menus : [],
    getCategory :  async () => {
      const categorys = get().categorys.length == 0 ?  
                        (await axios.get('/kiosk/category')).data
                        : get().categorys;

      set({categorys});
      //this.getSubCategory(1);
      return categorys;
    },
    setSubCategory : async (categoryNo) => {
        const subCategorys = await get().categorys.find( (category) => category.categoryNo == categoryNo).categoryList;
        set({subCategorys});

        const menus =  subCategorys.reduce(
            (menus, cate) => {
                return [...menus ,cate.menuList];
            }, []
        ).flat();
        set({menus});
    },
    setMenus : (categoryNo) => {
        const menus = get().subCategorys.find( (category) => category.categoryNo == categoryNo).menuList;
        set({menus});
    }
  }));

