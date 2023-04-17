package com.yeonoo.sfow.ppPerform.domain;

import lombok.Data;

@Data
public class PerStock {

	String company_code;
	String item_code; 
	String warehouse_code;
	String warehouse_name;
	String area_code;
	String lot_no;
	String item_type;
	String item_name;
	int quantity;
	String stock_status;
	
}
