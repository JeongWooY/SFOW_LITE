package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.model.ModalVO;
import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReqMgmtRepositoryImpl implements ReqMgmtRepository{
	
	private final SqlSessionTemplate sqlSession;
	//검색리스트
	@Override
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO, String company_code) throws DataAccessException {
		
			Map<String, Object>map=new HashedMap();
			map.put("reqMgmtDTO", reqMgmtDTO);
			map.put("company_code", company_code);
			
	        List<ReqMgmtDTO> list= sqlSession.selectList("mapper.ReqMgmt.reqMgmtList",map);
	        return list;
	}
	//입고관리수정
	@Override
	public int reqMgmtUp(ReqMgmtDTO reqMgmtDTO) throws DataAccessException {
		int cnt=sqlSession.update("mapper.ReqMgmt.reqMgmtUp",reqMgmtDTO);
		return cnt;
	}
	//입고관리입력
	@Override
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws DataAccessException {
		sqlSession.insert("mapper.ReqMgmt.reqMgmtIn",reqMgmtIn);	
	}
	//입고관리삭제-수정
	@Override
	public void reqMgmtDelete(String in_number) throws DataAccessException {
		sqlSession.update("mapper.ReqMgmt.reqMgmtDelUp", in_number);	
	}
	//입고관리세부항목보기
	@Override
	public List<ReqMgmtDetailDTO> reqMgmtDetail(String in_number) throws DataAccessException {
		List<ReqMgmtDetailDTO> detail = sqlSession.selectList("mapper.ReqMgmt.reqMgmtDetail",in_number);
		return detail;
	}
	//세부항목수정
	@Override
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException {
		System.out.println("세부수정레파전"+reqMgmtDetailDTO);
		sqlSession.update("mapper.ReqMgmt.reqMgmtDetailUp", reqMgmtDetailDTO);
		System.out.println("세부수정레파후"+reqMgmtDetailDTO);
		
	}
	//세부항목입력
	@Override
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException {
		sqlSession.insert("mapper.ReqMgmt.reqMgmtDetailIn",reqMgmtDetailDTO);
	}
	
	//modalList
	//발주
	@Override
	public List<ModalVO> reqPO(String mcompany_code) throws DataAccessException {
		List<ModalVO> reqPOList=sqlSession.selectList("mapper.ReqMgmt.reqPO", mcompany_code);
		return reqPOList;
	}
	//거래처
	@Override
	public List<ModalVO> reqCCMList(String mcompany_code) {
		return sqlSession.selectList("mapper.ReqMgmt.reqCCMList",mcompany_code);
	}
	//검색
	@Override
	public List<ModalVO> reqCCM(ModalVO modalVO) throws DataAccessException {
		List<ModalVO> reqCCMList=sqlSession.selectList("mapper.ReqMgmt.reqCCM", modalVO);
		return reqCCMList;
	}
	//세부항목모달
	@Override
	public List<ModalVO> reqDetailM() {
		List<ModalVO> reqModalDetail =sqlSession.selectList("mapper.ReqMgmt.reqDetailModal");
		return reqModalDetail;
	}
	//창고모달
	@Override
	public List<ModalVO> reqWHCode(String mcompany_code) {
		List<ModalVO> reqWHCode=sqlSession.selectList("mapper.ReqMgmt.reqWList",mcompany_code);
		return reqWHCode;
	}
	

}
