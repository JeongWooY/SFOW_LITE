package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.item.domain.BomItem;

public interface BomRepository {

	public List<BomItem> getItemList(String company_code) throws DataAccessException;

	public List<BomItem> getBomTree(String ppitem_cd, String company_code) throws DataAccessException;

	public BomItem selectItem(String ppitem_cd, String company_code) throws DataAccessException;

	public List<BomItem> searchItemListByName(String item_name, String company_code) throws DataAccessException;

	public List<BomItem> searchItemList(String company_code) throws DataAccessException;

	public void updateTree(String ppitem_cd, BomItem bomItem, String company_code) throws DataAccessException;

	public void insertTree(String ppitem_cd, BomItem bomItem, String company_code) throws DataAccessException;

	public void deleteTree(String ppitem_cd, BomItem bomItem, String company_code) throws DataAccessException;
}
