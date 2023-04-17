package com.yeonoo.masterdata.item.domain;

import java.util.Date;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)

public class PriceDTO {
	
	private String companyCode;		//회사코드
	private String itemCategory;
	private String itemCode;		//품목검색
	private String itemName;		//품명
	private String itemNo;			//품목번호
	private String itemSpecification;//규격
	private String clientCode;		//거래처코드
	private String clientName;		//거래처명
	private Date startDate;			//시작일
	private Date endDate;			//종료일
	private int buyPrice;			//매입가격
	private int salesPrice;			//매출가격
	private String memo;			//비고
	private String useyn;			//사용여부
	
	
}
