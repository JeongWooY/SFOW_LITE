package com.yeonoo.masterdata.item.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.domain.SemiDTO;
import com.yeonoo.masterdata.item.service.RawService;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

@RequestMapping("/raw")
@Controller
public class RawController {


	@Autowired
	RawService rawService;

	// modal 
	// 유형 모달 폼
	@RequestMapping("/typeModalList") //get
	public String typeModalList() {
		return "item/typeModalList";
	}
	// 규격 모달 폼
	@RequestMapping("/specificationModalList") //get
	public String specificationModalList() {
		return "item/specificationModalList";
	}
	// 재고 단위 모달 폼
	@RequestMapping("/stockUnitModalList") //get
	public String stockUintModalList() {
		return "item/stockUnitModalList";
	}
	// 거래처 모달 폼
	@RequestMapping("/clientModalList") //get
	public String clientModalList() {
		return "item/clientModalList";
	}
	
// modal data process
	
//  client modal Item값 조회
   @RequestMapping(value="getModalClient")
   @ResponseBody
   public List<Map<String, Object>> getModalClient() {
      
      List<Map<String, Object>> result = rawService.getModalClient();
      System.out.println(result);
      return result;
   }

//  Type modal Item값 조회
	  @RequestMapping(value="getModalType")
	  @ResponseBody
	  public List<Map<String, Object>> getModalType() {
	     
	     List<Map<String, Object>> result = rawService.getModalType();
	     System.out.println(result);
	     return result;
	  }   
//  Specification modal Item값 조회
	  @RequestMapping(value="getModalSpecification")
	  @ResponseBody
	  public List<Map<String, Object>> getModalSpecification() {
	     
	     List<Map<String, Object>> result = rawService.getModalSpecification();
	     System.out.println(result);
	     return result;
	  } 
	  
//  StockUnit modal Item값 조회
	  @RequestMapping(value="getModalStockUnit")
	  @ResponseBody
	  public List<Map<String, Object>> getModalStockUnit() {
	     
	     List<Map<String, Object>> result = rawService.getModalStockUnit();
	     System.out.println(result);
	     return result;
	  } 	  
   
// --------------------------------------------------------   
   
	
	// 원제품 리스트 전체 조회
	@RequestMapping("/list") //get
	public String allList() {
		return "item/gridRawList";
	}
	
	@ResponseBody
	@RequestMapping(value="toastRawDataList",method={RequestMethod.POST, RequestMethod.GET}) 
 	public List<RawDTO> toastDataList(RawDTO dto, HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
	      String companyCode = user.getCompanyCode();
	      System.out.println("로그인유저의 companyCode = " + companyCode);
		
		List<RawDTO> list = rawService.rawList(dto,companyCode);
		return list;
	}


	// 반제품 정보 수정
		    
		  //수정하기
		     @ResponseBody
		     @RequestMapping(value="/updateRaw", method=RequestMethod.PUT)
		     public void update(@RequestBody RawDTO dto, HttpSession session) throws Exception {
		    	 
		    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
			      String companyCode = user.getCompanyCode();
			      System.out.println("로그인유저의 companyCode = " + companyCode);
		    	 
		    	 rawService.updateRaw(dto,companyCode);

		     }	    
		  // 삭제하기(useyn 상태 변경)
		     @ResponseBody
		     @RequestMapping(value="useUpdate", method=RequestMethod.POST)
		     public List<RawDTO> useUpdate(@RequestBody List<RawDTO> dto, HttpSession session) {

		    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
			      String companyCode = user.getCompanyCode();
			      System.out.println("로그인유저의 companyCode = " + companyCode);
			      
		    	 Iterator<RawDTO> iterator = dto.iterator();
		    	 while(iterator.hasNext()) {
		    		 RawDTO elements= iterator.next();
		    		 rawService.deleteRaw(elements.getItemCode(),companyCode);
		    	 }
		    	 
		        System.out.println("dto = " + dto);
		        return dto;
		     }
		     
		  // 등록
		     @ResponseBody
		     @RequestMapping(value="insertRaw", method=RequestMethod.POST)
		     public List<RawDTO> insertRaw(@RequestBody List<RawDTO> dto, HttpSession session) {

		    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
			      String companyCode = user.getCompanyCode();
			      System.out.println("로그인유저의 companyCode = " + companyCode);

		        Iterator<RawDTO> iterator = dto.iterator();
		        while(iterator.hasNext()) {
		        	RawDTO elements = iterator.next();
		           
		           int insertCnt = rawService.insertRaw(elements,companyCode);
		        }
		        
		        return dto;
		     }
		     
	

}
