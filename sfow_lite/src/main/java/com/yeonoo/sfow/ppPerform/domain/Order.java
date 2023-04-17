package com.yeonoo.sfow.ppPerform.domain;

import lombok.Data;

@Data
public class Order {
	
	String pp_no;	
	String company_code;	
	String pp_type;
	String pp_date;
	String end_date;	
	String item_code;	
	String item_name;
	String item_no;
	String item_spec;	
	String wh_code;
	String wh_name;
	String pp_quantity;
	String pp_status;
	String per_sTime;
	String per_eTime;
	int bomdno;
	String warehouse_name;
	String warehouse_code;
}
