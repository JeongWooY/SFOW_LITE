package com.yeonoo.sfow.stock.domain;

import lombok.Data;

@Data
public class Stock {

	String company_code;
	String item_code; 
	String warehouse_code;
	String warehouse_name;
	String area_code;
	String lot_no;
	String item_type;
	String item_name;
	int pass_quantity;
	int fail_quantity;
	int quantity;
	String stock_status;
	
}
