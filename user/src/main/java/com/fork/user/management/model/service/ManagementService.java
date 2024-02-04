package com.fork.user.management.model.service;

import java.util.List;
import java.util.Map;

import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.CategoryList;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.License;
import com.fork.user.management.model.vo.LicenseHistory;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;
import com.fork.user.management.model.vo.OptionList;

public interface ManagementService {

	int insertCategory(Category category);

	int insertMenu(Menu menu);

	List<Category> selectCategoryList();

	int insertOption(Option option);

	List<Option> selectOptionList();

	int insertCoo(Coo coo);

	int deleteCoo(int cooNo);

	List<Category> selectCategory(int currentPage, Map<String, Object> paramMap);

	int selectCategoryCount(Map<String, Object> paramMap);

	List<Coo> selectCoo(int currentPage, Map<String, Object> paramMap);

	int selectCooCount(Map<String, Object> paramMap);

	int updateCategory(Category category);

	Category selectCategoryOne(int categoryNo);

	int deleteCategory(int categoryNo);

	List<OptionList> selectOption(int currentPage, Map<String, Object> paramMap);

	int selectOptionCount(Map<String, Object> paramMap);

	int deleteOption(int optionNo);

	Option selectOptionOne(int optionNo);

	List<Menu> selectMenu(Map<String, Object> paramMap);

	List<Menu> selectMenu();

	List<Category> selectCategory();

	Menu selectDetailMenu(int menuNo);

	int deleteMenu(Menu m);

	int updateMenu(Menu menu);

	Menu selectMenuOne(int menuNo);

	List<Menu> selectMenuList();

	int updateOption(Option option);

	License selectLicenseNo(int licensePrice);

	int insertLicenseHistory(LicenseHistory lh);

	int checkLicenseHistory(int memberNo);

	int updateLicenseHistory(LicenseHistory lh);

	List<Option> selectMenuOptionList(int menuNo);

	void updateLhStatus();

	int checkLicense(int memberNo);

	List<CategoryList> selectCategoryList2(int currentPage, Map<String, Object> paramMap);
	
}
