package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.ItemType;
import com.yeonoo.masterdata.item.domain.SemiDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SemiRepositoryImpl implements SemiRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체 반제품 조회
		@Override
		@ResponseBody
		public List<SemiDTO> semiList(SemiDTO dto, String companyCode) {
			if (	dto.getItemCode()==null
					&&dto.getItemName()==null
					&&dto.getItemNo()==null) {
				Map<String, Object> map = new HashedMap();
				map.put("dto", dto);
				map.put("companyCode", companyCode);
				List<SemiDTO> allList = sqlSession.selectList("semi.semiList",map);
				return allList;
			}else
			{
				Map<String, Object> map = new HashedMap();
				map.put("dto", dto);
				map.put("companyCode", companyCode);
				
				List<SemiDTO> List = sqlSession.selectList("semi.semiListSearch", map);
				return List;
			}
				
		}

		
		// 반제품 등록
		@Override
		public int insertSemi(SemiDTO elements, String companyCode) {
			 System.out.println(elements);
			Map<String, Object> map = new HashedMap();
			map.put("elements", elements);
			map.put("companyCode", companyCode);
			System.out.println("2"+elements);
			return sqlSession.insert("semi.insertSemi", map);
		}


		// 반제품 정보 수정
		@Override
		public int updateSemi(SemiDTO elements, String companyCode) {
		
			Map<String, Object> map = new HashedMap();
			map.put("elements", elements);
			map.put("companyCode", companyCode);
			int cnt = sqlSession.update("semi.updateSemi", map);
			return cnt;
		}

		// 반제품 품목 삭제(상태업데이트)
		@Override
		public int deleteSemi(String itemCode, String companyCode) {
			
			Map<String, Object> map = new HashedMap();
			map.put("itemCode", itemCode);
			map.put("companyCode", companyCode);
			return sqlSession.update("semi.useUpdate", map);
		}

		// 거래처 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalClient() {
			
			return sqlSession.selectList("semi.getModalClient");
		}


		//품목유형등록(제품) 목록
		public List<ItemType> selectItemTypeList() throws DataAccessException{
			List<ItemType> itemtype = sqlSession.selectList("mapper.semi.selectitem_type");
			return itemtype;
		}


		//품목유형등록(제품) 검색
		public List<ItemType> typeSelectSearchAjax(ItemType itemtype) throws DataAccessException {
			List<ItemType> itemtypeselectsearch = sqlSession.selectList("mapper.semi.typeselectsearch",itemtype);
					return itemtypeselectsearch;
		}



}
