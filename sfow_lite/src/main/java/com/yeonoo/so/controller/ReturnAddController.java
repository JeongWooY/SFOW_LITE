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
import org.springframework.http.HttpStatus;
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
import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.domain.ReturnDetail;
import com.yeonoo.so.service.ReturnAddService;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class ReturnAddController {

	@Autowired
	ReturnAddService returnAddService;

	
	//고객반품등록 연결
	@GetMapping("/so/returnMain")
	public String ReturnMain() {
		return "/so/returnMain";
	}
	
	//거래처코드 조회 연결
	@GetMapping("/so/returnMainChild")
	public String ReturnMainChild() {
		return "/so/returnMainChild";
	}
	
	//거래처코드 조회 연결
	@GetMapping("/so/returnInfo")
	public String ReturnInfo() {
		return "/so/returnInfo";
	}
	
	//전체 조회
	@RequestMapping(value="/so/getReturnAdd",
			   method=RequestMethod.POST)
	@ResponseBody
	public List<ReturnAdd> getReturn(HttpSession session) throws Exception {
		UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = loginUser.getCompanyCode();
		System.out.println(company_code);
		List<ReturnAdd> returnAdd = returnAddService.getReturnAdd(company_code);
		System.out.println(returnAdd);
       	// session.getAttribute로 company_code를 가져오고 그 파라미터를 리스트에 추가
		return returnAdd;
	}
	
    //선택한 날짜에 맞춰 조회
    @GetMapping("/so/getReturnAddByDate")
    @ResponseBody
    public List<ReturnAdd> getReturnAddByDate(@RequestParam(value = "return_date", required = false) String return_date, HttpSession session) throws Exception {
		UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = loginUser.getCompanyCode();
		System.out.println(company_code);
    	List<ReturnAdd> returnAddbyDate = returnAddService.getReturnAddByDate(return_date, company_code);
    	System.out.println(returnAddbyDate);
    	return returnAddbyDate;
    }
    
    //삭제
    @PostMapping("/so/deleteReturnAdd")
    public ResponseEntity<Void> deleteReturnAdd(@RequestParam("return_number") String returnNumber) throws Exception {
        System.out.println(returnNumber);
    	returnAddService.deleteReturnAdd(returnNumber);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    //저장과 수정
    @PostMapping("/so/saveReturnAdd")
    public void saveGridData(@RequestBody Map<String, Object> data, HttpServletResponse response, HttpSession session) {
        try {
        	// session.getAttribute로 company_code를 가져오고 그 파라미터를 리스트에 추가
        	UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
        	String company_code = loginUser.getCompanyCode();
        	System.out.println("companyCode"+company_code);

        	List<Map<String, Object>> createRows = (List<Map<String, Object>>) data.get("createRows");
            List<Map<String, Object>> updateRows = (List<Map<String, Object>>) data.get("updateRows");
            
            for (Map<String, Object> row : createRows) {
                row.put("company_code", company_code);
            }

            for (Map<String, Object> row : updateRows) {
                row.put("company_code", company_code);
            }
            
            // 로그 추가
            System.out.println(("Received data: {}"+data));
            System.out.println("Create Rows: {}"+ createRows);
            System.out.println("Update Rows: {}"+ updateRows);
            
            returnAddService.saveCreateRows(createRows);
            returnAddService.saveUpdateRows(updateRows);
            
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
    
    //반품상태 확정으로 변경
    @PostMapping("/so/conFirmStatus")
    @ResponseBody
    public ResponseEntity<Void> conFirmStatus(@RequestParam("return_number") String return_number, HttpSession session) throws Exception {
    	UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
    	String company_code = loginUser.getCompanyCode();
    	System.out.println(return_number+company_code);
    	returnAddService.conFirmStatus(return_number, company_code);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    //반품상태 저장으로 변경
    @PostMapping("/so/cancelStatus")
    @ResponseBody
    public ResponseEntity<Void> cancelStatus(@RequestParam("return_number") String return_number, HttpSession session) throws Exception {
    	UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
    	String company_code = loginUser.getCompanyCode();
    	System.out.println(return_number+company_code);
    	returnAddService.cancelStatus(return_number, company_code);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    //거래처코드와 거래처명 조회. 자식창
    @GetMapping("/so/getClient")
    @ResponseBody
    public ResponseEntity<List<Map<String, String>>> getClient(HttpSession session) throws Exception {
		UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = loginUser.getCompanyCode();
		System.out.println(company_code);
    	List<Map<String, String>> result = returnAddService.getClient(company_code);
        System.out.println("Returning JSON data: " + new ObjectMapper().writeValueAsString(result));
        return ResponseEntity.ok(result);
    }
    
    //returnInfo에서 거래처코드로 조회
    @GetMapping("/so/getInfoByClient")
    @ResponseBody
    public List<Map<String, Object>> getInfoByClient(@RequestParam(value = "client_code", required = false) String client_code, HttpSession session) throws Exception {
		UserInfo loginUser = (UserInfo) session.getAttribute("AUTHUSER");
		String company_code = loginUser.getCompanyCode();
		System.out.println("client_code"+client_code);
		System.out.println("company_code"+company_code);
		List<Map<String, Object>> result = returnAddService.getInfoByClient(client_code, company_code);
    	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        for (Map<String, Object> resultMap : result) {
            Date receiveDate = (Date) resultMap.get("receive_date");
            String formattedDate = sdf.format(receiveDate);
            resultMap.put("receive_date", formattedDate);
        }
		
        System.out.println(result);
    	return result;
    }
    
    
}

