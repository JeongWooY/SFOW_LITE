package com.yeonoo.masterdata.wh.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.domain.WH_detail;
import com.yeonoo.masterdata.wh.service.WhService;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class Wh_RestController {
	
	@Autowired
	private WhService whService;
	
	private final Logger logger = LoggerFactory.getLogger(Wh_RestController.class);
	//창고폼에서 AJAX 로 내용 불러오기
	@RequestMapping(method = {RequestMethod.GET},value="/warehouse/whinfoAJ")
    public List<WH> getWhAllList(HttpSession session) throws Exception {
       //전체 목록 조회
        UserInfo userinfo = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = userinfo.getCompanyCode();
		
		List<WH> result = whService.getWhAllList(company_code);
        System.out.println("===========results==="+result);
        return result;
    }
    
  //3가지 키워드로 검색해서 보여주기 aj
	@RequestMapping(method = {RequestMethod.POST}, value = "/warehouse/searchWH",consumes="application/json" )
    public List<WH> searchWH(@RequestBody WH searchwh,HttpSession session) throws Exception {
		UserInfo userinfo = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = userinfo.getCompanyCode();
		searchwh.setCompany_code(company_code);
		
    	List<WH> results = whService.searchWH(searchwh);
    		System.out.println("results"+results);
    		
    	    return results;
    }
    //그리드 1행 추가 등록(인서트 "저장" 버튼)
	@ResponseBody
    @RequestMapping(method= {RequestMethod.POST}, value="/warehouse/insertWH")
    public List<WH> insertWH(@RequestBody List<WH> insertwh,HttpSession session) throws Exception{
		
		Iterator<WH> iterator = insertwh.iterator();
		UserInfo userinfo = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = userinfo.getCompanyCode();
		String createuser =userinfo.getId();
		
		((WH) insertwh).setCompany_code(company_code);
		((WH) insertwh).setCreateuser(createuser);
		
		    while(iterator.hasNext()){
		    		WH elements =iterator.next();
		    		int writeCnt=   whService.insertWH(elements);
		    		logger.info("DB에 insert된 출하 개수 : " + writeCnt); 
		    }
		    return insertwh;
		}
	
	//area 데이터 불러오기
		@RequestMapping(method = {RequestMethod.POST}, value = "/warehouse/WHarea" , consumes="application/json")
	    public List<WH_detail> WHarea(@RequestBody List<WH> wh) throws Exception {
	    		
	    	List<WH_detail> wh_detail = new ArrayList<WH_detail>();
	    	
	    	Iterator<WH> iterator = wh.iterator();
	    	while(iterator.hasNext()) {
	    		
	    		WH elements = iterator.next();
	    		
	    		List<WH_detail> wh_detail2 = whService.WHarea(elements.getWarehouse_code());
	    			System.out.println("====wh_detail2===="+wh_detail2);
	    		Iterator<WH_detail> iterator2 = wh_detail2.iterator();
	    			
	    		while (iterator2.hasNext()) {
	    		
	    			WH_detail wh_details =iterator2.next();
	    			wh_detail.add(wh_details);
	    		}
	    	}	    	
			return wh_detail;
	    }
	

	    
	 //Area 행 추가 등록(인서트 "저장" 버튼)
		@ResponseBody
	    @RequestMapping(method= RequestMethod.POST, value="/warehouse/insertDetail")
	    public List<WH_detail> insertDetail(@RequestBody List<WH_detail> WH_detail) throws Exception{
			
	    	Iterator<WH_detail> iterator = WH_detail.iterator();
	    	while(iterator.hasNext()) {
	    		
	    		WH_detail elements =iterator.next();
	    		int detailCnt= whService.insertDetail(elements);
	    	}
			    return WH_detail;
			}      
       
	
    //그리드1 행 업데이트 기능 
    @ResponseBody
  	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH}, value= "/warehouse/updateWH")
  	public int updateWH(@RequestBody List<WH> wh) throws Exception {
    	
    	Iterator<WH> iterator = wh.iterator();
    		int updateCnt = 0;
    	while(iterator.hasNext()) {
			
    		WH elements = iterator.next();

			updateCnt =  whService.updateWH(elements);
		}
		
		return updateCnt;
	}
  
    
    
    //특정 데이터로 구역(area) 데이터 조회하기
  	
   
    
  //품목등록(제품) 관리자용 삭제(delete)
  	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH} , value = "/warehouse/deleteWH" ,consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
  	public ResponseEntity<String> deleteWH(@RequestBody WH wh) throws Exception {
  		return whService.deleteWH(wh) == 1
  				? new ResponseEntity<String> ("success", HttpStatus.OK) :
                                 new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
  	}
    
    
    
}
