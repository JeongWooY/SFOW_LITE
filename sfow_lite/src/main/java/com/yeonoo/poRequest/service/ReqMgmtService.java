package com.yeonoo.poRequest.service;

import java.util.List;

import com.yeonoo.poRequest.model.ModalVO;
import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;

public interface ReqMgmtService {
	//검색리스트
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO, String company_code) throws Exception;
	//입고관리수정
	public int reqMgmtUpdate(ReqMgmtDTO reqMgmtDTO) throws Exception;
	//입고관리입력
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws Exception;
	//입고관리삭제-수정
	public void reqMgmtDelete(String in_number) throws Exception;
	//입고관리세부항목보기
	public List<ReqMgmtDetailDTO> reqMgmtDetail(String in_number) throws Exception;
	//세부항목수정
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception;
	//세부항목입력
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception;
	
	//modalList
	//발주
	public List<ModalVO> reqPO(String mcompany_code) throws Exception;
	//거래처
	public List<ModalVO> reqCCMList(String mcompany_code);
	
	//검색
	public List<ModalVO> reqCCM(ModalVO modalVO)throws Exception;
	//세부항목모달
	public List<ModalVO> reqDetailM();
	//창고모달
	public List<ModalVO> reqWHCode(String mcompany_code);
	




}
