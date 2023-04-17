package com.yeonoo.masterdata.wh.domain;

import java.util.Date;




import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

//창고 정보

@Data
public class WH {

	private String company_code;		//PK//회사코드
	private String warehouse_type;			//창고구분
	private String warehouse_code;		//창고코드
	private String warehouse_name; 		//PK//창고명
	private String customer_code; 		//거래처코드
	private String memo; 			//비고
	private String useyn; 			//사용여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date createdate; 		//등록일
	private String createuser; 		//등록자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date updatedate;		//수정일
	private String updateuser;		//수정자
	
	
}
