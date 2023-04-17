package com.yeonoo.so.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ItemShipOutDTO {

	private String outCode;     	// 출하코드    PK  (so_shipout 테이블)
	private String orderNumber; 	// 수주번호    PK  (so_order_detail 테이블)
	private String itemCode;		// ITEM코드 PK  (so_order_detail 테이블)
	private Integer quantity;    	// 수량                  (so_order_detail 테이블)
	private Integer price;           // 단가                  (so_order_detail 테이블)
	private Integer amount;          // 총액	      (so_order_detail 테이블)
	private String itemStockUnit;   // 재고단위	  (so_order_detail 테이블)
	private String itemName;        // 품명		  (ma_item 테이블)	
	private String itemNo;   	    // 품번                   (ma_item 테이블)
		 
}
