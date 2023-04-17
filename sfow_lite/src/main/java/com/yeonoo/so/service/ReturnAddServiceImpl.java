package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.so.controller.ReturnAddController;
import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.repository.ReturnAddRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReturnAddServiceImpl implements ReturnAddService {

	@Autowired
	ReturnAddRepository returnAddRepository;
	
	public List<ReturnAdd> getReturnAdd(String company_code) throws Exception{
		return returnAddRepository.getReturnAdd(company_code);
	}
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date, String company_code) throws Exception{
		 return returnAddRepository.getReturnAddByDate(return_date, company_code);
	}
	
	//행 삭제
    public void deleteReturnAdd(String returnNumber) {
        returnAddRepository.deleteByReturnNumber(returnNumber);
    }
    
    //저장
    public void saveCreateRows(List<Map<String, Object>> createRows) throws Exception {
        log.info("Saving create rows: {}", createRows);
    	for (Map<String, Object> row : createRows) {
            returnAddRepository.insertReturnAdd(row);
        }
    }
    
    //수정
    public void saveUpdateRows(List<Map<String, Object>> updateRows) throws Exception {
        log.info("Saving update rows: {}", updateRows);
    	for (Map<String, Object> row : updateRows) {
            returnAddRepository.updateReturnAdd(row);
        }
    }
    
    //회사조회
	public List<Map<String, String>> getClient(String company_code) throws Exception{
		return returnAddRepository.getClient(company_code);
	}
    
	//상태 확정
    public void conFirmStatus(String returnNumber, String company_code) throws Exception{
    	returnAddRepository.conFirmStatus(returnNumber, company_code);
    }
    
	//상태 저장
    public void cancelStatus(String returnNumber, String company_code) throws Exception{
    	returnAddRepository.cancelStatus(returnNumber, company_code);
    }

	//회사코드로 반품확정 조회
	public List<Map<String, Object>> getInfoByClient(String client_code, String company_code) throws Exception {
		return returnAddRepository.getInfoByClient(client_code, company_code);
		
	}
}
