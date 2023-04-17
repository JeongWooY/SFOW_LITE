package com.yeonoo.masterdata.item.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.ItemType;
import com.yeonoo.masterdata.item.domain.SemiDTO;
import com.yeonoo.masterdata.item.service.SemiService;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;

@RequestMapping("/semi")
@Controller
@RequiredArgsConstructor
public class SemiController {


	@Autowired
	SemiService semiService;
	private final Logger logger = LoggerFactory.getLogger(SemiController.class);
	
	// modal form
	//품목유형등록 목록
	@GetMapping("/item/type")
	public String getItemTypeList() throws Exception {
		return "item/itemType";
	}
	
	//품목유형등록셀렉트 목록
	@GetMapping("/item/typeSelect")
	public String selectItemTypeList() throws Exception {
		return "item/itemTypeSelect";
	}
	
	//규격 모달
	@RequestMapping("/item/itemSpecificationSelect")
	public String modalitemSpecificationSelect() throws Exception {
		return "item/itemSpecificationSelect";		
	}
	
	//재고단위 모달
	@RequestMapping("/item/itemStockUnitSelect")
	public String modalstockunitList() throws Exception {
		return "item/itemStockUnitSelect";
	}
	
// modal data process
	
// modal Item값 조회
   @RequestMapping(value="getModalClient")
   @ResponseBody
   public List<Map<String, Object>> getModalClient() {
      
      List<Map<String, Object>> result = semiService.getModalClient();
      logger.info("1) modalItem = " + result);
      
      return result;
   }
	
	@RequestMapping("/list") //get
	public String allList() {
		return "item/gridSemiList";
	}

	
	@ResponseBody
	@RequestMapping(value="toastSemiDataList", method= {RequestMethod.POST, RequestMethod.GET}) 
 	public List<SemiDTO> toastDataList(SemiDTO dto, HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
	      String companyCode = user.getCompanyCode();
	      System.out.println("로그인유저의 companyCode = " + companyCode);
		
		List<SemiDTO> list = semiService.semiList(dto, companyCode);
		
		return list;
	}


			// 반제품 정보 수정
		    
		  //수정하기
		    @ResponseBody
		    @RequestMapping(value="updateSemi", method=RequestMethod.POST)
		    public List<SemiDTO> updateSemi(@RequestBody List<SemiDTO> dto , HttpSession session) {
		
		    	UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
			      String companyCode = user.getCompanyCode();
			      System.out.println("로그인유저의 companyCode = " + companyCode);
		    	
		
		       Iterator<SemiDTO> iterator = dto.iterator();
		       		while(iterator.hasNext()) {
		       	SemiDTO elements = iterator.next();
		          
		          int insertCnt = semiService.updateSemi(elements,companyCode);
		          System.out.println(dto);
		       }
		       
		       return dto;
		    }
		     
		  // 삭제하기(useyn 상태 변경)
		     @ResponseBody
		     @RequestMapping(value="useUpdate", method=RequestMethod.POST)
		     public List<SemiDTO> useUpdate(@RequestBody List<SemiDTO> dto , HttpSession session) {

		    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
			      String companyCode = user.getCompanyCode();
			      System.out.println("로그인유저의 companyCode = " + companyCode);
		    	 
		    	 Iterator<SemiDTO> iterator = dto.iterator();
		    	 
		    	 while(iterator.hasNext()) {
		    		 SemiDTO elements= iterator.next();
		    		 semiService.deleteSemi(elements.getItemCode(),companyCode);
		    	 }
		    	 
		    	 return dto;
		     }

		     
		  // 등록
		     @ResponseBody
		     @RequestMapping(value="insertSemi", method=RequestMethod.POST)
		     public List<SemiDTO> insertSemi(@RequestBody List<SemiDTO> dto , HttpSession session) {

		    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
			      String companyCode = user.getCompanyCode();
			      System.out.println("로그인유저의 companyCode = " + companyCode);
			        System.out.println(dto);
		        Iterator<SemiDTO> iterator = dto.iterator();
		        while(iterator.hasNext()) {
		        	SemiDTO elements = iterator.next();
		           int insertCnt = semiService.insertSemi(elements,companyCode);
			        System.out.println(insertCnt);
		        }
		        System.out.println(dto);
		        return dto;
		     }
		     
	
		     
		 	//품목유형등록(제품) 목록
		    @ResponseBody
		 	@RequestMapping(value="/item/typeSelectAjax")
		 	public List<ItemType> selectItemTypeListAjax() throws Exception {
		 		List<ItemType> result = semiService.selectItemTypeList();
		 		return result;
		 	}
		  
			//품목유형등록(제품) 목록검색
		 	@ResponseBody
			@RequestMapping(method = {RequestMethod.POST}, value="/item/typeSelectSearchAjax", consumes="application/json")
			public List<ItemType> typeSelectSearchAjax(@RequestBody ItemType itemtype) throws Exception {
				List<ItemType> result = semiService.typeSelectSearchAjax(itemtype);
				return result;
			}
}
