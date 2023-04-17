package com.yeonoo.masterdata.item.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)	
public class RawDTO {
	
	//Field
	private String companyCode;
	private String itemCode;			//item코드
	private String itemName;			//품명
	private String itemNo;				//품목번호
	private String itemType;			//유형
	private String itemSpecification;	//규격
	private String itemStockUnit; 		//재고단위
	private String clientCode;
	private String clientName;			//거래처명
	private String warehouseCode;		//입고창고
	private String warehouseName;			//창고명
	private String memo;				//비고
	private String useyn;				//사용여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
	private Date createdate;	//등록일시
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
	private Date updatedate;	//수정일시
	private String itemCategory;
	private int no;
	
	
}



