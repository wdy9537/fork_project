package com.fork.user.management.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fork.user.common.Utils;
import com.fork.user.common.template.Pagination;
import com.fork.user.common.vo.PageInfo;
import com.fork.user.management.model.service.ManagementService;
import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.CategoryList;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.License;
import com.fork.user.management.model.vo.LicenseHistory;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;
import com.fork.user.management.model.vo.OptionList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ManagementController {

	@Autowired
	private ManagementService mService;
	
	@Autowired
	private ServletContext application;

	/**
	 * 이용권 페이지로 이동
	 * @return
	 */
	@GetMapping("/license")
	public String license() {
		return "management/license";
	}
	
	/**
	 * 원산지 관리 페이지로 이동
	 * 원산지 리스트 조회
	 * 페이징 바
	 * @return
	 */
	@GetMapping("/coo")
	public String coo(
				@RequestParam(value="currentPage", defaultValue="1") int currentPage,
				Model model,
				@RequestParam Map<String, Object> paramMap
			) {
		
		List<Coo> list = mService.selectCoo(currentPage, paramMap);
		
		int total = mService.selectCooCount(paramMap);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("param", paramMap);
		
		return "management/coo";
	}
	
	/**
	 * 메뉴 관리 페이지로 이동
	 * 메뉴 리스트 조회
	 * @return
	 */
	@GetMapping("/menu")
	public String menu(
				@RequestParam(value="currentPage", defaultValue="1") int currentPage,
				Model model,
				@RequestParam Map<String, Object> paramMap
			) {
		
		List<Menu> list = mService.selectMenu(paramMap);
		
		List<Category> clist = mService.selectCategory(currentPage, paramMap);
		
		model.addAttribute("list", list);
		model.addAttribute("clist", clist);
		
		return "management/menu";
	}
	
	/**
	 * 카테고리 리스트 조회
	 * @return
	 */
	@PostMapping("/category")
	@ResponseBody
	public List<Category> category(){
		List<Category> categoryList = mService.selectCategory();
		return categoryList;
	}
	
	/**
	 * 메뉴 리스트 조회
	 * @return
	 */
	@PostMapping("/menu")
	@ResponseBody
	public List<Menu> menu(){
		List<Menu> menuList = mService.selectMenu();

		return menuList;
	}
	
	
	/**
	 * 카테고리 관리 페이지로 이동
	 * 카테고리 리스트 조회
	 * 페이징 바
	 * @return
	 */
	@GetMapping("/category")
	public String category(
				@RequestParam(value="currentPage", defaultValue="1") int currentPage,
				Model model,
				@RequestParam Map<String, Object> paramMap
			) {
		
		List<CategoryList> list = mService.selectCategoryList2(currentPage, paramMap);
		
		int total = mService.selectCategoryCount(paramMap);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("param", paramMap);
		
		return "management/category";
	}
	
	/**
	 * 옵션 관리 페이지로 이동
	 * 옵션 리스트 조회
	 * 페이징 바
	 * @return
	 */
	@GetMapping("/option")
	public String option(
				@RequestParam(value="currentPage", defaultValue="1") int currentPage,
				Model model,
				@RequestParam Map<String, Object> paramMap
			) {
		
		List<OptionList> list = mService.selectOption(currentPage, paramMap);
		
		int total = mService.selectOptionCount(paramMap);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("param", paramMap);
		
		return "management/option";
	}
	
	/**
	 * 메뉴 등록
	 * @param menu
	 * @param file
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("/insertMenu")
	public String insertMenu(
	    Menu menu,
	    @RequestParam("file") MultipartFile file,
	    HttpSession session,
	    Model model
	) {
	    String webPath = "/resources/img/";
	    String severFolderPath = application.getRealPath(webPath);
	    
	    File dir = new File(severFolderPath);
	    
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    String changeName = Utils.saveFile(file, severFolderPath);
	    menu.setOriginName(file.getOriginalFilename());
	    menu.setChangeName(changeName);
	    menu.setFilePath(webPath);
	    
	    int result = mService.insertMenu(menu);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "메뉴 등록에 성공했습니다.");
	    } else {
	        session.setAttribute("alertMsg", "메뉴 등록에 실패했습니다.");
	    }
	    
	    return "redirect:/menu";
	}
	
	/**
	 * 메뉴 삭제
	 * @param m
	 * @param session
	 * @return
	 */
	@PostMapping("/deleteMenu")
	public String deleteMenu(
				Menu m,
				HttpSession session
			) {
		
		log.info(m.getMenuNo() + "");
		
		int result = mService.deleteMenu(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "삭제에 실패했습니다.");
		}
	
		return "redirect:/menu";
		
	}
	
	/**
	 * 메뉴 수정
	 * @param menu
	 * @param file
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("/updateMenu")
	public String updateMenu(
				Menu menu,
				@RequestParam("file") MultipartFile file,
			    HttpSession session,
			    Model model
			) {
		String webPath = "/resources/img/";
	    String severFolderPath = application.getRealPath(webPath);
	    
	    File dir = new File(severFolderPath);
	    
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    if(file.isEmpty()) {
	    	Menu m = mService.selectMenuOne(menu.getMenuNo());
	    	menu.setChangeName(m.getChangeName());
	    	menu.setOriginName(m.getOriginName());
	    } else {
	    	String changeName = Utils.saveFile(file, severFolderPath);
	    	menu.setOriginName(file.getOriginalFilename());
	    	menu.setChangeName(changeName);
	    }
	    
	    menu.setFilePath(webPath);
	    
	    int result = mService.updateMenu(menu);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "메뉴 수정에 성공했습니다.");
	    } else {
	        session.setAttribute("alertMsg", "메뉴 수정에 실패했습니다.");
	    }
	    
	    return "redirect:/menu";
	}
	
	/**
	 * 특정 메뉴 리스트 조회
	 * @return
	 */
	@PostMapping("/selectMenuList")
	@ResponseBody
	public List<Menu> selectMenuList(){
		return mService.selectMenuList();
	}
	
	/**
	 * 카테고리 조회
	 * @return
	 */
	@GetMapping("/selectCategoryList")
	@ResponseBody
	public List<Category> selectCategoryList(){
		return mService.selectCategoryList();
	}
	
	/**
	 * 옵션 조회
	 * @return
	 */
	@GetMapping("/selectOptionList")
	@ResponseBody
	public List<Option> selectOptionList(){
		return mService.selectOptionList();
	}
	
	/**
	 * 특정 카테고리 조회
	 * @param categoryNo
	 * @return
	 */
	@PostMapping("/selectCategory")
	@ResponseBody
	public ResponseEntity<Category> selectCategoryOne(int categoryNo) {
	    Category category = mService.selectCategoryOne(categoryNo);
	    return ResponseEntity.ok(category);
	}
	
	/**
	 * 카테고리 등록
	 * @return
	 */
	@PostMapping("/insertCategory")
	public String insertCategory(
				Category category,
				HttpSession session
			) {
		
		int result = mService.insertCategory(category);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
		} else {
			session.setAttribute("alertMsg", "등록에 실패했습니다.");
		}
		
		return "redirect:/category";
		
	}
	
	/**
	 * 카테고리 업데이트
	 * @param categoryNo
	 * @param session
	 * @return
	 */
	@PostMapping("updateCategory")
	public String updateCategory(
				Category category,
				HttpSession session
			) {
		
		int result = mService.updateCategory(category);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
		} else {
			session.setAttribute("alertMsg", "수정에 실패했습니다.");
		}
		
		return "redirect:/category";
		
	}
	
	/**
	 * 카테고리 삭제
	 * @param categoryNo
	 * @param session
	 * @return
	 */
	@PostMapping("/deleteCategory/{categoryNo}")
	public String deleteCategory(
				@PathVariable("categoryNo") int categoryNo,
				HttpSession session
			) {
		
		int result = mService.deleteCategory(categoryNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "삭제에 실패했습니다.");
		}
		
		return "redirect:/category";
	}
	
	/**
	 * 특정 옵션 조회
	 * @param optionNo
	 * @return
	 */
	@PostMapping("selectOption")
	@ResponseBody
	public ResponseEntity<Option> selectOptionOne(int optionNo) {
	    Option option = mService.selectOptionOne(optionNo);
	    return ResponseEntity.ok(option);
	}
	
	/**
	 * 옵션 등록
	 * @param option
	 * @param session
	 * @return
	 */
	@GetMapping("/insertOption")
	public String insertOption(
				Option option,
				HttpSession session
			) {
		int result = mService.insertOption(option);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
		} else {
			session.setAttribute("alertMsg", "등록에 실패했습니다.");
		}
		
		return "redirect:/option";
	}
	
	/**
	 * 특정 옵션 삭제
	 * @param optionNo
	 * @param session
	 * @return
	 */
	@PostMapping("/deleteOption/{optionNo}")
	public String deleteOption(
				@PathVariable("optionNo") int optionNo,
				HttpSession session
			) {
		
		int result = mService.deleteOption(optionNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "삭제에 실패했습니다.");
		}
		
		return "redirect:/option";
		
	}
	
	/**
	 * 옵션 수정
	 * @param optionList
	 * @param session
	 * @return
	 */
	@PostMapping("/updateOption")
	public String updateOption(
				Option option,
				HttpSession session
			) {
		
		log.info(option.getOptionNo() + "");
		
		int result = mService.updateOption(option);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
		} else {
			session.setAttribute("alertMsg", "수정에 실패했습니다.");
		}
		
		return "redirect:/option";
		
	}
	
	/**
	 * 원산지 등록
	 * @param coo
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("/insertCoo")
	public String insertCoo(
				Coo coo,
				HttpSession session
			) {
		
		int result = mService.insertCoo(coo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
		} else {
			session.setAttribute("alertMsg", "등록에 실패했습니다.");
		}
		
		return "redirect:/coo";
		
	}
	
	/**
	 * 원산지 삭제
	 * @param cooNo
	 * @param session
	 * @return
	 */
	@PostMapping("/deleteCoo/{cooNo}")
	public String deleteCoo(
				@PathVariable("cooNo") int cooNo,
				HttpSession session
			) {
		
		int result = mService.deleteCoo(cooNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "삭제에 실패했습니다.");
		}
		
		return "redirect:/coo";
		
	}
	
	/**
	 * 특정 메뉴 조회
	 * @param menuNo
	 * @return
	 */
	@PostMapping("/selectDetailMenu")
	@ResponseBody
	public ResponseEntity<Menu> selectDetailMenu(int menuNo) {
		Menu menu = mService.selectDetailMenu(menuNo);
		return ResponseEntity.ok(menu);
	}
	
	/**
	 * 특정 메뉴 옵션 조회
	 * @param menuNo
	 * @return
	 */
	@PostMapping("selectMenuOptionList")
	@ResponseBody
	public ResponseEntity<List<Option>> selectMenuOptionList(int menuNo) {
		List<Option> options = mService.selectMenuOptionList(menuNo);
		return ResponseEntity.ok(options);
	}
	
	/**
	 * 결제 시 이용기간 저장
	 * @param memberNo
	 * @param licensePrice
	 * @param session
	 * @return
	 */
	@PostMapping("/insertLicense")
	@ResponseBody
	public String insertLicense(
				int memberNo,
				int licensePrice,
				HttpSession session
			) {
		
		License license = mService.selectLicenseNo(licensePrice);
		
		LicenseHistory lh = new LicenseHistory();
		
		lh.setMemberNo(memberNo);
		lh.setLicenseNo(license.getLicenseNo());
		
		int result = mService.checkLicenseHistory(memberNo);
		
		if(result > 0) {
			int result1 = mService.updateLicenseHistory(lh);
		} else {
			int result2 = mService.insertLicenseHistory(lh);
		}
		return "";
	}
	
}
