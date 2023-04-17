package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.poRequest.model.ModalVO;
import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;



public interface ReqMgmtRepository {
	//검색리스트
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO, String company_code) throws DataAccessException;
	//입고관리수정
	public int reqMgmtUp(ReqMgmtDTO reqMgmtDTO) throws DataAccessException;
	//입고관리입력
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws DataAccessException;
	//입고관리삭제-수정
	public void reqMgmtDelete(String in_number) throws DataAccessException;
	//입고관리세부항목보기
	public List<ReqMgmtDetailDTO> reqMgmtDetail(String in_number) throws DataAccessException;
	//세부항목수정
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException;
	//세부항목입력
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException;
	
	//modalList
	//발주
	public List<ModalVO> reqPO(String mcompany_code) throws DataAccessException;
	//거래처
	public List<ModalVO> reqCCMList(String mcompany_code);
	//검색
	public List<ModalVO> reqCCM(ModalVO modalVO) throws DataAccessException;
	//세부항목모달
	public List<ModalVO> reqDetailM();
	//창고모달
	public List<ModalVO> reqWHCode(String mcompany_code);
	
	
}
