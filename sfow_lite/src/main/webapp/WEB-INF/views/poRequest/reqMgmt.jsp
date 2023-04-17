<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 순서주의 -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" /> <!-- date-picker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />jQuery Modal -->
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script> <!-- date-picker -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>include jQuery
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>jQuery Modal -->
<script>
$(document).ready(function() {

	  $('#search').click(function(event) {
	    event.preventDefault(); // submit 폼 제출 방지

	    //검색
	  	var in_number = $('#in_number').val();
	    var in_type = $('#in_type').val();
	    var in_date = $('#in_date').val();
	    var in_trans_type = $('#in_trans_type').val();
	    var client_code= $('#client_code').val();
	    var client_name= $('#client_name').val();
	    var in_free= $('#in_free').val();
	    var memo= $('#memo').val();
 
	    $.ajax({
	      url: '${conPath}/searchPoIn',
	      mehtod: 'get',
	      dataType:'json',
	      data: {
	    	  in_number:in_number,
	    	  in_type:in_type,
	    	  in_date:in_date,
	    	  in_trans_type:in_trans_type,
	    	  client_code:client_code,
	    	  client_name:client_name,
	    	  in_free:in_free,
	    	  memo:memo
	      },
	      success: function(data) {
    	 	console.dir(data);
    	 	grid2.clear();
	    	grid.resetData(data);

	    	  	//checkbox 체크 시 input 태그에 해당 value 출력
	            grid.on('check', function(ev){
	              const rowKey = ev.rowKey;
	              const columnName = ev.columnName;
	              var updatedData = {};
	              const rowData = grid.getRow(rowKey);
	              console.log('Row data: ', rowData);
	              
	              if(grid.getCheckedRows().length==1){
            	  	
	            	var in_number = document.getElementById('in_number');
	        	    var in_type = document.getElementById('in_type');
	        	    var in_date = document.getElementById('in_date');
	        	    var in_trans_type = document.getElementById('in_trans_type');
	        	    var client_code = document.getElementById('client_code');
	        	    var client_name = document.getElementById('client_name');
	        	    var in_free = document.getElementById('in_free');
	        	    var memo = document.getElementById('memo');
	              
	        	    var pi1=rowData.in_number;
	        	    var pi2=rowData.in_type;
	        	    var pi3=rowData.in_date;
	        	    var pi4=rowData.in_trans_type;
	        	    var pi5=rowData.client_code;
	        	    var pi6=rowData.client_name;
	        	    var pi7=rowData.in_free;
	        	    var pi8=rowData.memo;

	        	    in_number.value=pi1;
	        	    in_number.readOnly=true;
	        	    
	        	    in_type.value=pi2;
	        	    in_type.disabled=true;
	        	    in_date.value=pi3;
	        	    in_date.readOnly=true;
	        	    in_trans_type.value=pi4;
	        	    in_trans_type.disabled=true;
	        	    client_code.value=pi5;
	        	    client_code.readOnly=true;
	        	    client_name.value=pi6;
	        	    client_name.readOnly=true;
	        	    in_free.value=pi7;
	        	    in_free.disabled=true;
	        	    memo.value=pi8;
	        	    memo.readOnly=true;
	            	}else{	
	            		var in_number = document.getElementById('in_number');
		        	    var in_type = document.getElementById('in_type');
		        	    var in_date = document.getElementById('in_date');
		        	    var in_trans_type = document.getElementById('in_trans_type');
		        	    var client_code = document.getElementById('client_code');
		        	    var client_name = document.getElementById('client_name');
		        	    var in_free = document.getElementById('in_free');
		        	    var memo = document.getElementById('memo');
		        	    
		        	    in_number.value="";
		        	    in_number.readOnly=false;
		        	    in_type.value="";
		        	    in_type.disabled=false;
		        	    in_date.value="";
		        	    in_date.readOnly=false;
		        	    in_trans_type.value="";
		        	    in_trans_type.disabled=false;
		        	    client_code.value="";
		        	    client_code.readOnly=false;
		        	    client_name.value="";
		        	    client_name.readOnly=false;
		        	    in_free.value="";
		        	    in_free.disabled=false;
		        	    memo.value="";
		        	    memo.readOnly=false;   
		        	    grid2.clear();
	              }
	  				//상세보기
	            	$.ajax({
	            	    url: '${conPath}/reqMgDetail',
	            	    method: 'GET',
	            	    dataType: 'JSON',
	            	    data:{
		            	      in_number:in_number.value	            	    	
	            	         },
	            	    contentType: 'application/json',
	            	    success: function(response) {
	            	    	grid2.resetData(response)
	            	    	//console.log('Success:', response);  
	            	    	
	            	    	//상세보기수정
	            	    	grid2.on('click', function(ev) {
	        		            const rowKey = ev.rowKey;
	        		            const columnName = ev.columnName;
	        		            var updatedData = {};
	        		            const rowData = grid2.getRow(rowKey);
	        		            console.log('Row data: '+ rowData);
	        		            var updateDetailBtn = document.getElementById('updateDetailBtn');
	        		            	updateDetailBtn.addEventListener('click', function() {
			        		            $.ajax({
					    		    	       url: '${conPath}/reqMgDetailUp',
					    		    	       method: 'post',
					    		    	       dataType: 'JSON',
					    		    	       data: JSON.stringify(rowData),
					    		    	       contentType: 'application/json',
					    		    	       success: function(response) {
					    		    	           console.log('수정Success:', response);
					    		    	       },
					    		    	       error: function(error) {
					    		    	           console.log('Error:', error);
					    		               }
					    		            });
	        		            });
	            	    	}); //grid2.on(두번째)

	            	    },
	            	    error: function(error) {
	            	      console.log('Error:', error);
	            	    }
	            	 });
	            });
	         //checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	         //그리드객체명.on('click', (ev) => {
	         grid.on('uncheck',(ev) => {  
	        	 	var in_number = document.getElementById('in_number');
	        	    var in_type = document.getElementById('in_type');
	        	    var in_date = document.getElementById('in_date');
	        	    var in_trans_type = document.getElementById('in_trans_type');
	        	    var client_code = document.getElementById('client_code');
	        	    var client_name = document.getElementById('client_name');
	        	    var in_free = document.getElementById('in_free');
	        	    var memo = document.getElementById('memo');
	        	    
	        	    in_number.value="";
	        	    in_number.readOnly=false;
	        	    in_type.value="";
	        	    in_type.disabled=false;
	        	    in_date.value="";
	        	    in_date.readOnly=false;
	        	    in_trans_type.value="";
	        	    in_trans_type.disabled=false;
	        	    client_code.value="";
	        	    client_code.readOnly=false;
	        	    client_name.value="";
	        	    client_name.readOnly=false;
	        	    in_free.value="";
	        	    in_free.disabled=false;
	        	    memo.value="";
	        	    memo.readOnly=false;    
	        	    grid2.clear();
	            
	         });
	    	   	
	    	  },
	      error: function(xhr, status, error) {
	        console.log(error);
	      }
	    });
	  });
	});
	//입고관리 행 추가
    var plusRowBtn = document.getElementById('plusRowBtn');
	    plusRowBtn.addEventListener('click', function() {
	      var newRowData = {
	    		  in_number: '',
	    		  in_empid: '${sessionScope.AUTHUSER.id}',
	    		  in_type: '',
	    		  in_date: '',
	    		  in_trans_type: '',
	    		  request_number: '',
	    		  client_code: '',
	    		  client_name: '',
	    		  in_regdate: '',
	    		  memo: '',
	    		  in_delyn: ''
	     };
	      grid.appendRow(newRowData);
    });  
	
	//세부항목 행추가
    var plusDeRowBtn = document.getElementById('plusDeRowBtn');
	    plusDeRowBtn.addEventListener('click', function() {
	      var newRowData = {
	    		  in_order: '',
	    		  in_number: document.getElementById('in_number').value.toString(),
	    		  request_order: '',
	    		  item_code: '',
	    		  request_quantity: '',
	    		  in_quantity: '',
	    		  item_name: '',
	    		  item_no: '',
	    		  item_specification: '',
	    		  item_stock_unit: '',
	    		  warehouse_code: '',
	    		  warehouse_name: '',
	    		  price: '',
	    		  amount: '',
	    		  tax_amount: '',
	    		  memo: ''
	     };
      	grid2.appendRow(newRowData);
    });
    
  	//입고관리 행 제거(data존재시 삭제x)
        var minusRowBtn = document.getElementById('minusRowBtn');
        minusRowBtn.addEventListener('click', function() {
        	//console.log(grid.getData()[lastIndex]["in_number"]) 
          var rowCount = grid.getRowCount();
          var lastIndex = rowCount - 1;
          if (rowCount > 0 && !grid.getData()[lastIndex]["in_number"]) {
        	  grid.removeRow(lastIndex);
          } else {
        	  return null;
          }
        });

     //세부항목 행 제거
        var minusDeRowBtn = document.getElementById('minusDeRowBtn');
        minusDeRowBtn.addEventListener('click', function() {
		//console.log(grid2.getData()[lastIndex]["in_order"])        	
          var rowCount = grid2.getRowCount();
          var lastIndex = rowCount - 1;
          if (rowCount > 0 && !grid2.getData()[lastIndex]["in_order"]) {
            grid2.removeRow(lastIndex);
          }  else {
            return null;
          }
        });
	  
	  //등록
	 $("#saveBtn").click(function() {
	      let i = confirm('등록하시겠습니까?');
	      if(i) {
	         saveFunction();
	      }else {
	         return false;
	      }
	   });
	   
	   // 등록 진행
	   function saveFunction() {
	      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      $.ajax({
	         url : "${conPath}/reqMgIn",
	         method : "post",
	         data : jsonRowDatas,
	         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
	         dataType: "json",         // 서버에서 받을 데이터타입
	         success : function (result) {
	         },
	         error: function() {
	              console.log("입력실패");
	          },
	          complete:function(){
	          }
	      });
	   }
	 	 $("#saveDetailBtn").click(function() {
		      let i = confirm('세부항목을 등록하시겠습니까?');
		      if(i) {
		    	  saveDetailFunction();
		      }else {
		         return false;
		      }
		   });
	      //세부항목 입력 saveDetailBtn
	    function saveDetailFunction() {
	      var rowDatas = grid2.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      $.ajax({
	         url : "${conPath}/reqMgDetailIn",
	         method : "post",
	         data : jsonRowDatas,
	         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
	         dataType: "json",         // 서버에서 받을 데이터타입
	         success : function (result) {
	         },
	         error: function() {
	              console.log("입력실패");
	          },
	      });
	   }
    
		//수정  
 		 $("#updateBtn").click(function() {
	      let i = confirm('수정하시겠습니까?');
	      if(i) {
	         updateFunction();
	      }else {
	         return false;
	      }
	   });
	   
	   // 수정
	   function updateFunction() {
	      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      $.ajax({
	         url : "${conPath}/reqMgUp",
	         method : "post",
	         data : jsonRowDatas,
	         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
	         dataType: "json",         // 서버에서 받을 데이터타입
	         success : function (result) {
	         },
	         error: function() {
	              console.log("입력실패");
	          },
	          complete:function(){
	          }
	      });
	   }  
	   
	 
	  
	// 삭제실행
	$("#delPoIn").click(function() {
	   let d = confirm('삭제하시겠습니까?');
	   if(d) {
		   poInDelfunction();
	   }else {
		  return false;
	   }
	});
		
	// 삭제함수
	function poInDelfunction() {
	   var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
	   var jsonRowKeys = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
	   
	   var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	   var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
 
	   grid.removeCheckedRows([jsonRowKeys]);
 
	   $.ajax({
			  url : "${conPath}/reqMgDel",
			  method : "PUT",
			  data : jsonRowDatas,
			  contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			  dataType: "JSON",         // 서버에서 받을 데이터타입
			  success : function (result) {
			  },
			  error: function() {
				   console.log("삭제실패");
			   }
	   });
	}  
	//초기화
	//모든 테이블  초기화하는 부분, 위 아래 두 개 테이블 모두 초기화하고 checked상태에서 초기화할 경우 readOnly랑 disabled false처리
	function poInReset(){
		//처음엔 ajax로 넘어온 데이터를 다 ""로 입력해서 다시 resetData하려했는데 grid자체적으로 clear()함수가 있었음
		 grid.clear();
		 grid2.clear();
		 	in_number.disabled=false;
		    in_type.disabled=false;
		    in_date.disabled=false;
		    in_trans_type.disabled=false;
		    client_code.disabled=false;
		    client_name.disabled=false;
		    in_free.disabled=false;
		    memo.disabled=false; 
	}
	
</script>

<style>
/* modal */
		.form-title{
		width : 100px;
		height: 30px;
		color:black;
		font-weight:bold;
 		background-color: #e2e2e2;
/* 		background-color: #828282; */
		border:1px solid #e2e2e2;
		text-align:center;
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		display:inline-block;
		}
		
		.form-data{
		width : 200px;
		height: 30px;
/* 		background-color: rgb(230, 242, 255) */
/* 		text-align:center; */
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
		
		.btn-open-popup{
		width : 200px;
		height: 30px;
		background-color: rgb(230, 242, 255);
		text-align:left;
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
	
	.modal {
	  position: absolute;
	  top: 0;
	  left: 0;
	
	  width: 100%;
	  height: 100%;
	
	  display: none;
	  background-color: rgba(0, 0, 0, 0.4);
	}
	 
	.modal.show {
	  display: block;
	}
	
	#modalGrid {
	position: relative; /* 변경된 부분 */
/* 	  position: absolute; */
	  top: 50%;
	  left: 50%;
	
	  width: 500px;
	  height: 500px;
	
	  padding: 40px;
	
	  text-align: center;
	
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	  transform: translateX(-50%) translateY(-50%);
	}
	
	.modal-wrapper {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	
	
	

  .search_wh .form-title{
    border-radius:3px;
	line-height : 30px;
  }

  .search_wh input[type="text"] {
    border: none;
    outline: none;
    border-radius:3px;
    border:1px solid #e2e2e2;
    line-height : 30px;
	height: 30px;
  }

  .search_wh .fas.fa-search {
/*     margin-right: 4px; */
  }

  .search_wh input[type="text"]#lens_sh {
    margin-left:-0.5px;

  }

  .search_wh input[type="text"].btn-open-popup {
    padding-left: 30px;
    cursor: text;
    margin-left:-3.5px;
	margin-right:5px;
  }
  
  .search_wh input[type="text"].btn-open-popup:focus {
    outline: none;
  }
  

	
#clientCodeBtn {
        margin: 0;
        padding: 0;
        height: 28px;
	    width: 60px;
	    font-size: 13px;
	    color: black;
	    border: 1px solid #8c8c8c;
	    border-radius: 4px;
	    bottom: 10px;
    }
#applyBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 300px; /* 버튼 위치 조정 */
}
#resetMdBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}
#resetMdBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 210px; /* 버튼 위치 조정 */
}


#closeBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 120px; /* 버튼 위치 조정 */
}

button {
/*   background-color: rgba(60, 80, 135, 1); */
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
}


#clientCodeBtn:hover {
  background-color: rgba(051, 102, 102, 1);
  opacity: 0.8;
}

   
#resetBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}


#applyBtn:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}


#closeBtn:hover {
  background-color: rgba(153, 102, 000, 1);
  opacity: 0.8;

}
 /* 오른쪽정렬 버튼 */
  .btnR{
   float:right;
  }
/* DivTable.com */
  .divTable{
	display: table;
	width: 100%;
    
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
           border: 1px solid #999999;
           display: table-cell;
           padding: 3px 10px;
           text-align: center;
           border: 1px solid #E8EBF0;
           border-radius: 5px;
        }
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group; 
}

/* button */
.custom-button {
    background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
}

#saveBtn:hover, #saveDetailBtn:hover, #search:hover, #updateBtn:hover, #updateDetailBtn:hover{
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}

#delPoIn:hover,  #reset:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}

#plusRowBtn:hover, #plusDeRowBtn:hover, #minusRowBtn:hover, #minusDeRowBtn:hover {
  background-color: rgba(80, 201, 141);
  opacity: 0.8;
}

.doubleBlue{
border: 1px solid;
border-color: hsl(240, 100%, 50%);
}
</style>

<title>Insert title here</title>
</head>

<body>
<h3>구매입고관리</h3>
<div class="grid_btn">
<form id="searchFrm">
    <button type="button" id="search" class="custom-button">
          <i class="fa fa-search"></i> 조회</button>
	<button type="button" id="delPoIn" class="custom-button">
          <i class="fa fa-trash"></i> 삭제</button>
    <input type="reset" id="reset" onclick="poInReset()" class="custom-button" value="초기화">
 
<div class="divTable">
    <div class="divTableBody">

    <div class="divTableRow">
    <div class="divTableCell">입고번호</div>
        <div class="divTableCell">
            <input type="text" name="in_number" id="in_number"/>
        </div>
    <div class="divTableCell">입고유형</div>
        <div class="divTableCell">
            <select name="in_type" id="in_type">
                <option value="">--</option>
                <option value="구매입고">구매입고</option>
                <option value="미입고">미입고</option>
            </select>
        </div>
    <div class="divTableCell">입고일자</div>
        <div class="divTableCell">
            <input type="date" name="in_date" id="in_date"/>
        </div>
    </div>

    <div class="divTableRow">
    <div class="divTableCell">수불타입</div>
        <div class="divTableCell">
            <select name="in_trans_type" id="in_trans_type">
                <option value="">--</option>
                <option value="일반">일반</option>
                <option value="사급">사급</option>
                <option value="샘플">샘플</option>
            </select>
        </div>
        
	<div class="divTableCell">거래처코드</div>
    <div class="divTableCell">
    <span style="position: relative;" class="btnFas">
    <input type="text" class="btn-open-popup" id="client_code" name="client_code" style="background-color: rgb(230, 242, 255);"/>
  	</span>
    </div> 
    
    
    <div class="divTableCell">거래처명</div>
    <div class="divTableCell">
        <input type="text" name="client_name" id="client_name"  value=""/>
    </div>
    </div>

    <div class="divTableRow">
    <div class="divTableCell">무상여부</div>
    <div class="divTableCell">
        <select name="in_free" id="in_free">
            <option value="">--</option>
            <option value="유상">유상</option>
            <option value="무상">무상</option>
        </select>
        </div>
    <div class="divTableCell">비고</div>
    <div class="divTableCell">
        <input type="text" name="memo" id="memo"  value=""/>
        </div>
    </div>
    </div>
    </div>
</form>

<span><button type="button" id="saveBtn" class="custom-button"><i class="fa fa-save"></i>구매입고등록</button> <button type="button" id="updateBtn" class="custom-button">구매입고수정</button></span> <span class="btnR"><button type="button" id="plusRowBtn" class="custom-button"><i class="fa fa-plus"></i></button><button type="button" id="minusRowBtn" class="custom-button"><i class="fa fa-minus"></i></button></span>
<div id="grid"></div>
<span><button type="button" id="saveDetailBtn" class="custom-button"><i class="fa fa-save"></i> 세부항목등록</button> <button type="button" id="updateDetailBtn" class="custom-button">세부항목수정</button></span> <span class="btnR"><button type="button" id="plusDeRowBtn" class="custom-button"><i class="fa fa-plus"></i></button><button type="button" id="minusDeRowBtn" class="custom-button"><i class="fa fa-minus"></i></button></span>
<div id="grid2"></div>
</div>
<script>
//----------------------------------------------

   //구매입고
   var gridData=[];
   var grid = new tui.Grid({
         el: document.getElementById('grid'),
         data: gridData,
         bodyHeight:200,
         scrollX: true, //스크롤 가로 false시 고정
         scrollY: true, //스크롤 세로
         rowHeaders: [{
             type: 'rowNum',
             header: "",
             width: 50
         },'checkbox'],
         columns: [
           {
              header: '구매입고번호',
              sortable: true,
              align:'center',
              width: 150,
              name: 'in_number'
              },
          {
              header: '구매발주번호',
              sortable: true,
              align:'center',
              width: 150,
              className: 'doubleBlue',
              validation: { required: true },
              /* editor:'text',  */
              name: 'request_number'
            },          
           {
             header: '입고담당자',
             sortable: true, // 정렬
             align:'center',
             width: 100,
             name: 'in_empid'
           },
           {
             header: '입고유형',
             sortable: true,
             align:'center',
             validation: { required: true },
             editor: {
            	 type: 'select',
                 	options: { 
                 		listItems: [
	                      {text: '구매입고', value: '구매입고'},
	                      {text: '미입고', value: '미입고'}
                        ]
                    }
         	},
	         width: 100,
             name: 'in_type'
           },
           {
               header: '무상여부',
               sortable: true,
               align:'center',
               validation: { required: true },
               editor: {
              	 type: 'select',
                   	options: { 
                   		listItems: [
  	                      {text: '유상', value: '유상'},
  	                      {text: '무상', value: '무상'}
                          ]
                      }
           	  },
             width: 100,
             name: 'in_free'
           },
           {
             header: '입고일자',
             sortable: true,
             align:'center',
             validation: { required: true },
             editor: 'text',
             width: 150,
             name: 'in_date'
           }, 
           {
             header: '수불타입',
             sortable: true,
             align:'center',
             validation: { required: true },
             editor: {
            	 type: 'select',
                 	options: { 
                 		listItems: [
	                      {text: '일반', value: '일반'},
	                      {text: '사급', value: '사급'},
	                      {text: '샘플', value: '샘플'}
                        ]
                    }
         	},
         	 width: 100,
             name: 'in_trans_type'
           },
         {
             header: '거래처번호',
             hidden:true,
             name: 'no'
           },
         {
             header: '거래처코드',
             sortable: true,
             align:'center',
             width: 150,
             className: 'doubleBlue',
             validation: { required: true },
             name: 'client_code'
           },
         {
             header: '거래처명',
             sortable: true,
             align:'center',
             width: 150,
             name: 'client_name'
           },
         {
             header: '등록수정일',
             sortable: true,
             align:'center',
             width: 150,
             name: 'in_regdate'
           },
         {
             header: '비고',
             sortable: true,
             align:'center',
             editor:'text',
             width: 150,
             name: 'memo'
           },
          {
             header: '삭제여부(N,Y)',
             hidden:true,
             name: 'in_delyn'
           }            
         ]
       });
   
	grid.on('check', function(ev) {
	      console.log('check', ev);
	});

	grid.on('uncheck', function(ev) {
	      console.log('uncheck', ev);
	});
   
   
   //-----------------------------------
   //세부항목(해당 입고관리번호 체크시 출력) 
   var gridData2=[];
   var grid2 = new tui.Grid({
         el: document.getElementById('grid2'),
         data: gridData2,
         bodyHeight:200,
         scrollX: true, //스크롤 가로 false시 고정
         scrollY: true, //스크롤 세로
         rowHeaders: [{
             type: 'rowNum',
             header: "",
             width: 50
         },'checkbox'],
         columns: [
             {
                 header: '구매입고상세번호',
                 hidden:true,
                 name: 'in_order'
                },
            {
               header: '구매입고번호',
               sortable: true,
               align:'center',
               width: 150,
               name: 'in_number'
              },
           {
               header: '발주상세보기번호',
               sortable: true,
               align:'center',
               width: 100,
               className: 'doubleBlue',
               validation: { required: true },
               /* editor:'text', */ 
               name: 'request_order'
              },
            {
              header: 'ITEM코드',
              sortable: true,
              align:'center',
              width: 150,
              name: 'item_code'
              },
          {
              header: '요청수량',
              sortable: true,
              align:'center',
              width: 100,
              name: 'request_quantity'
            },
          {
              header: '입고수량',
              sortable: true,
              align:'center',
              editor:'text',
              width: 100,
              validation: { required: true },
              name: 'in_quantity'
            },
           {
             header: '품명',
             sortable: true,
             align:'center',
             width: 150, 
             name: 'item_name'
           },
           {
             header: '품번',
             sortable: true,
             align:'center',
	         width: 150,
             name: 'item_no'
           },
           {
             header: '규격',
             sortable: true,
             align:'center',
             width: 100,
             name: 'item_specification'
           }, 
           {
             header: '재고단위',
             sortable: true,
             align:'center',
         	 width: 100,
             name: 'item_stock_unit'
           },
           {
             header: '창고코드',
             sortable: true,
             align:'center',
             className: 'doubleBlue',
             validation: { required: true },
             /* editor:'text',  */ 
             width: 150,
             name: 'warehouse_code'
           },
         {
             header: '창고명',
             sortable: true,
             align:'center',
             width: 150,
             name: 'warehouse_name'
           },
         {
             header: '단가',
             sortable: true,
             align:'center',
             width: 100,
             name: 'price'
           },
         {
             header: '공급가액',
             sortable: true,
             align:'center',
             width: 100,
             name: 'amount'
           },
         {
             header: '부가세포함가',
             sortable: true,
             align:'center',
             width: 150,
             name: 'tax_amount'
           },
         {
             header: '비고',
             sortable: true,
             align:'center',
             editor:'text',
             width: 150,
             name: 'memo'
           }
      
         ]
       });
</script>

<script>


	/* modal */
	//modal에 띄워지는 grid3

	  var body = document.querySelector('body');
	  var modal = document.querySelector('.modal');
	  var btnOpenPopup = document.querySelector('.btnFas');

	  //input 
	  var grid3=null;	 //추가된 부분!!
		function resetCheck() {
		  if (grid3) {
		    grid3.uncheckAll();
		  }
		}

		//modal 닫기 함수
		function closeModal() {
			  modal.classList.remove('show');
		         body.style.overflow = 'auto';
			}	

		//modal 안에 grid3의 checkbox 체크된 row데이터 input태그에 찍기
		function applyModal() {
		      if (grid3 && grid3.getCheckedRows().length > 0) {
		    	const checkedRows = grid3.getCheckedRows();
		    	const mclient_code = document.getElementById('client_code');
		    	mclient_code.value = checkedRows[0].mclient_code;
		      }        
		         modal.classList.remove('show');
		         body.style.overflow = 'auto';
			}	

		$(document).ready(function() {
		      $('.btnFas').dblclick(function(event) {
		         event.preventDefault();
		         if(grid3){
		            grid3.destroy();
		         }
		         
		       var gridData3=[];
		         grid3 = new tui.Grid({
		         el: document.getElementById('modalGrid'),
		         data: gridData3,
		         bodyHeight:300,
		         scrollX: false,
		         scrollY: true,
		         autoWidth: true,
		         rowHeaders: [{
		             type: 'rowNum',
		             header: "  ",
		             width: 50
		         },{type : 'checkbox'}],
		         columns: [
		            {
		             header: '거래처코드',
		             name: 'mclient_code',
		             sortable: true,
		             align:'center',
		             width:165
		               },
		           {
		             header: '거래처명',
		             name: 'mclient_name',
		             sortable: true,
		             align:'center',
		             width:165
		           }
		         ]
		       }); //grid3[]
		         
				//검색x리스트
		     $.ajax({
		        type:"get", //요청방식 
		        dataType:"JSON",
		        url: '${conPath}/reqCCMList',
		             success: function(data) {
		              gridData3=data
		                 grid3.resetData(data)
		           },
		        error: function(xhr, status, error) {
		          console.log(error);
		        }
		      }); 
		         //modal 안에 grid 행 checkbox 체크시 row데이터 출력(웹 console에만 출력하는 용도)
		          grid3.on('check', function(ev) {
		           const rowKey = ev.rowKey;
		           const columnName = ev.columnName;
		           var updatedData = {};
		           const rowData = grid3.getRow(rowKey);
		           console.log('Row data: ', rowData);
		           console.dir('Row data: ', rowData);
		          }); 
		         
		          $('#clientCodeBtn').click(function(event) {
		               event.preventDefault(); // prevent form submission
		                  
		               //검색
		               var mclient_code = $('#mclient_code').val();
		           
		            $.ajax({
		                 url : "${conPath}/reqCCM",
		                 type : "GET",
		                 dataType : "JSON",
		                 data:  {
		                	 mclient_code: mclient_code
		                  },
		                 success : function(data) {
		                    console.dir(data);
		                    gridData3=data
		                    grid3.resetData(data);
		                 },
		                 error: function(xhr, status, error) {
				              // handle error
				              console.log(error);
				            }
		            });//ajax
		         });
		       });//double클릭 이벤트 끝
	   
		    });//document.ready끝   

	  //modal 띄우기

	  btnOpenPopup.addEventListener('dblclick', () => {
	    modal.classList.toggle('show');

	    if (modal.classList.contains('show')) {
	    	body.style.overflow = 'hidden';
	    }
	  });
			
	//------------------------------------------------------- 
		    
	//거래처를 더블클릭해서 정보조회하기
    grid.on('dblclick', function(ev) {
        if (ev.columnName === 'client_code') {
            window.open('${conPath}/reqModal', 'childWindow', 'width=500,height=500');
        }
    });
   
   //자식창에서 전달한 값을 컬럼에 넣기
    window.addEventListener('message', function(ev) {
    	const selectedRow = ev.data;
    	if(selectedRow.type == "CLIENT"){
    		//console.log("MDselectedRow="+JSON.stringify(selectedRow));
            const focusedCell=grid.getFocusedCell();
            grid.setValue(focusedCell.rowKey, 'no', selectedRow.mno);
            grid.setValue(focusedCell.rowKey, 'client_code', selectedRow.mclient_code);
            grid.setValue(focusedCell.rowKey, 'client_name', selectedRow.mclient_name); 
    		}
    	});
   
    //------------------------------------------------------------------------------------------
	 //발주번호를 더블클릭해서 정보조회하기
    grid.on('dblclick', function(ev) {
        if (ev.columnName === 'request_number') {
            window.open('${conPath}/reqModalPR', 'childWindow', 'width=500,height=500');
        }
    });
   
   //자식창에서 전달한 값을 컬럼에 넣기
    window.addEventListener('message', function(ev) {
        const selectedRow = ev.data;
        if(selectedRow.type == "REQUEST"){
        	//console.log("PRselectedRow="+JSON.stringify(selectedRow));
            const focusedCell=grid.getFocusedCell();
            grid.setValue(focusedCell.rowKey, 'request_number', selectedRow.mrequest_number);
            grid.setValue(focusedCell.rowKey, 'memo', selectedRow.mmemo);
        }
    });
   //-----------------------------------------------------------------
   //세부항목
       grid2.on('dblclick', function(ev) {
        if (ev.columnName === 'request_order') {
            window.open('${conPath}/reqDetailModal', 'childWindow', 'width=1600,height=500');
        }
    });
   
   //자식창에서 전달한 값을 컬럼에 넣기
    window.addEventListener('message', function(ev) {
        const selectedRow = ev.data;
        if(selectedRow.type == "ModalDetail"){
        	//console.log("modalselectedRow="+JSON.stringify(selectedRow));
            const focusedCell=grid2.getFocusedCell();
            grid2.setValue(focusedCell.rowKey, 'request_order', selectedRow.mrequest_order);
            //console.log("mrequest_order="+selectedRow.mrequest_order);
            grid2.setValue(focusedCell.rowKey, 'item_code', selectedRow.mitem_code);
            grid2.setValue(focusedCell.rowKey, 'request_quantity', selectedRow.mrequest_quantity);
            grid2.setValue(focusedCell.rowKey, 'price', selectedRow.mprice);
            grid2.setValue(focusedCell.rowKey, 'amount', selectedRow.mamount);
            grid2.setValue(focusedCell.rowKey, 'tax_amount', selectedRow.mtax_amount);
            grid2.setValue(focusedCell.rowKey, 'memo', selectedRow.detailmemo);
        }
    });
   
   
   
   
   
   
    //------------------------------------------------------------------------------------------
	 //창고번호를 더블클릭해서 정보조회하기
   grid2.on('dblclick', function(ev) {
       if (ev.columnName === 'warehouse_code') {
           window.open('${conPath}/reqDetailWH', 'childWindow', 'width=500,height=500');
       }
   });
  
  //자식창에서 전달한 값을 컬럼에 넣기
   window.addEventListener('message', function(ev) {
       const selectedRow = ev.data;
       console.log("mainWH"+selectedRow);
       if(selectedRow.type == "WHCODE"){
       	console.log("WHmainselectedRow="+JSON.stringify(selectedRow));
           const focusedCell=grid2.getFocusedCell();
           grid2.setValue(focusedCell.rowKey, 'warehouse_code', selectedRow.mwarehouse_code);
           grid2.setValue(focusedCell.rowKey, 'warehouse_name', selectedRow.mwarehouse_name);
       }
   });

</script>

<div class="modal">
  <!-- modal에 grid 띄우기 -->
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">

      	<div class="divTable">
    		<div class="divTableBody">
    			<div class="divTableRow">
			        <div class="divTableCell">
			            거래처코드<input type="text" name="client_code" id="mclient_code"/><button type="button" id="clientCodeBtn">조회</button>
			        </div>
        		</div>
        	</div>
        </div>
    <!-- reset 버튼 추가 -->
    <button type="button" id="applyBtn" onclick="applyModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\apply.png" width="13px"/>&nbsp;&nbsp;적용
    </button>
    
    <button type="reset" id="resetMdBtn" onclick="resetCheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화
    </button>
    
    <button type="button" id="closeBtn" onclick="closeModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\ex.png" width="11px"/>&nbsp;&nbsp;닫기
    </button>
  </div>
  
</div>
</body>
</html>