package com.yeonoo.masterdata.item.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.masterdata.item.domain.BomItem;

@Repository
public class BomRepositoryImpl implements BomRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BomItem> getItemList(String company_code) throws DataAccessException {
		List<BomItem> list = sqlSession.selectList("mapper.bom.getItemList", company_code);
		return list;
	}
	
	@Override
	public List<BomItem> getBomTree(String ppitem_cd, String company_code) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("ppitem_cd", ppitem_cd);
		map.put("company_code", company_code);
		List<BomItem> list = sqlSession.selectList("mapper.bom.getBomTree", map);
		return list;
	}
	
	@Override
	public BomItem selectItem(String ppitem_cd, String company_code) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("item_code", ppitem_cd);
		map.put("company_code", company_code);
		BomItem item = sqlSession.selectOne("mapper.bom.selectItem", map);
		return item;
	}
	
	@Override
	public List<BomItem> searchItemListByName(String item_name, String company_code) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("item_name", item_name);
		map.put("company_code", company_code);
		List<BomItem> list = sqlSession.selectList("mapper.bom.searchItemListByName", map);
		return list;
	}
	
	@Override
	public List<BomItem> searchItemList(String company_code) throws DataAccessException {
		List<BomItem> list = sqlSession.selectList("mapper.bom.searchItemList", company_code);
		return list;
	}
	
	@Override
	public void updateTree(String ppitem_cd, BomItem bomItem, String company_code) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ppitem_cd", ppitem_cd);
		map.put("bomItem", bomItem);
		map.put("company_code", company_code);
		sqlSession.update("mapper.bom.updateTree", map);
	}
	
	@Override
	public void insertTree(String ppitem_cd, BomItem bomItem, String company_code) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ppitem_cd", ppitem_cd);
		map.put("bomItem", bomItem);
		map.put("company_code", company_code);
		sqlSession.insert("mapper.bom.insertTree", map);
	}
	
	@Override
	public void deleteTree(String ppitem_cd, BomItem bomItem, String company_code) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ppitem_cd", ppitem_cd);
		map.put("bomItem", bomItem);
		map.put("company_code", company_code);
		sqlSession.delete("mapper.bom.deleteTree", map);
	}
}
