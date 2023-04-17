package com.yeonoo.stock.domain;

import lombok.Data;

@Data
public class Stock {


	String company_code; 				//회사코드
	String item_category; 				//품목구분
	String item_code; 					//아이템코드
	String item_name; 					//품명
	String item_no; 					//품목코드
	String item_specification; 			//규격
	String item_stock_unit;				//재고단위
	int pass_quantity; 					//양품수량
	int fail_quantity; 					//불량수량
	int quantity; 						//수량
	String stock_status; 				//재고상태
	String warehouse_code;
	String area_code;
	String lot_no;
	String warehouse_name;


	
}
