package com.yeonoo.ppOrder.controller;


import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.ppOrder.domain.PPOrder;
import com.yeonoo.ppOrder.service.PPOrderService;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PPOrderController  {

	private static final Logger logger = LoggerFactory.getLogger(PPOrderController.class);
	
	@Autowired
	PPOrderService ppOrderService;
	
	   
	   @RequestMapping("/po") //url주소고
	   public String stock() {
	      
	      return "/ppOrder/PPOrder";//보여주고싶은 jsp페이지
	   }

	//화면목록페이지
	@GetMapping("/PPOrder")
	@ResponseBody
	public List<PPOrder> list( HttpSession com, HttpServletRequest request,
	         @RequestParam(required = false) String pp_type,
	         @RequestParam(required = false) String po_date,
	         @RequestParam(required = false) String end_date,
	         @RequestParam(required = false) String pp_no,
	         @RequestParam(required = false) String warehouse_code,
	         @RequestParam(required = false) String warehouse_name
	         
			) throws Exception {
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		System.out.println(user);
		String company_code = user.getCompanyCode();
		
		
		PPOrder ppOrder = new PPOrder();
		ppOrder.setPp_type(pp_type);
		ppOrder.setPo_date(po_date);
		ppOrder.setEnd_date(end_date);
		ppOrder.setPp_no(pp_no);
		ppOrder.setWarehouse_code(warehouse_code);
		ppOrder.setWarehouse_name(warehouse_name);
		ppOrder.setCompany_code(company_code);
		System.out.println(ppOrder.getCompany_code());
		//전체목록조회
		List<PPOrder> list = ppOrderService.getPPOrderAllList(ppOrder);
		
	
		//4.View
		return list;
	}
	
	//수정하기
	  @ResponseBody
	  @RequestMapping(value="/updatePPOrder", method=RequestMethod.PUT)
	  public void updatePPOrder(@RequestBody PPOrder data) throws Exception {
	     System.out.println("컨트롤러 전"+data);
	     ppOrderService.updatePPOrder(data);
	     System.out.println("컨트롤러 후"+data);

	  }
	  
	 
	  // 등록
	     @ResponseBody
	     @RequestMapping(value="insertPPOrder", method=RequestMethod.POST)
	     public List<PPOrder> insertPPOrder(@RequestBody List<PPOrder> ppOrder) throws Exception {

	    	 System.out.println("컨트롤러 전"+ppOrder);
	        Iterator<PPOrder> iterator = ppOrder.iterator();
	        while(iterator.hasNext()) {
	        	PPOrder elements = iterator.next();
	           
	           int insertCnt = ppOrderService.insertPPOrder(elements);
	           System.out.println("컨트롤러 후"+insertCnt);
	        }
	        return ppOrder;
	     }

	     //삭제하기
         @ResponseBody
         @RequestMapping(value="deletePPOrder", method=RequestMethod.POST)
         public List<PPOrder> useUpdate(@RequestBody List<PPOrder> ppOrder) throws Exception {

            Iterator<PPOrder> iterator = ppOrder.iterator();
            
            while(iterator.hasNext()) {
            	PPOrder elements= iterator.next();
            	ppOrderService.deletePPOrder(elements.getPp_no());
            	 
            }
            return ppOrder;
         }



}//입력처리 끝
	

	
	
    
    











