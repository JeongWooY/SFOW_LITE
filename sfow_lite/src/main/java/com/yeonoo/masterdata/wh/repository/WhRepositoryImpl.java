package com.yeonoo.masterdata.wh.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.domain.WH_detail;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WhRepositoryImpl implements WhRepository {

	@Autowired
	private SqlSession sqlSession;
	
	//전체목록조회
	@Override
	public List<WH> getWhAllList(String company_code) throws DataAccessException{
		List<WH> list =	sqlSession.selectList("mapper.warehouse.whAllList",company_code);
		
	    return list;
	}
	
	public List<WH> getsearchWH(WH searchwh) throws DataAccessException{
		List<WH> list =	sqlSession.selectList("mapper.warehouse.searchWH",searchwh);
		//List<WH> list2 =	sqlSession.selectList("mapper.warehouse.searchWH",company_code);
		
		return list;
	}

	//그리드1 에서 특정 행 warehouse_code 로  Area 정보 가져오기
	@Override
	public List<WH_detail> WHarea(String warehouse_code) throws DataAccessException {
		return	sqlSession.selectList("mapper.warehouse.wharea",warehouse_code);
		
	}
	
	//저장버튼 insert
	@Override
	public int insertWH(WH elements) throws DataAccessException {
		int cnt = sqlSession.update("mapper.warehouse.insertWH", elements);
		
		return cnt;
	}

	public int deleteWH(WH wh) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.warehouse.deleteWH", wh);
		
		return cnt;
	}

	public int updateWH(WH wh) throws DataAccessException {
		int  cnt = sqlSession.update("mapper.warehouse.updateWH", wh);
		
		return cnt;
	}

	//Area 저장버튼 insert
		public int insertDetail(WH_detail elements) throws DataAccessException {
			int cnt = sqlSession.insert("mapper.warehouse.insertDetail", elements);
			
			return cnt;
		}

		
}
