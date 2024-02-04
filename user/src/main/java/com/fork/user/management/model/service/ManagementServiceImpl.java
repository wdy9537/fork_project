package com.fork.user.management.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.management.model.dao.ManagementDao;
import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.CategoryList;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.License;
import com.fork.user.management.model.vo.LicenseHistory;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;
import com.fork.user.management.model.vo.OptionList;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	private ManagementDao managementDao;
	
	@Override
	public int insertCategory(Category category) {
		return managementDao.insertCategory(category);
	}

	@Override
	public int insertMenu(Menu menu) {
		return managementDao.insertMenu(menu);
	}

	@Override
	public List<Category> selectCategoryList() {
		return managementDao.selectCategoryList();
	}

	@Override
	public int insertOption(Option option) {
		return managementDao.insertOption(option);
	}

	@Override
	public List<Option> selectOptionList() {
		return managementDao.selectOptionList();
	}

	@Override
	public int insertCoo(Coo coo) {
		return managementDao.insertCoo(coo);
	}

	@Override
	public int deleteCoo(int cooNo) {
		return managementDao.deleteCoo(cooNo);
	}

	@Override
	public List<Category> selectCategory(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectCategory(currentPage, paramMap);
	}

	@Override
	public int selectCategoryCount(Map<String, Object> paramMap) {
		return managementDao.selectCategoryCount(paramMap);
	}

	@Override
	public List<Coo> selectCoo(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectCoo(currentPage, paramMap);
	}

	@Override
	public int selectCooCount(Map<String, Object> paramMap) {
		return managementDao.selectCooCount(paramMap);
	}

	@Override
	public int updateCategory(Category category) {
		return managementDao.updateCategory(category);
	}

	@Override
	public Category selectCategoryOne(int categoryNo) {
		return managementDao.selectCategoryOne(categoryNo);
	}

	@Override
	public int deleteCategory(int categoryNo) {
		return managementDao.deleteCategory(categoryNo);
	}

	@Override
	public List<OptionList> selectOption(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectOption(currentPage, paramMap);
	}

	@Override
	public int selectOptionCount(Map<String, Object> paramMap) {
		return managementDao.selectOptionCount(paramMap);
	}

	@Override
	public int deleteOption(int optionNo) {
		return managementDao.deleteOption(optionNo);
	}

	@Override
	public Option selectOptionOne(int optionNo) {
		return managementDao.selectOptionOne(optionNo);
	}

	@Override
	public List<Menu> selectMenu(Map<String, Object> paramMap) {
		return managementDao.selectMenu(paramMap);
	}

	@Override
	public List<Menu> selectMenu() {
		return managementDao.selectMenu();
	}

	@Override
	public List<Category> selectCategory() {
		return managementDao.selectCategory();
	}

	@Override
	public Menu selectDetailMenu(int menuNo) {
		return managementDao.selectDetailMenu(menuNo);
	}

	@Override
	public int deleteMenu(Menu m) {
		return managementDao.deleteMene(m);
	}

	@Override
	public int updateMenu(Menu menu) {
		return managementDao.updateMenu(menu);
	}

	@Override
	public Menu selectMenuOne(int menuNo) {
		return managementDao.selectMenuOne(menuNo);
	}

	@Override
	public List<Menu> selectMenuList() {
		return managementDao.selectMenuList();
	}

	@Override
	public int updateOption(Option option) {
		return managementDao.updateOption(option);
	}

	@Override
	public License selectLicenseNo(int licensePrice) {
		return managementDao.selectLicenseNo(licensePrice);
	}

	@Override
	public int insertLicenseHistory(LicenseHistory lh) {
		return managementDao.insertLicenseHistory(lh);
	}

	@Override
	public int checkLicenseHistory(int memberNo) {
		return managementDao.checkLicenseHistory(memberNo);
	}

	@Override
	public int updateLicenseHistory(LicenseHistory lh) {
		return managementDao.updateLicenseHistory(lh);
	}

	@Override
	public List<Option> selectMenuOptionList(int menuNo) {
		return managementDao.selectMenuOptionList(menuNo);
	}

	@Override
	public void updateLhStatus() {
		managementDao.updateLhStatus();
	}

	@Override
	public int checkLicense(int memberNo) {
		return managementDao.checkLicense(memberNo);
	}

	@Override
	public List<CategoryList> selectCategoryList2(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectCategoryList2(currentPage, paramMap);
	}


}
