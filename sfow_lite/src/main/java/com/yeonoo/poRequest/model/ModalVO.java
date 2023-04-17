package com.yeonoo.poRequest.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//modal관련 VO
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModalVO {
	
	//거래처
	private int mno; //번호
	private String mclient_code; //거래처코드
	private String mclient_name; //거래처명
	
	//발주
	private String mrequest_number;//발주번호
	private String mrequest_empid;//담당자
	private String mmemo;//비고
	private String mcompany_code;//회사코드
	private String mitem_code; //코드
	private String mitem_no; //품번
	
	//창고
	private String mwarehouse_code;//창고코드
	private String mwarehouse_name;//창고명
	
	//발주상세보기
	private int mrequest_order;//번호
	private int mrequest_quantity;//요청수량
	private int mprice;//단가
	private int mamount;//공급가액
	private int mtax_amount;//부가세포함가
	private String detailmemo; //비고
	
	


}
