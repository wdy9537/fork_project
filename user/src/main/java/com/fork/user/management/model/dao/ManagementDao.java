package com.fork.user.management.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.CategoryList;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.License;
import com.fork.user.management.model.vo.LicenseHistory;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;
import com.fork.user.management.model.vo.OptionList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ManagementDao {

	@Autowired
	private SqlSessionTemplate session;

	public int insertCategory(Category category) {
		return session.insert("managementMapper.insertCategory", category);
	}

	public int insertMenu(Menu menu) {
		return session.insert("managementMapper.insertMenu", menu);
	}

	public List<Category> selectCategoryList() {
		return session.selectList("managementMapper.selectCategoryList");
	}

	public int insertOption(Option option) {
		return session.insert("managementMapper.insertOption", option);
	}

	public List<Option> selectOptionList() {
		return session.selectList("managementMapper.selectOptionList");
	}

	public int insertCoo(Coo coo) {
		return session.insert("managementMapper.insertCoo", coo);
	}

	public int deleteCoo(int cooNo) {
		return session.delete("managementMapper.deleteCoo", cooNo);
	}

	public List<Category> selectCategory(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectCategory", paramMap, rowBounds);
	}

	public int selectCategoryCount(Map<String, Object> paramMap) {
		return session.selectOne("managementMapper.selectCategoryCount", paramMap);
	}

	public List<Coo> selectCoo(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectCoo", paramMap, rowBounds);
	}

	public int selectCooCount(Map<String, Object> paramMap) {
		return session.selectOne("managementMapper.selectCooCount", paramMap);
	}

	public int updateCategory(Category category) {
		return session.update("managementMapper.updateCategory", category);
	}

	public Category selectCategoryOne(int categoryNo) {
		return session.selectOne("managementMapper.selectCategoryOne", categoryNo);
	}

	public int deleteCategory(int categoryNo) {
		return session.delete("managementMapper.deleteCategory", categoryNo);
	}

	public List<OptionList> selectOption(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectOption", paramMap, rowBounds);
	}

	public int selectOptionCount(Map<String, Object> paramMap) {
		return session.selectOne("managementMapper.selectOptionCount", paramMap);
	}

	public int deleteOption(int optionNo) {
		return session.delete("managementMapper.deleteOption", optionNo);
	}

	public Option selectOptionOne(int optionNo) {
		return session.selectOne("managementMapper.selectOptionOne", optionNo);
	}

	public List<Menu> selectMenu(Map<String, Object> paramMap) {
		return session.selectList("managementMapper.selectMenu", paramMap);
	}

	public List<Menu> selectMenu() {
		return session.selectList("managementMapper.selectAllMenu");
	}

	public List<Category> selectCategory() {
		return session.selectList("managementMapper.selectAllCategory");
	}

	public Menu selectDetailMenu(int menuNo) {
		return session.selectOne("managementMapper.selectDetailMenu", menuNo);
	}

	public int deleteMene(Menu m) {
		return session.delete("managementMapper.deleteMenu", m);
	}

	public int updateMenu(Menu menu) {
		return session.update("managementMapper.updateMenu", menu);
	}

	public Menu selectMenuOne(int menuNo) {
		return session.selectOne("managementMapper.selectMenuOne", menuNo);
	}

	public List<Menu> selectMenuList() {
		return session.selectList("managementMapper.selectMenuList");
	}

	public int updateOption(Option option) {
		return session.update("managementMapper.updateOption", option);
	}

	public License selectLicenseNo(int licensePrice) {
		return session.selectOne("managementMapper.selectLicenseNo", licensePrice);
	}

	public int insertLicenseHistory(LicenseHistory lh) {
		return session.insert("managementMapper.insertLicenseHistory", lh);
	}

	public int checkLicenseHistory(int memberNo) {
		return session.selectOne("managementMapper.checkLicenseHistory", memberNo);
	}

	public int updateLicenseHistory(LicenseHistory lh) {
		return session.update("managementMapper.updateLicenseHistory", lh);
	}

	public List<Option> selectMenuOptionList(int menuNo) {
		return session.selectList("managementMapper.selectMenuOptionList", menuNo);
	}

	public void updateLhStatus() {
		session.update("managementMapper.updateLhStatus");
	}

	public int checkLicense(int memberNo) {
		
		int result = 1;
		
		Integer check = session.selectOne("managementMapper.checkLicense", memberNo);
		
		if(check == null) {
			result = 0;
		}
		
		return result; 
	}

	public List<CategoryList> selectCategoryList2(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectCategoryList2", paramMap, rowBounds);
	}
	
}
