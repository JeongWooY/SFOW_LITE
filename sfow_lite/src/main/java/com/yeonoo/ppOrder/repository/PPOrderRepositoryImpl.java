package com.yeonoo.ppOrder.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.ppOrder.domain.PPOrder;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PPOrderRepositoryImpl implements PPOrderRepository {

	// 필드
	private final SqlSession sqlSession;

	// 전체 목록 조회
	@Override
	public List<PPOrder> getPPOrderAllList(PPOrder ppOrder) throws DataAccessException {

		List<PPOrder> list = sqlSession.selectList("mapper.PPOrder.PPOrderList", ppOrder);
		System.out.println("list" + list);
		return list;
}
	// 등록하기
	@Override
	public int insertPPOrder(PPOrder elements) throws DataAccessException {
		System.out.println("레파지토리 전=" + elements);
		int cnt =sqlSession.insert("mapper.PPOrder.insertPPOrder", elements);
		System.out.println("레파지토리 후=" + cnt);
		return cnt;
	}
	

	// 수정하기
	public int updatePPOrder(PPOrder ppOrder) throws DataAccessException {
		System.out.println("레파지토리 전=" + ppOrder);
		int cnt = sqlSession.update("mapper.PPOrder.updatePPOrder", ppOrder);
		  System.out.println("레파지토리 후=" + cnt);
		return cnt;
	}

	//삭제하기(업데이트버전)
    @Override
    public int deletePPOrder(String ppOrder) {
       
       return sqlSession.update("mapper.PPOrder.deletePPOrder", ppOrder);
    }
	
}
