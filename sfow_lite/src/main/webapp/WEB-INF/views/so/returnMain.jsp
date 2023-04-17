<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/so/returnMain.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>고객반품등록</title>
<script>
var jq = jQuery.noConflict();
var contextPath = '<%= request.getContextPath() %>';

$(document).ready(function() {

/* 	function initDatePicker() {
	    jq("#datepicker").datepicker(datepickerConfig);
	} */
	
	class ClientCodeWithIconRenderer {
	    constructor(props) {
	        const el = document.createElement('div');
	        const icon = document.createElement('i');
	        
	        icon.className = 'fa fa-search';
	        icon.style.marginRight = '5px';
	        
	        el.appendChild(icon);
	        el.appendChild(document.createTextNode(props.value));
	        
	        this.el = el;
	    }
	    
	    getElement() {
	        return this.el;
	    }
	    
	    render(props) {
	        this.el.lastChild.textContent = props.value;
	    }
	}
	
	class StatusRenderer {
	    constructor(props) {
	        const el = document.createElement('span');
	        this.el = el;
	        this.render(props);
	    }

	    getElement() {
	        return this.el;
	    }

	    render(props) {
	        const { value } = props;
	        if (value  === '0') {
	            this.el.textContent = '저장';
	        } else if (value  === '1') {
	            this.el.textContent = '확정';
	        } else {
	            this.el.textContent = '저장';
	        }
	    }
	}
	
	 var grid = new tui.Grid({
	    	el: document.getElementById('grid'),
	        scrollX: true,
	        scrollY: true,
	        bodyHeight:300,
	        rowHeaders: ['rowNum'],
	        checkOnlyOneRow: true,
	        columns: [
	        	{
	    			header: '상태',
	    			name: 'out_status',
	                align: 'center',
	                sortable: true,
	                width: 100, // 적절한 너비 값 설정
	    			editor: false,
	    			renderer: {
	                    type: StatusRenderer
	                }
	    		},
	    		{
	    			header: '반품일자',
	    			name: 'return_date',
	                align: 'center',
	                sortable: true,
	                width: 200, // 적절한 너비 값 설정
	    	          editor: {
	    	        	  type: 'datePicker',
	    	              options: {
	    	                format: 'yyyy-MM-dd'
	    	              }
	    	          }
	    		},
	    		{
	    			header: '입고번호',
	    			name: 'return_number',
	                align: 'center',
	                sortable: true,
	                width: 250,
	    			editor: false
	    		},
	    		{
	    			header: '거래처코드',
	    			name: 'client_code',
	                align: 'center',
	                sortable: true,
	                width: 150,
	    			editor: false,
	    		    renderer: {
	    		        type: ClientCodeWithIconRenderer
	    		    }
	    		},
	    		{
	    			header: '거래처명',
	    			name: 'client_name',
	    			align: 'center',
	    			sortable: true,
	    			width: 200,
	    			editor: false
	    		},		
	    		{
	    			header: '비고',
	    			name: 'memo',
	    			align: 'center',
	    			sortable: true,
	    			editor: 'text'
	    		},
	    		{
	    			header: '회사코드',
	    			name: 'company_code',
	    			align: 'center',
    				hidden: true
	    		}
	    	]
	    	}); //그리드 테이블

	
	//client_code 더블클릭 이벤트
      grid.on('dblclick', function(ev) {
          if (ev.columnName === 'client_code') {
              window.open(contextPath + '/so/returnMainChild', 'childWindow', 'width=500,height=500');
          }
      });
	    	
      window.addEventListener('message', function(ev) {
          const selectedRow = ev.data;
          const focusedCell = grid.getFocusedCell();
          grid.setValue(focusedCell.rowKey, 'client_code', selectedRow.client_code);
          grid.setValue(focusedCell.rowKey, 'client_name', selectedRow.client_name);
      });
	    	
	//전체 데이터 조회	    	
    $.ajax({
        url : "<%=request.getContextPath()%>/so/getReturnAdd",
        method :"POST",
        dataType : "JSON",
        contentType : "application/json; charset=utf-8",
        success : function(returnAdd){
            console.dir(returnAdd);
            grid.resetData(returnAdd);
        },
        error:function(returnAdd){
        	alert('에러');
        }
    
   }); //ajax끝
   
   function loadGridData() {
	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/getReturnAdd",
	        method: "POST",
	        dataType: "JSON",
	        contentType: "application/json; charset=utf-8",
	        success: function(returnAdd) {
	            console.dir(returnAdd);
	            grid.resetData(returnAdd);
	        },
	        error: function(returnAdd) {
	            alert('에러');
	        }
	    }); //ajax끝
	}
   

//행의 컬럼 클릭시 rowKey 받아와서 Detail Select   
   grid.on('focusChange', function(ev) {
	    const rowKey = ev.rowKey;
	    console.log(rowKey);
	    
	    const rowData = grid.getRow(rowKey);
	    console.log(rowData);
	    const return_number = rowData.return_number;
	    console.log(return_number);
	    
	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/getReturnDetail",
	        method: "POST",
	        dataType: "JSON",
	        data: { return_number: return_number },
	        success: function(returnDetail) {
	            // 가져온 데이터를 grid2에 표시합니다.
	            grid2.resetData(returnDetail);
	        },
	        error: function() {
	            alert('에러');
	            console.log(returnDetail);
	        }
	    });
	    
	});
   
   //조회버튼 클릭시 데이트피커 val가져오기
   $('#search').on("click", function(){
       const date = jq('#datepicker').val();
       if(date === ''){
    	   loadGridData();
       } else{
    	   loadDataByDate(date);   
       }
   });
   
   function loadDataByDate(date) {
       $.ajax({
           url: "<%=request.getContextPath()%>/so/getReturnAddByDate",
           method: "GET",
           dataType: "JSON",
           data: { return_date: date },
           success: function(returnAddbyDate){
               console.dir(returnAddbyDate);
               grid.resetData(returnAddbyDate);
           },
           error:function(returnAddbyDate){
               console.log(returnAddbyDate);
        	   alert('에러');
           }
       });
   }
	
   //삭제
	$('#deleteRowBtn').on("click", function() {
    const focusedCell = grid.getFocusedCell();
    if (focusedCell.rowKey === null) {
        alert('삭제할 행을 선택해주세요.');
        return;
    }

    const rowData = grid.getRow(focusedCell.rowKey);
    const return_number = rowData.return_number;

    // AJAX 요청을 사용하여 선택된 행의 return_number 값을 서버에 전달하고 해당 행을 삭제합니다.
    $.ajax({
        url: "<%=request.getContextPath()%>/so/deleteReturnAdd",
        method: "POST",
        data: { return_number: return_number },
        success: function() {
            alert('삭제되었습니다.');
        	//전체 데이터 조회	    
        	loadGridData();
        },
        error: function() {
            alert('삭제 중 오류가 발생했습니다.');
        }
    	});
	});
   
	window.datepickerConfig
   
   //초기화
   $('#reset').on("click", function() {
    // jQuery Date Picker 날짜 초기화
    $('#datepicker').datepicker('setDate', null);
	    $.ajax({
	        url : "<%=request.getContextPath()%>/so/getReturnAdd",
	        method :"POST",
	        dataType : "JSON",
	        contentType : "application/json; charset=utf-8",
	        success : function(returnAdd){
	            console.dir(returnAdd);
	            grid.resetData(returnAdd);
	        },
	        error:function(returnAdd){
	        	alert('에러');
	        }
	   	}); //ajax끝
   
	});

   // 버튼을 클릭하면 테이블에 새로운 열을 추가합니다.
   $('#addRowBtn').on("click", function() {
       grid.appendRow();
   });

	// 저장 버튼 클릭 이벤트
	   $('#saveBtn').on("click", function() {
	       // 확인창을 띄우고 확인 버튼을 누르면 저장 진행
	       if (confirm('저장하겠습니까?')) {
	           saveGridData();
	       }
	   });

   //세이브버튼 이벤트 저장과 업데이트
	function saveGridData() {
	    const modifiedRows = grid.getModifiedRows();
	    const createRows = modifiedRows.createdRows;
	    const updateRows = modifiedRows.updatedRows;
	    
	    // 데이터 확인
	    console.log("createRows:", createRows);
	    console.log("updateRows:", updateRows);
	
	    // 변경된 데이터가 없을 경우 경고창 띄우기
	    if (createRows.length === 0 && updateRows.length === 0) {
	        alert('변경된 데이터가 없습니다.');
	        return;
	    }
	    
	    // client_code와 return_date가 무조건 입력되어야 하는 조건 검사
	    for (const row of createRows.concat(updateRows)) {
	        if (!row.client_code || !row.return_date) {
	            alert('거래처코드와 입고일자는 필수 입력 사항입니다.');
	            return;
	        }
	    }
	    
	    // 새로운 행과 수정된 행을 서버로 전송하기 위한 AJAX 요청
	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/saveReturnAdd",
	        method: "POST",
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify({ "createRows": createRows, "updateRows": updateRows }),
	        success: function() {
	            alert('저장되었습니다.');
	            // 저장 후 그리드 데이터를 다시 불러옵니다.
	            loadGridData();
	        },
	        error: function(xhr, status, errorThrown) {
	            console.log('Error occurred:', status, errorThrown);
	            alert('에러');
	        }

	    });
	}
 
   //반품상태를 확정으로 변경
	$('#conFirmStatusBtn').on("click", function() {
    const focusedCell = grid.getFocusedCell();
    if (focusedCell.rowKey === null) {
        alert('변경할 행을 선택해주세요.');
        return;
    }

    const rowData = grid.getRow(focusedCell.rowKey);
    const return_number = rowData.return_number;

    // AJAX 요청을 사용하여 선택된 행의 return_number 값을 서버에 전달하고 해당 행을 변경합니다.
    $.ajax({
        url: "<%=request.getContextPath()%>/so/conFirmStatus",
        method: "POST",
        data: { return_number: return_number },
        success: function() {
            alert('확정되었습니다.');
        	//전체 데이터 조회	    
        	loadGridData();
        },
        error: function() {
            alert('변경 중 오류가 발생했습니다.');
        }
    	});
	});
   
   //반품상태를 저장으로 변경
	$('#cancelStatusBtn').on("click", function() {
    const focusedCell = grid.getFocusedCell();
    if (focusedCell.rowKey === null) {
        alert('변경할 행을 선택해주세요.');
        return;
    }

    const rowData = grid.getRow(focusedCell.rowKey);
    const return_number = rowData.return_number;

    // AJAX 요청을 사용하여 선택된 행의 return_number 값을 서버에 전달하고 해당 행을 변경합니다.
    $.ajax({
        url: "<%=request.getContextPath()%>/so/cancelStatus",
        method: "POST",
        data: { return_number: return_number },
        success: function() {
            alert('확정이 취소되었습니다.');
        	//전체 데이터 조회	    
        	loadGridData();
        },
        error: function() {
            alert('변경 중 오류가 발생했습니다.');
        }
    	});
	});
   
	
	//반품일자 jQuery 데이트피커
	jq("#datepicker").datepicker(window.datepickerConfig);
	
	
	
	//grid2 테이블 관련 설정
	 var grid2 = new tui.Grid({
    	el: document.getElementById('grid2'),
        scrollX: false,
        scrollY: false,
        data:[],
        rowHeaders: ['rowNum','checkbox' ],
        checkOnlyOneRow: true,
        columns: [
            { header : 'sorder', name: 'sorder', hidden: true},
            { header : '입고일자', name: 'receive_date', sortable: true, align: 'center', width:150,
            	editor: {
	        	  type: 'datePicker',
	              options: {
	                format: 'yyyy-MM-dd'
	              }}},
            { header : '아이템코드', name: 'item_code', align: 'center', sortable: true, width:250, editor: false, 	    		    renderer: {
		        type: ClientCodeWithIconRenderer
		    }},
            { header : '품번', name: 'item_no', align: 'center', sortable: true, width:150, editor: false},
            { header : '품명', name: 'item_name', align: 'center', sortable: true, width:200,editor: false},
            { header : '품목유형', name: 'item_type', align: 'center', sortable: true, width:100, editor: false},
            { header : '재고단위', name: 'item_stock_unit', align: 'center', sortable: true, width:80, editor: false},
            { header : '수량', name: 'item_quantity', align: 'center', sortable: true, width:80, editor: 'text'},
            { header : 'LOT번호', name: 'lot_number', align: 'center', sortable: true, width:100 ,editor: 'text'},
            { header : '비고', name: 'memo', align: 'center', sortable: true, editor: 'text'}
    	]
    	}); //그리드 테이블
    	
   // grid2 행추가. 행을 추가하며 추가된 행의 company_code 컬럼에 세션에서 받아온 데이터 넣음
   $('#addRowBtn2').on("click", function() {
	    // 현재 선택된 행의 데이터를 가져옵니다.
	   	const focusedRowData = grid.getRow(grid.getFocusedCell().rowKey);
	    if (focusedRowData === null || focusedRowData === undefined) {
	        alert("반품정보를 먼저 선택해주세요");
	        return;
	    }
	    
	    const return_number = focusedRowData.return_number;
	   	console.log(return_number);
	   	grid2.appendRow({ return_number: return_number});
   });
    	
	// grid2 저장
	$('#saveBtn2').on("click", function() {
       // 확인창을 띄우고 확인 버튼을 누르면 저장 진행
       if (confirm('저장하겠습니까?')) {
           saveGrid2Data();
       }
	 });

	//세이브버튼 이벤트 저장과 업데이트
	function saveGrid2Data() {
    const allRows = grid2.getData(); // 그리드의 모든 로우 데이터를 가져옵니다.
    const modifiedRows2 = grid2.getModifiedRows();
    const createRows2 = modifiedRows2.createdRows;
    const updateRows2 = modifiedRows2.updatedRows;
    
    // 선택된 행이 없으면 알림창을 띄웁니다.
    const focusedRowData2 = grid.getRow(grid.getFocusedCell().rowKey);
    if (focusedRowData2 === null || focusedRowData2 === undefined) {
        alert("반품정보를 먼저 선택해주세요");
        return;
    }
    
 // 아무 데이터도 입력하지 않거나 수정하지 않았을 경우 알림창을 띄우기
    if (createRows2.length === 0 && updateRows2.length === 0) {
        alert('입력하거나 수정한 데이터가 없습니다.');
        return;
    }
    
    // 데이터 확인
    console.log("createRows2:", createRows2);
    console.log("updateRows2:", updateRows2);
    
    // 새로운 행과 수정된 행을 서버로 전송하기 위한 AJAX 요청
    $.ajax({
        url: "<%=request.getContextPath()%>/so/saveReturnDetail",
        method: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({ "createRows2": createRows2, "updateRows2": updateRows2 }),
        success: function() {
            alert('저장되었습니다.');
            // 저장 후 그리드 데이터를 다시 불러옵니다.
            
            grid2.restore();
            
            const focusedCell = grid.getFocusedCell();
            const focusedRowKey = focusedCell.rowKey;
            const focusedRowData = grid.getRow(focusedRowKey);
            const return_number = focusedRowData.return_number;
            console.log(return_number);
            
    	    $.ajax({
    	        url: "<%=request.getContextPath()%>/so/getReturnDetail",
    	        method: "POST",
    	        dataType: "JSON",
    	        data: { return_number: return_number },
    	        success: function(returnDetail) {
    	            // 가져온 데이터를 grid2에 표시합니다.
    	            grid2.resetData(returnDetail);
    	        },
    	        error: function() {
    	            alert('에러');
    	            console.log(returnDetail);
    	        }
    	    });
        },
        error: function(xhr, status, errorThrown) {
            console.log('Error occurred:', status, errorThrown);
            
            // 에러 메시지 초기화
            let errorMessage = '';

            // item_code, item_quantity, receive_date 값이 없는 경우 에러 메시지 설정
            if (createRows2.some(function(row) { return !row.item_code; })) {
                errorMessage += '아이템코드를 입력해주세요.\n';
            }
            if (createRows2.some(function(row) { return !row.item_quantity; })) {
                errorMessage += '수량을 입력해주세요.\n';
            }
            if (createRows2.some(function(row) { return !row.receive_date; })) {
                errorMessage += '입고일자를 입력해주세요.\n';
            }

            // 에러 메시지가 있으면 알림창 띄우기
            if (errorMessage) {
                alert('에러: 다음 사항을 확인해주세요.\n\n' + errorMessage);
            } else {
                alert('알 수 없는 에러가 발생했습니다.');
            }
        }
    });
}
	  
	//체크박스 선택된 항목들 삭제
	$('#deleteRowBtn2').on("click", function() {
    	const checkedRows = grid2.getCheckedRows();
    	if (checkedRows.length === 0) {
   	        alert('삭제할 행을 선택하여 주세요');
   	        return;
   	    }
    	
        const sorder = checkedRows.map(function(row) {
            return row.sorder;
        });
        console.log(sorder);
        

	    if (confirm('선택한 행을 삭제하시겠습니까?')) {
	        $.ajax({
	            url: "<%=request.getContextPath()%>/so/deleteReturnDetail",
	            method: "POST",
	            dataType: "json",
	            data: JSON.stringify(sorder),
	            contentType: "application/json; charset=utf-8",
	            success: function(response) {
	                if (response.success) {
	                    // 성공적으로 삭제되면, 선택된 행을 그리드에서 제거합니다.
	                    const checkedRowKeys = grid2.getCheckedRowKeys();
	                    
	                    // forEach를 사용하여 선택한 행을 순회하며 삭제
	                    checkedRowKeys.forEach(function(rowKey) {
	                        grid2.removeRow(rowKey, {
	                            removeOriginalData: true
	                        });
	                    });
	                    alert("삭제성공");
	                    
	                    // 체크박스 선택을 초기화합니다.
	                    grid2.uncheckAll();
	                } else {
	                    alert('삭제 중 오류가 발생했습니다.');
	                }
	            },
	            error: function() {
	                alert('삭제 요청 중 에러가 발생했습니다.');
	            }
	        });
	    }
	});
	
	//아이템코드를 더블클릭해서 품번, 품명, 품목유형, 재고단위 조회하기
    grid2.on('dblclick', function(ev) {
        if (ev.columnName === 'item_code') {
            window.open(contextPath + '/so/returnDetailChild', 'childWindow', 'width=900,height=700');
        }
    });
	
	//자식창에서 전달한 값을 컬럼에 넣기
    window.addEventListener('message', function(ev) {
        const selectedRow = ev.data;
        const focusedCell = grid2.getFocusedCell();
        grid2.setValue(focusedCell.rowKey, 'item_code', selectedRow.item_code);
        grid2.setValue(focusedCell.rowKey, 'item_no', selectedRow.item_no);
        grid2.setValue(focusedCell.rowKey, 'item_name', selectedRow.item_name);
        grid2.setValue(focusedCell.rowKey, 'item_type', selectedRow.item_type);
        grid2.setValue(focusedCell.rowKey, 'item_stock_unit', selectedRow.item_stock_unit); 
    });
    	
}); //jQuery ready 끝

</script>
</head>
<body>
	<h4>반품관리</h4>
	<div class="grid_btn">
       	<button type="button" id="search" class="custom-button">
       	<i class="fa fa-search"></i> 조회</button>
       	<button type="button" id="saveBtn" class="custom-button">
       	<i class="fa fa-save"></i> 저장</button>
       	<button type="button" id="deleteRowBtn" class="custom-button">
       	<i class="fa fa-trash"></i> 삭제</button>
       	<button type="button" id="reset" class="custom-button">
       	<i class="fa fa-power-off"></i> 초기화</button>
       	<button type="button" id="addRowBtn" class="custom-button">
       	<i class="fa fa-plus"></i> 반품정보 추가</button>
		<button type="button" id="conFirmStatusBtn" class="custom-button">
       	<i class="fa fa-check"></i> 반품상태 확정</button>
       	<button type="button" id="cancelStatusBtn" class="custom-button">
       	<i class="fa fa-ban"></i> 반품상태 취소</button>
	</div>

	<p>반품일자 :
	<input type="text" id="datepicker" readonly="readonly" >
	<hr/>
	<!-- 그리드 삽입장소 -->
    <div id="grid"></div>
	<hr/>
	<h4>세부항목</h4>
	<div class="grid2_btn">
   	<button type="button" id="saveBtn2" class="custom-button">
   	<i class="fa fa-save"></i> 저장</button>
   	<button type="button" id="deleteRowBtn2" class="custom-button">
  	<i class="fa fa-trash"></i> 삭제</button>
   	<button type="button" id="addRowBtn2" class="custom-button">
  	<i class="fa fa-plus"></i> 세부항목 추가</button>

	<hr/>
	</div>
	<div id="grid2"></div>
	</body>
</html>