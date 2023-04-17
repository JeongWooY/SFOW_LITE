package com.yeonoo.stock.repository;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.stock.domain.Stock;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StockByItemRepositoryImpl implements StockByItemRepository{
	
	private final SqlSession sqlSession;
	
	//그리드 조회
	@Override
	public List<Stock> stockByItemSearch(String companyCode) {
		return sqlSession.selectList("mapper.stockByItem.stockByItemSearch", companyCode);
	}
	
	//검색어조회
	@Override
	public List<Stock> stockByItemSearchByKeyword(Stock stock, String companyCode){
		
		Map<String, Object> map = new HashedMap();
		map.put("companyCode" , companyCode);
		map.put("stock" , stock);
		
		
		List<Stock> result =  sqlSession.selectList("mapper.stockByItem.stockByItemSearchByKeyword", map);
		System.out.println("레파지토리impl 검색어조회 리절트"+result);
		return result;
	}
	
	//그리드 수정
	/*	public void stockByItemUpdate(Stock stock) {
			sqlSession.selectList("mapper.stockByItem.stockByItemUpdate", stock);
		}*/


	
}
