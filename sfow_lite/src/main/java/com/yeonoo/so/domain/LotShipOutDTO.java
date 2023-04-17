package com.yeonoo.so.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class LotShipOutDTO {

	private String lotNo;		// LOT 번호
	private String itemCode;	// ITEM 코드
	private String itemName;	// 품명
	private String itemNo;		// 품번
	private String itemSpec;	// 규격
	private Integer quantity;	// 재고수량
	private String warehouseCode;	// 창고코드
}
