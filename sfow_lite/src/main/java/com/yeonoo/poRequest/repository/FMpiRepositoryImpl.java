package com.yeonoo.poRequest.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.domain.FMpi;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class FMpiRepositoryImpl implements FMpiRepository{

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	
	//전체 목록 조회
	@Override
	public List<FMpi> getFMpiAllList(FMpi fMpi) throws DataAccessException {
		if(
				fMpi.getIn_number()==null 
	            &&fMpi.getItem_code()==null
	            &&fMpi.getIn_date()==null
	            &&fMpi.getWarehouse_code()==null ) {
			
			List<FMpi> allList = sqlSession.selectList("mapper.FMpi.FMpiAllList");
			System.out.println("allList"+allList);
			return allList;
		
	}else
		
	{
		List<FMpi> list = sqlSession.selectList("mapper.FMpi.FMpiList", fMpi);
		System.out.println("list" + list);
		return list;
		
	}
}	
	//수정하기
	public int updateFMpi(FMpi fMpi) throws DataAccessException {
		int cnt=sqlSession.update("mapper.FMpi.updateFMpi", fMpi);
		System.out.println("cnt="+cnt);
		return cnt;
	}
	
	
}
