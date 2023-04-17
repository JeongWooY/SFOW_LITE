package com.yeonoo.poRequest.model;

import lombok.Data;

@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class ReqDetailVO {
	
	private int request_order;
	private int request_quantity;
	private int price;
	private int buy_price;
	private int amount;
	private int tax_amount;
	private String memo;
	private String request_number;
	private int no;
	private String item_code;
	private String item_name;
	private String item_no;
	private String item_stock_unit;
	private String client_name;
	private String company_code;

}
