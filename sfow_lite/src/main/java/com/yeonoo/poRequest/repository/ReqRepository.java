package com.yeonoo.poRequest.repository;

import java.util.List;

import com.yeonoo.poRequest.model.ReqDetailVO;
import com.yeonoo.poRequest.model.ReqModalVO;
import com.yeonoo.poRequest.model.ReqVO;

public interface ReqRepository {
	
	public List<ReqVO> reqOrder(ReqVO reqVO,String company_code) throws Exception;
	
	public List<ReqModalVO> reqOrder1(ReqModalVO reqModalVO,String company_code) throws Exception;

	public List<ReqDetailVO> reqOrderDetail(String request_number) throws Exception;
	
	public int reqUpdate(ReqVO reqVO)throws Exception;
	
	public void reqDel(String request_number)throws Exception;

	public int reqDetailUpdate(ReqDetailVO reqDetailVO)throws Exception;

	public void reqInsert(ReqVO req)throws Exception;

	public void reqDetailInsert(ReqDetailVO reqD)throws Exception;

	public List<ReqDetailVO> reqItem(ReqDetailVO reqDetailVO, String company_code)throws Exception;




}
