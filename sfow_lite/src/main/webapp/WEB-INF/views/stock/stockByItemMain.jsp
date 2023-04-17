<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목별 재고현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>
<script>
	var gridData=[];
	var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      //virtualScroll: true,
	      data: gridData,
	      scrollX: true,
	      scrollY: true,
	      width: 'auto',
	      //width: 990, 
	      //bodyHeight: 500,
	      //rowHeight: 44,
	      rowHeaders: [{
              type: 'rowNum',
              header: "  ",
			 //width: 40, 
          },{type : 'checkbox'} ],
	      columns: [
    	  	{	
    	  	  header: '품목구분',
   	          sortable: true,
   	          editor: false, 
   	          align:'center', 
   	       	  //width: 150,
	   	      filter: {
	               type: 'text',
	               showApplyBtn: true,
	               showClearBtn: true
	           },
   	          name: 'item_category'
   	          /* ,
   	          editor: {
   	                 	type: 'select',
   	                 	options: {
   	                    listItems: [
   	                         {text: "제품", value: "제품"},
   	                         {text: "반제품", value: "반제품"},
   	                         {text: "원자재", value: "원자재"},
   	                         {text: "상품", value: "상품"},
   	                         {text: "기타", value: "기타"},
   	                         {text: "설비", value: "설비"},
   	                         {text: "설비예비부품", value: "설비예비부품"},
   	                         {text: "금형", value: "금형"},
   	                         {text: "금형예비부품", value: "금형예비부품"},
   	                         {text: "치공구", value: "치공구"},
   	                         {text: "검사장비", value: "검사장비"},
   	                     			]
   	                 			  } 
   	         	}*/
    	  	},
	        {
	          header: 'ITEM코드',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'item_code'
	        },
	        {
	          header: '품명',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'item_name'
	        },
	        {
	          header: '품목코드',
	          sortable: true,
	          editor: false,
	          //width: 'auto',
	          //width: 150,
	          align:'center',
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'item_no'
	        },
	        {
	          header: '규격',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'item_specification'
	        },
	        {
	          header: '재고단위',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'item_stock_unit'
	        },
     	   {
	          header: '양품수량',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'pass_quantity'
	        },
	        {
	          header: '불량수량',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'fail_quantity'
	        },
	        {
	          header: '재고수량',
	          sortable: true,
	          editor: false,
	          align:'center',
	          //width: 150,
	          filter: {
                  type: 'text',
                  showApplyBtn: true,
                  showClearBtn: true
              },
	          name: 'quantity'
	        },
	      ]
	    });
	
	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	grid.on('check', function(ev) {
        const rowKey = ev.rowKey;
        const columnName = ev.columnName;
        var updatedData = {};
        const rowData = grid.getRow(rowKey);
        console.log('Row data: ', rowData);
        if(grid.getCheckedRows().length==1){
      	var item_category = document.getElementById('item_category');
   		var item_code = document.getElementById('item_code');
   		var item_name = document.getElementById('item_name');
  		var item_no = document.getElementById('item_no');
    	var test1 =rowData.item_category;
    	var test2 =rowData.item_code;
    	var test3 =rowData.item_name;
    	var test4 =rowData.item_no;

    	item_category.value=test1;
    	item_category.disabled=true;
    	
    	item_code.value=test2;
    	item_code.readOnly=true;
    	item_code.style.outline='none';
    	
    	item_name.value=test3;
    	item_name.readOnly=true;
    	item_name.style.outline='none';
	
    	item_no.value=test4;
    	item_no.readOnly=true;
    	item_no.style.outline='none';
        }else{
        	
        	var item_category = document.getElementById('item_category');
       		var item_code = document.getElementById('item_code');
       		var item_name = document.getElementById('item_name');
      		var item_no = document.getElementById('item_no');	
        	
      		item_category.value="";
        	item_category.disabled=false;
        	
        	item_code.value="";
    		item_code.readOnly=false;
    		item_code.style.removeProperty('outline');
        	
    		item_name.value="";
    		item_name.readOnly=false;
    		item_name.style.removeProperty('outline');
    	
        	item_no.value="";
        	item_no.readOnly=false;
        	item_no.style.removeProperty('outline');
        	
        	}
        
		});
	
	
	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	grid.on('uncheck', (ev) => {
		var item_category = document.getElementById('item_category');
   		var item_code = document.getElementById('item_code');
   		var item_name = document.getElementById('item_name');
  		var item_no = document.getElementById('item_no');
	
	
  		item_category.value="";
    	item_category.disabled=false;
    	
    	item_code.value="";
		item_code.readOnly=false;
		item_code.style.removeProperty('outline');
    	
		item_name.value="";
		item_name.readOnly=false;
		item_name.style.removeProperty('outline');
	
    	item_no.value="";
    	item_no.readOnly=false;
    	item_no.style.removeProperty('outline');
	
	
	});
	
	
	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
	function reset(){
    		grid.uncheckAll() ;
    		var item_category = document.getElementById('item_category');
       		var item_code = document.getElementById('item_code');
       		var item_name = document.getElementById('item_name');
      		var item_no = document.getElementById('item_no');

      		item_category.value="";
        	item_category.disabled=false;
        	
        	item_code.value="";
    		item_code.readOnly=false;
    		item_code.style.removeProperty('outline');
        	
    		item_name.value="";
    		item_name.readOnly=false;
    		item_name.style.removeProperty('outline');
    	
        	item_no.value="";
        	item_no.readOnly=false;
        	item_no.style.removeProperty('outline');
    	
	    		
	    	};
	
	
	
	// 그리드 검색
	$.ajax({
		type : "GET",
		dataType : "JSON",
		url : "${conPath}/stockByItem/search",
		success : function(data){
    	 	gridData=data
    	  	grid.resetData(data)
    	  	

	 
    	   	// 그리드 수정
/*     	   	grid.on('editingFinish', function(ev) {
            const rowKey = ev.rowKey;
            const columnName = ev.columnName;
            var updatedData = {};
            const rowData = grid.getRow(rowKey);
            console.log('Row data: ', rowData);
            
            $.ajax({
                 url: "${conPath}/stockByItem/update",
                 method: 'PUT',
                 dataType: 'JSON',
                 data: JSON.stringify(rowData),
                 contentType: 'application/json',
                 success: function(response) {
                    console.log('Success:', response);
                 },
                 error: function(error) {
                     console.log('Error:', error);
                 	}
    	   		});
            
    	   	}); */
    	  },
  
	error: function(xhr, status, error) {
        // handle error
        console.log(error);
      }
    });
	

//조회 input 누르면
function search() {
	 var item_category = $('#item_category').val();
	    var item_code = $('#item_code').val();
	    var item_name = $('#item_name').val();
	    var item_no = $('#item_no').val();
	
	// 검색한 결과를 서버로 전송
	$.ajax({
		type: "POST",
		dataType: "JSON",
		url: "${conPath}/stockByItem/searchKeyword",
		data: {
			item_category: item_category,
			item_code: item_code,
			item_name: item_name,
			item_no: item_no
		},
		
		success: function(data) {
			 gridData=data
	         grid.resetData(data)
	            
	        // 그리드 수정
/*     	   	grid.on('editingFinish', function(ev) {
            const rowKey = ev.rowKey;
            const columnName = ev.columnName;
            var updatedData = {};
            const rowData = grid.getRow(rowKey);
            console.log('Row data: ', rowData);
            
            $.ajax({
                 url: "${conPath}/stockByItem/update",
                 method: 'PUT',
                 dataType: 'JSON',
                 data: JSON.stringify(rowData),
                 contentType: 'application/json',
                 success: function(response) {
                    console.log('Success:', response);
                 },
                 error: function(error) {
                     console.log('Error:', error);
                 }
    	   	});
	}); */
},

error: function(xhr, status, error) {
    // handle error
    console.log(error);
  }
});

};

//초기화 버튼 더블 클릭시에 그리드 데이터 클리어
$(document).ready(function() {
 $('#resetBtn').dblclick(function(event) {
	  event.preventDefault();
	  grid.clear();
 	});
 });

</script>



<style>
		.form-title{
		width : 100px;
		height: 30px;
		color:black;
		font-weight:bold;
 		background-color: #e2e2e2;
		border:1px solid #e2e2e2;
		text-align:center;
		line-height : 30px;
		border-radius:3px;
		display:inline-block;
		}
		
		.form-data{
		width : 200px;
		height: 30px;
		background-color: rgb(230, 242, 255);
		text-align:center;
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
	button {
/*   background-color: rgba(60, 80, 135, 1); */
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
}

	#searchBtn:hover {
  background-color: rgba(051, 102, 102, 1);
  opacity: 0.8;
}

	
#resetBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}
	
</style>


<body>




<form id=stockSearch name=stockSearch>
		&nbsp;<button type="button" id="searchBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" onclick="search()"><img src="<%=request.getContextPath()%>/resources\img\stock\lens_h.png" width="11px"/>&nbsp;&nbsp;조회</button>
		&nbsp;<button type="reset" id="resetBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\reset_h.png" width="11px"/>&nbsp;&nbsp;초기화</button>

<br/><br/>
<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목구분" disabled/><select class="form-data" id="item_category" name="item_category">
  		  <option value=""				<c:if test="${item_category == ''}">selected</c:if>>--</option>
	      <option value="제품" 			<c:if test="${item_category == '제품'}">selected</c:if>>제품</option>
	      <option value="반제품" 			<c:if test="${item_category == '반제품'}">selected</c:if>>반제품</option>
	      <option value="원자재" 			<c:if test="${item_category == '원자재'}">selected</c:if>>원자재</option>
	      <option value="상품" 			<c:if test="${item_category == '상품'}">selected</c:if>>상품</option>
	      <option value="기타" 			<c:if test="${item_category == '기타'}">selected</c:if>>기타</option>
	      <option value="설비" 			<c:if test="${item_category == '설비'}">selected</c:if>>설비</option>
	      <option value="설비예비부품" 		<c:if test="${item_category == '설비예비부품'}">selected</c:if>>설비예비부품</option>
	      <option value="금형" 			<c:if test="${item_category == '금형'}">selected</c:if>>금형</option>
	      <option value="금형예비부품" 		<c:if test="${item_category == '금형예비부품'}">selected</c:if>>금형예비부품</option>
	      <option value="치공구" 			<c:if test="${item_category == '치공구'}">selected</c:if>>치공구</option>
	      <option value="검사장비" 		<c:if test="${item_category == '검사장비'}">selected</c:if>>검사장비</option>
</select></div>

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="ITEM코드" disabled/><input type="text" class="form-data" id ="item_code" name="item_code"/></div>

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품명" disabled/><input type="text" class="form-data" id ="item_name" name="item_name"/></div>

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목코드" disabled/><input type="text" class="form-data" id ="item_no" name="item_no"/></div>

</form>
	<br/>
	<hr/>
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;품목별 재고현황</h6>
	
<div id="grid"></div>


</body>
</html>