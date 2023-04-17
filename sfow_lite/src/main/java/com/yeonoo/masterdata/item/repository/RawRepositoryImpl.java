package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.domain.SemiDTO;

@Repository
public class RawRepositoryImpl implements RawRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체 원자재 조회
		@Override
		@ResponseBody
		public List<RawDTO> rawList(RawDTO dto, String companyCode) {
			if (	dto.getItemCode()==null
					&&dto.getItemName()==null
					&&dto.getItemNo()==null
					&&dto.getItemSpecification()==null) {
				Map<String, Object> map = new HashedMap();
				map.put("dto", dto);
				map.put("companyCode", companyCode);
				List<RawDTO> allList = sqlSession.selectList("raw.rawList",map);
				return allList;
			}else
			{
				Map<String, Object> map = new HashedMap();
				map.put("dto", dto);
				map.put("companyCode", companyCode);
				
				List<RawDTO> List = sqlSession.selectList("raw.rawListSearch", map);
				return List;
			}
		}

		// 원자재 등록
		@Override
		public int insertRaw(RawDTO elements, String companyCode) {
			Map<String, Object> map = new HashedMap();
			map.put("elements", elements);
			map.put("companyCode", companyCode);
			return sqlSession.insert("raw.insertRaw", map);
		}


		// 반제품 정보 수정
		@Override
		public int updateRaw(RawDTO elements, String companyCode) {
			
			Map<String, Object> map = new HashedMap();
			map.put("elements", elements);
			map.put("companyCode", companyCode);
			int cnt = sqlSession.update("raw.updateRaw", map);
			return cnt;
		}

		// 반제품 품목 삭제
		@Override
		public int deleteRaw(String itemCode,String companyCode) {
			Map<String, Object> map = new HashedMap();
			map.put("itemCode", itemCode);
			map.put("companyCode", companyCode);
			return sqlSession.update("raw.useUpdate", map);
		}
		
		// -------- Modal ---------------------
		
		// 거래처 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalClient() {
			
			return sqlSession.selectList("raw.getModalClient");
		}

		// 유형 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalType() {
			
			return sqlSession.selectList("raw.getModalType");
		}
		
		// 규격 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalSpecification() {
			
			return sqlSession.selectList("raw.getModalSpecification");
		}
		
		// 재고단위 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalStockUnit() {
			
			return sqlSession.selectList("raw.getModalStockUnit");
		}		


}
