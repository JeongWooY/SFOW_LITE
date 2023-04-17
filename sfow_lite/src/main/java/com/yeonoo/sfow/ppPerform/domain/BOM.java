package com.yeonoo.sfow.ppPerform.domain;

import lombok.Data;

@Data
public class BOM {
		
		int bomdno;	
		String company_code;
		String ppitem_cd;	
		String sitem_cd;
		String item_name;	
		String item_no;	
		String item_specification;
		String item_qty;
		String item_stock_unit;	
		String warehouse_code;
		int quantity;
}
