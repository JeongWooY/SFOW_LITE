package com.yeonoo.poRequest.model;

import java.util.Date;
import java.util.Iterator;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReqVO {
	
	private String request_number;
	private String request_type;
	/*
	 * @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd" ,timezone="Asia/Seoul") private Date
	 * request_date;
	 */
	private String request_date;
	private String request_empid;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm",timezone="Asia/Seoul")
	private Date createdate;
	private String memo;
	private String delyn;
	private String company_code;
	
	

}


	


