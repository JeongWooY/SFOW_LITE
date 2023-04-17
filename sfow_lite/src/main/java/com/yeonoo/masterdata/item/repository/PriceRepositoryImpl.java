package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PriceRepositoryImpl implements PriceRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체  조회
		@Override
		@ResponseBody
		public List<PriceDTO> priceList(PriceDTO dto, String companyCode) {
			if (	dto.getItemCategory()==null
					&&dto.getItemCode()==null
					&&dto.getItemName()==null
					&&dto.getItemNo()==null
					&&dto.getItemSpecification()==null
					&&dto.getClientCode()==null
					&&dto.getClientName()==null
					&&dto.getUseyn()==null) {
				
				Map<String, Object> map = new HashedMap();
				map.put("dto", dto);
				map.put("companyCode", companyCode);
				
				List<PriceDTO> allList = sqlSession.selectList("price.priceList",map);
				return allList;
			}else
			{
				Map<String, Object> map = new HashedMap();
				map.put("dto", dto);
				map.put("companyCode", companyCode);
				List<PriceDTO> List = sqlSession.selectList("price.priceListSearch", map);
				return List;
			}
				
		}

		//  등록
				@Override
				public int insertPrice(PriceDTO elements, String companyCode) {
					 
					Map<String, Object> map = new HashedMap();
					map.put("elements", elements);
					map.put("companyCode", companyCode);
					return sqlSession.insert("price.insertPrice", map);
				}


				//  수정
				@Override
				public int updatePrice(PriceDTO elements, String companyCode) {
				
					Map<String, Object> map = new HashedMap();
					map.put("elements", elements);
					map.put("companyCode", companyCode);
					int cnt = sqlSession.update(" price.updatePrice", map);
					return cnt;
				}

				//  삭제(상태업데이트)
				@Override
				public int deletePrice(String itemCode, String companyCode) {
					
					Map<String, Object> map = new HashedMap();
					map.put("itemCode", itemCode);
					map.put("companyCode", companyCode);
					return sqlSession.update("price.useUpdate", map);
				}
		
		
		//거래처명 목록
		public List<PriceDTO> companycodeSelectAjax() throws DataAccessException {
			List<PriceDTO> companycodelist = sqlSession.selectList("price.companycodeList");
			return companycodelist;
		}
		//아이템코드 목록
		public List<PriceDTO> itemcodeSelectAjax() throws DataAccessException{
			List<PriceDTO> itemcodelist = sqlSession.selectList("price.itemcodeList");
			return itemcodelist;
		}
}
