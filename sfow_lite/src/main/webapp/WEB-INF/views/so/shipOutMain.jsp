<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

	<title>출하등록</title>

	<style>
	.custom-button {
	    background-color: rgba(051, 51, 102, 1);
	    font-weight: bolder;
	    color: #fff;
	    border: none;
	}
	
	#addRow:hover, #changeStatus:hover, #updateRow:hover {
	  background-color: rgba(051, 102, 204, 1);
	  opacity: 0.8;
	}
	
	#deleteRowBtn:hover, #resetRow:hover, #resetBtn:hover {
	  background-color: rgba(204, 000, 051, 1);
	  opacity: 0.8;
	}
	
	#addRowBtn:hover, #searchBtn:hover {
	  background-color: rgba(80, 201, 141);
	  opacity: 0.8;
	}
	</style>
	
	<script>
	
	var contextPath = '<%= request.getContextPath()%>';
	
	$(document).ready(window.onload=function() {
		
		
		
		$('#searchBtn').on('click', function() {

			gridItem.clear();
			gridLot.clear();
			
		    var searchData = {
		    		"outCode" : $("#outCode").val(),
		    		"orderNumber" : $("#orderNumber").val(),
		    		"clientCode" : $("#clientCode").val(),
		    		"companyCode" : $("#companyCode").val(),
		    		"outType" : $("#outType").val(),
		    		"transType" : $("#transType").val(),
		    		"outPlanDate" : $("#outPlanDate").val(),
		    		"outManager" : $("#outManager").val(),
		    		"outStatus" : $("#outStatus").val(),
		    		"memo" : $("#memo").val(),
		    		"createDate" : $("#createDate").val(),
		    		"createUser" : $("#createUser").val(),
		    		"deleteYesNo" : $("#deleteYesNo").val()
		    }
		
			event.preventDefault(); // prevent form submission

			$.ajax({
				url : contextPath + "/shipout/list",
				method : "post",
				data : JSON.stringify(searchData),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function (shipOutList) {
					console.dir(shipOutList)
					grid.resetData(shipOutList);
				}
			});
	   });
	});

	var gridData = [];
	var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: true,
	      scrollY: true,
	      rowHeaders: ['checkbox', 'rowNum'],
	      columns: [
			{header:"출하코드", name:"outCode", align:"center", width:"auto"},
			{header:"수주번호", name:"orderNumber", align:"center", width:"auto"},
			{header:"거래처코드", name:"clientCode", align:"center", width:"auto"},
			{header:"회사코드", name:"companyCode", align:"center", width:"auto", hidden:true},
			{header:"출하유형", 
			 name:"outType",
			 align:"center",
			 editor: {
				      type: 'select',
				      options: {
				    	  		  listItems: [
											  {text: '일반출고',value: '일반출고'},
											  {text: '반품출고',value: '반품출고'},
											  {text: '생산출고',value: '생산출고'},
											  {text: '판매출고',value: '판매출고'}
										     ]
				     		   }
					 }
			},
			{header:"수불타입", 
			 name:"transType",
			 align:"center",
			 editor: {
			      type: 'select',
			      options: {
			    	  		  listItems: [
										  {text: '일반',value: '일반'},
										  {text: '사급',value: '사급'},
										  {text: '샘플',value: '샘플'},
										  {text: '불량',value: '불량'}
									     ]
			     		   }
				 }
			},
			{header:"출하계획일", 
			 name:"outPlanDate",
			 align:"center",
			 editor: {
                	    type: "datePicker",
                	    options: {
                  				  format: "yyyy-MM-dd"
                		 	     }		
           	         }
            },
			{header: "출하담당자", name:"outManager", editor:"text", align:"center"},
			{header: "상태", name:"outStatus", align:"center"},
			{header: "비고", name:"memo", editor:"text", align:"center"},
			{header: "등록일", name:"createDate", align:"center"},
			{header: "등록자", name:"createUser", align:"center"},
			{header: "수정일", name:"updateDate", align:"center"},
			{header: "수정자", name:"updateUser", align:"center"},
			{header: "삭제여부", name:"deleteYesNo", align:"center", hidden:true}
	      ]
	});

	// 1개의 row 체크박스 클릭시 검색창에 출하코드, 수주번호, 거래처코드, 회사코드, ITEM코드 출력
	grid.on('check', function(ev) {
		
		gridItem.clear();
		gridLot.clear();
		
		const rowKey = ev.rowKey;
		const columnName = ev.columnName;
		var updatedData = {};
		const rowData = grid.getRow(rowKey);
		console.log('Row data: ', rowData);
		
		var outCode = document.getElementById("outCode");  			// 출하코드
		var orderNumber = document.getElementById("orderNumber");   // 수주번호
		var clientCode = document.getElementById("clientCode");   	// 거래처코드

		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		//alert("rowDatas : " + rowDatas + ",  rowDatas length : " + rowDatas.length);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
		var jsonRowDatas2 = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		
		if(rowDatas.length==1){

			outCode.value=rowData.outCode;
			outCode.readOnly=true;
			console.log('outCode: ', rowData.outCode);
			
			orderNumber.value=rowData.orderNumber;
			orderNumber.readOnly=true;

			clientCode.value=rowData.clientCode;
			clientCode.readOnly=true;
			
			/*
			companyCode.value=rowData.companyCode;
			companyCode.readOnly=true;
			
			itemCode.value=rowData.itemCode;
			itemCode.readOnly=true;
			console.log('itemCode: ', rowData.itemCode);
			*/
			
			$.ajax({
				url : contextPath + "/shipout/selectItems",
				method : "post",
				data : jsonRowDatas,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function (result) {
					//alert('Items 조회성공');
					console.dir('result : ' + result);
					gridItem.resetData(result);
				}
			});
			
			$.ajax({
				url : contextPath + "/shipout/selectLots",
				method : "post",
				data : jsonRowDatas2,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function (result) {
					//alert('Lots 조회성공');
					console.dir('result : ' + result);
					gridLot.resetData(result);
				}
			});

        }else{

        	outCode.value="";
        	outCode.readOnly=true;
			 
        	orderNumber.value="";
        	orderNumber.readOnly=false;

        	clientCode.value="";
        	clientCode.readOnly=false;
			
        	/*
        	companyCode.value="";
        	companyCode.readOnly=false;
			
        	itemCode.value="";
        	itemCode.readOnly=false;
        	*/
		}
    });
	
	// 체크박스 해제시 자식 grid 초기화
	grid.on('uncheck', function(ev) {

        gridItem.clear();
		gridLot.clear();
    });
	
	// 1개 row의 수주번호칸 더블클릭시 이벤트 실행
    grid.on('dblclick', function(ev) {
    	console.log("dbclick이벤트")
        if (ev.columnName === 'orderNumber') {
            window.open(contextPath + '/shipout/modalItem', 'childWindow', 'width=500,height=500');
        }
    });
	
	// modal창에서 선택한 데이터 grid에 출력 
    window.addEventListener('message', function(ev) {
        const selectedRow = ev.data;
        const focusedCell = grid.getFocusedCell();
        grid.setValue(focusedCell.rowKey, 'orderNumber', selectedRow.orderNumber);
        grid.setValue(focusedCell.rowKey, 'clientCode', selectedRow.clientCode);
        grid.setValue(focusedCell.rowKey, 'companyCode', selectedRow.companyCode);
        grid.setValue(focusedCell.rowKey, 'itemCode', selectedRow.itemCode);
        grid.setValue(focusedCell.rowKey, 'outQuantity', selectedRow.outQuantity);
    });

	
	var gridItemData = [];
	var gridItem = new tui.Grid({
	      el: document.getElementById('gridItem'),
	      data: gridItemData,
	      scrollX: true,
	      scrollY: true,
	      columns: [
			{header: "출하코드", name: "outCode"},		    // 출하 테이블(so_shipout)
			{header: "수주번호", name: "orderNumber"},    // 수주서상세 테이블(so_order_detail)	 
			{header: "ITEM코드", name: "itemCode"},      // 수주서상세 테이블(so_order_detail)
			{header: "수량", name: "quantity"},          // 수주서상세 테이블(so_order_detail)
			{header: "단가", name: "price"},             // 수주서상세 테이블(so_order_detail)
			{header: "총액", name: "amount"},            // 수주서상세 테이블(so_order_detail)
			{header: "재고단위", name: "itemStockUnit"},  // 수주서상세 테이블(so_order_detail)
			{header: "품명", name: "itemName"},		   // 아이템정보 테이블(ma_item)	
			{header: "품번", name: "itemNo"}			   // 아이템정보 테이블(ma_item)	

	      ]
	});
	
	
	var gridLotData = [];
	var gridLot = new tui.Grid({
	      el: document.getElementById('gridLot'),
	      data: gridLotData,
	      scrollX: true,
	      scrollY: true,
	      columns: [
			{header: "LOT번호", name: "lotNo"},        // 실적등록 테이블(pp_perform)
			{header: "ITEM코드", name: "itemCode"},    // 실적등록 테이블(pp_perform)
			{header: "품명", name: "itemName"},		  // 재고상세 테이블(mt_stock_detail)
			{header: "품번", name: "itemNo"},		      // 재고상세 테이블(mt_stock_detail)
			{header: "규격", name: "itemSpec"},        // 재고상세 테이블(mt_stock_detail)
			{header: "재고수량", name: "quantity"}, // 재고상세 테이블(mt_stock_detail)
			{header: "창고코드", name: "warehouseCode"}, // 재고상세 테이블(mt_stock_detail)
	      ]
	});

	// 행 추가 
	var addRow = document.getElementById("addRow");
	addRow.addEventListener("click", function() {
		var newRowData = {

		};
		grid.appendRow(newRowData);
	});
	
	// 행 삭제
	var deleteRow = document.getElementById("deleteRow");
	deleteRow.addEventListener("click", function() {

		grid.removeCheckedRows(true);
	});
	
	// 등록
	$("#addRowBtn").click(function() {
		let i = confirm('등록하시겠습니까?');
		if(i) {
			addBtn();
		}else {
			return false;
		}
	});
	
	// 등록 함수
	function addBtn() {

		var rowDatas = grid.getCheckedRows();

		var jsonRowDatas = JSON.stringify(rowDatas);
		
		$.ajax({
			url : contextPath + "/shipout/write",
			method : "post",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",
			dataType: "json",
			success : function (result) {
				alert('등록성공');
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	// 삭제
	$("#deleteRowBtn").click(function() {
		let d = confirm('삭제하시겠습니까?');
		if(d) {
			deleteFunction();
		}else {
			return false;
		}
	});
	
	// 삭제함수
	function deleteFunction() {
		
		var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
		//alert("rowKeys : " + rowKeys);
		var jsonRowKeys = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
		//alert("JSON.stringify(rowKeys) : " + jsonRowKeys);
		
		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		//alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);

		grid.removeCheckedRows([jsonRowKeys]);

		$.ajax({
			url : contextPath + "/shipout/deleteShipOut",
			method : "put",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				//alert(result); // result는 반환받은 json형태의 객체 
				alert('삭제성공');
				gridItem.clear();
				gridLot.clear();
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	// 상태 변경
	$("#changeStatus").click(function() {
		let d = confirm('상태를 변경하시겠습니까?');
		if(d) {
			changeStatusFunction();
		}else {
			return false;
		}
	});
	
	// 상태변경 함수
	function changeStatusFunction() {

		var rowDatas = grid.getCheckedRows();
		
		var jsonRowDatas = JSON.stringify(rowDatas);

		$.ajax({
			url : contextPath + "/shipout/statusUpdate",
			method : "put",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",
			dataType: "json",
			success : function (result) {
				alert('상태변경 성공');
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	
	// 데이터 수정
	$("#updateRow").click(function() {
		let d = confirm('수정 하시겠습니까?');
		if(d) {
			updateFunction();
		}else {
			return false;
		}
	});
	
	// 데이터 수정함수
	function updateFunction() {

		var rowDatas = grid.getCheckedRows();
		
		var jsonRowDatas = JSON.stringify(rowDatas);

		$.ajax({
			url : contextPath + "/shipout/updateShipOut",
			method : "patch",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",
			dataType: "json",
			success : function (result) {
				alert('데이터 수정성공');
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	// 조회결과 초기화
	var resetRow = document.getElementById("resetRow");
	resetRow.addEventListener("click", function() {
			grid.clear();
			gridItem.clear();
			gridLot.clear();
	});
	
	// 검색조건 초기화
	var resetBtn = document.getElementById("resetBtn");
	resetBtn.addEventListener("click", function() {
		$("#shipOutSearch")[0].reset();
	});

	</script>
	
</head>
<body>
	<h5>출하등록</h5>
 	<form id="shipOutSearch" > 
		<input type="submit" value="조회" id="searchBtn" class="custom-button">
		<button type="button" id="resetBtn" class="custom-button"><i class="fa fa-power-off"></i>검색조건 초기화</button><br><br>
		
		<label for="outCode">출하코드:</label>
		<input type="text" name="outCode" id="outCode" value="" style="background-color: lightgray;">
		<label for="orderNumber">수주번호:</label>
		<input type="text" name="orderNumber" id="orderNumber" value="" style="background-color: lightgray;">
		<label for="clientCode">거래처코드:</label>
		<input type="text" name="clientCode" id="clientCode" value="" style="background-color: lightgray;">
		
		<label for="outType">출하유형:</label>
		<select name="outType" id="outType">
			<option value="">--</option>
			<option value="기타출고">기타출고</option>
			<option value="반품출고">반품출고</option>
			<option value="생산출고">생산출고</option>
			<option value="판매출고">판매출고</option>
		</select>
		
		<label for="transType">수불타입:</label>
		<select name="transType" id="transType">
			<option value="">--</option>
			<option value="일반">일반</option>
			<option value="사급">사급</option>
			<option value="샘플">샘플</option>
			<option value="불량">불량</option>
		</select>
		
		<label for="outPlanDate"> 출하계획일:
		  <input type="date" name="outPlanDate" id="outPlanDate" max="2030-12-31" min="2020-01-01">
		</label>

		<label for="outManager">출하담당자:</label>
		<input type="text" name="outManager" id="outManager" value=""> <br>
		
		<label for="outStatus">상태:</label>
		<select name="outStatus" id="outStatus">
			<option value="">--</option>
			<option value="등록">등록</option>
			<option value="확정">확정</option>
		</select>

		<label for="memo">비고:</label>
		<input type="text" name="memo" id="memo" value="">
		
		<label for="createDate">등록일:
		  <input type="date" name="createDate" id="createDate" max="2030-12-31" min="2020-01-01"> 
		</label>
		<label for="createUser">등록자:</label>
		<input type="text" name="createUser" id="createUser" value="">
		
		<input type="hidden" name="deleteYesNo" id="deleteYesNo" value="N">
	</form> 
	<br><hr>

	<div id="grid">
		<button type="button" id="addRowBtn"    class="custom-button"><i class="fa fa-save"></i>등록</button>
		<button type="button" id="updateRow"    class="custom-button">수정</button>
		<button type="button" id="deleteRowBtn" class="custom-button"><i class="fa fa-trash"></i>삭제</button>
		<button type="button" id="changeStatus" class="custom-button">상태변경</button>
		<button type="button" id="resetRow"     class="custom-button"><i class="fa fa-power-off"></i>조회결과 초기화</button>
		<button type="button" id="addRow"       class="custom-button">+</button>
		<button type="button" id="deleteRow"    class="custom-button">ㅡ</button>
	</div> <br><hr>
	<div id="gridItem"></div>   <br><hr>
	<div id="gridLot"></div>    <br><hr>

</body>
</html>