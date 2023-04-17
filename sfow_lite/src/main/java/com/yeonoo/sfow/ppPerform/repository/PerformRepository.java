package com.yeonoo.sfow.ppPerform.repository;

import java.util.List;

import com.yeonoo.sfow.ppPerform.domain.BOM;
import com.yeonoo.sfow.ppPerform.domain.Order;
import com.yeonoo.sfow.ppPerform.domain.Perform;

public interface PerformRepository {

	public List<Order> selectOrder(Order order);
	public void updateOrder(Order order);
	public List<Perform> selectPerform(Perform perform);
	public List<BOM> selectBOM(Perform perform);
	public Boolean insertPerform(Perform perform);
	public int selectQty(String pp_no);
	public List<Perform> selectWorker(Perform worker);
	public Boolean deletePerform(Perform perform);

}
