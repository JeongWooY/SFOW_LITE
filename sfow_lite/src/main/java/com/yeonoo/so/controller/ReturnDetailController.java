package com.yeonoo.so.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.so.domain.ReturnDetail;
import com.yeonoo.so.service.ReturnDetailService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ReturnDetailController {

	@Autowired
	ReturnDetailService returnDetailService;
		
    //행 클릭시 return_detail 조회 
	@RequestMapping(value="/so/getReturnDetail",
			   method=RequestMethod.POST)
	@ResponseBody
	public List<ReturnDetail> getReturnDetail(@RequestParam("return_number") String returnNumber) throws Exception {
		System.out.println("returnDetail컨트롤러"+returnNumber);
		List<ReturnDetail> returnDetail = returnDetailService.getReturnDetail(returnNumber);
	
		return returnDetail;
	}
    
    //return_detail에 저장 및 수정
    @PostMapping("/so/saveReturnDetail")
    public void saveReturnDetail(@RequestBody Map<String, Object> data, HttpServletResponse response, HttpSession session) {
        try {
        	// session.getAttribute로 company_code를 가져오고 그 파라미터를 리스트에 추가
        	UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
        	String companyCode = loginUser.getCompanyCode();
        	System.out.println("companyCode"+companyCode);

        	List<Map<String, Object>> createRows = (List<Map<String, Object>>) data.get("createRows2");
            List<Map<String, Object>> updateRows = (List<Map<String, Object>>) data.get("updateRows2");
            
            for (Map<String, Object> row : createRows) {
                row.put("company_code", companyCode);
            }

            for (Map<String, Object> row : updateRows) {
                row.put("company_code", companyCode);
            }
            
            // 로그 추가
            System.out.println(("Received data: {}"+data));
            System.out.println("Create Rows2: {}"+ createRows);
            System.out.println("Update Rows2: {}"+ updateRows);
            
            returnDetailService.insertDetailAdd(createRows);
            returnDetailService.updateDetailAdd(updateRows);
            
            // 반환할 JSON 데이터 생성
            Map<String, Object> responseJson = new HashMap<>();
            responseJson.put("success", true);
            
            // JSON 데이터 반환
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new ObjectMapper().writeValueAsString(responseJson));
        } catch (Exception e) {
            log.error("Error occurred while saving grid data: {}", e.getMessage(), e);
            // 에러 발생시 오류 메시지 반환
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, Object> responseJson = new HashMap<>();
            responseJson.put("success", false);
            responseJson.put("errorMessage", e.getMessage());
            try {
                response.getWriter().write(new ObjectMapper().writeValueAsString(responseJson));
            } catch (IOException ex) {
                log.error("Error occurred while sending error response: {}", ex.getMessage(), ex);
            }
        }
    }
	
	//체크박스 선택 요소들 다중삭제
    @PostMapping("/so/deleteReturnDetail")
    public ResponseEntity<Map<String, Boolean>> deleteReturnDetail(@RequestBody List<Integer> sorder) {
        System.out.println(sorder);
        log.debug("deleteReturnDetail called with sorder: {}", sorder);
        log.error("deleteReturnDetail called with sorder: {}", sorder);
    	Map<String, Boolean> response = new HashMap<>();
    	
        returnDetailService.deleteReturnDetail(sorder);
        response.put("success", true);

        return ResponseEntity.ok(response);
    }
	
    //더블클릭해서 returnDetailChild 연결
	@GetMapping("/so/returnDetailChild")
	public String ReturnDetailChild() {
		return "/so/returnDetailChild";
	}
	
    //아이템코드로 조회 자식창
    @GetMapping("/so/getItem")
    @ResponseBody
    public ResponseEntity<List<Map<String, String>>> getItem(HttpSession session) throws Exception {
    	UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
    	String company_code = loginUser.getCompanyCode();
    	System.out.println(company_code);
    	List<Map<String, String>> result = returnDetailService.getItem(company_code);
        System.out.println("Returning JSON data: " + new ObjectMapper().writeValueAsString(result));
        return ResponseEntity.ok(result);
    }
	
    //반품확정 조회 View테이블
    @GetMapping("/so/getReturnInfo")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> getReturnInfo(HttpSession session) throws Exception {
    	UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
    	String company_code = loginUser.getCompanyCode();
    	System.out.println(company_code);
    	List<Map<String, Object>> result = returnDetailService.getReturnInfo(company_code);
    	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        for (Map<String, Object> resultMap : result) {
            Date receiveDate = (Date) resultMap.get("receive_date");
            String formattedDate = sdf.format(receiveDate);
            resultMap.put("receive_date", formattedDate);
        }
    	
        System.out.println("Returning JSON data: " + new ObjectMapper().writeValueAsString(result));
        return ResponseEntity.ok(result);
    }
    
    
}

