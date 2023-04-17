package com.yeonoo.sfow.ppPerform.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.sfow.ppPerform.domain.BOM;
import com.yeonoo.sfow.ppPerform.domain.Order;
import com.yeonoo.sfow.ppPerform.domain.Perform;
import com.yeonoo.sfow.ppPerform.repository.PerformRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PerformServiceImpl implements PerformService {
	
	private final PerformRepository performRepository;
	
	@Override
	public List<Order> selectOrder(Order order) {
		List<Order> result= performRepository.selectOrder(order);
		return result;
	}

	@Override
	public void updateOrder(Order order) {
		performRepository.updateOrder(order);
	}

	@Override
	public List<Perform> selectPerform(Perform perform) {
		List<Perform> result=performRepository.selectPerform(perform);
		return result;
	}

	@Override
	public List<BOM> selectBOM(Perform perform) {
		List<BOM> bom=performRepository.selectBOM(perform);
		return bom;
	}

	@Override
	public Boolean insetPerform(Perform perform) {
		Boolean isSuccess=performRepository.insertPerform(perform);
		return isSuccess;
	}

	@Override
	public int selectQty(String pp_no) {
		int sum=performRepository.selectQty(pp_no);
		return sum;
	}

	@Override
	public List<Perform> selectWorker(Perform worker) {
		List<Perform> workers=performRepository.selectWorker(worker);
			
		return workers;
	}

	@Override
	public Boolean deletePerform(Perform perform) {
		Boolean isSuccess=performRepository.deletePerform(perform);
		return isSuccess;
	}
	
	
}
