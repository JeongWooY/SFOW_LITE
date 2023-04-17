package com.yeonoo.masterdata.item.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.service.PriceService;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;

@RequestMapping("/price")
@Controller
@RequiredArgsConstructor
public class PriceController {


	@Autowired
	PriceService priceService;
	private final Logger logger = LoggerFactory.getLogger(PriceController.class);
	
	// 전체 조회 page mapping
	@RequestMapping("/list") //get
	public String allList() {
		return "price/gridPriceList";
	}
	
	@ResponseBody
	@RequestMapping(value="toastPriceDataList", method= {RequestMethod.POST, RequestMethod.GET}) 
 	public List<PriceDTO> toastDataList(PriceDTO dto, HttpSession session) {
		
    	UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
	      String companyCode = user.getCompanyCode();
	      System.out.println("로그인유저의 companyCode = " + companyCode);
		
	      List<PriceDTO> list = priceService.priceList(dto,companyCode);

	      return list;
	}
	
	  //수정하기
    @ResponseBody
    @RequestMapping(value="updatePrice", method=RequestMethod.POST)
    public List<PriceDTO> updatePrice(@RequestBody List<PriceDTO> dto , HttpSession session) {

    	UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
	      String companyCode = user.getCompanyCode();
	      System.out.println("로그인유저의 companyCode = " + companyCode);
    	

       Iterator<PriceDTO> iterator = dto.iterator();
       		while(iterator.hasNext()) {
       	PriceDTO elements = iterator.next();
          
          int insertCnt = priceService.updatePrice(elements,companyCode);
       }
       
       return dto;
    }
     
  // 삭제하기(useyn 상태 변경)
     @ResponseBody
     @RequestMapping(value="useUpdate", method=RequestMethod.POST)
     public List<PriceDTO> useUpdate(@RequestBody List<PriceDTO> dto , HttpSession session) {

    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
	      String companyCode = user.getCompanyCode();
	      System.out.println("로그인유저의 companyCode = " + companyCode);
    	 
    	 Iterator<PriceDTO> iterator = dto.iterator();
    	 
    	 while(iterator.hasNext()) {
    		 PriceDTO elements= iterator.next();
    		 priceService.deletePrice(elements.getItemCode(),companyCode);
    	 }
    	 
    	 return dto;
     }

     
  // 등록
     @ResponseBody
     @RequestMapping(value="insertPrice", method=RequestMethod.POST)
     public List<PriceDTO> insertPrice(@RequestBody List<PriceDTO> dto , HttpSession session) {

    	 UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
	      String companyCode = user.getCompanyCode();
	      System.out.println("로그인유저의 companyCode = " + companyCode);
	      
        Iterator<PriceDTO> iterator = dto.iterator();
        while(iterator.hasNext()) {
        	PriceDTO elements = iterator.next();
           
           int insertCnt = priceService.insertPrice(elements,companyCode);
        }
        
        return dto;
     }
	
	
	
	
	
	
	//거래처명 목록
	@ResponseBody
	@RequestMapping(value="companycodeSelectAjax", method= {RequestMethod.GET})
	public List<PriceDTO> companycodeSelectAjax() throws Exception {
		List<PriceDTO> result = priceService.companycodeSelectAjax();
		return result;
	}
	@RequestMapping("companyCodeSelect")
    public String selectCompanyCode() throws Exception {
        return "price/gridPriceList"; // 처리 결과에 해당하는 뷰 이름 반환
    }
	//아이템코드 목록
	@ResponseBody
	@RequestMapping(value="itemcodeSelectAjax")
	public List<PriceDTO> itemcodeSelectAjax() throws Exception {
		List<PriceDTO> result = priceService.itemcodeSelectAjax();
			return result;
	}
	// 등록
	
			
		  
}
