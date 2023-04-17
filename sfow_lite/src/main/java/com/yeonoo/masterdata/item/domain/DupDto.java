package com.yeonoo.masterdata.item.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class DupDto {
	private String ppitem_cd;
	private List<BomItem> rowData;
}
