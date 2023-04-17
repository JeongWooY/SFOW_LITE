<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>구매관리(필드모드)</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css"/>	
<script>
$(document).ready(window.onload=function() {
	   
	
	//FMpi구매발주조회 이동하기
   var FMpr_move = document.getElementById('FMpr_move');
   FMpr_move.addEventListener('click', function() {
      var confirmMsg = `이동 하시겠습니까?`;
      if(confirm(confirmMsg))
         grid.move();
   });
   
	//FMpi 입고등록이동하기
   var FMpi_move = document.getElementById('FMpi_move');
   FMpi_move.addEventListener('click', function() {
      var confirmMsg = `이동 하시겠습니까?`;
      if(confirm(confirmMsg))
         grid.move();
   });


	//초기화
   var resetRow = document.getElementById('resetRow');
   resetRow.addEventListener('click', function() {
      var confirmMsg = `초기화 하시겠습니까?`;
      if(confirm(confirmMsg))
         grid.clear();
   });
   
   //검색
  $('#search').click(function(event) {
    event.preventDefault(); // prevent form submission
    // get search parameters
  
    var in_number = $('#in_number').val();
    var item_code = $('#item_code').val();
    var in_date = $('#in_date').val();
    var warehouse_code = $('#warehouse_code').val();
    
    // make AJAX call to server
    $.ajax({
      url:'${conPath}/FMpi',
      type:'GET',
      dataType:'JSON',
      contentType: 'application/json',
      data: {
    	  
    	  in_number:in_number,
    	  item_code:item_code,
    	  in_date:in_date,
    	  warehouse_code:warehouse_code
    	  
      },
      success: function(data) {
    
    	  	grid.resetData(data);
    	   	
    	   	grid.on('editingFinish', function(ev) {
            const rowKey = ev.rowKey;
            const columnName = ev.columnName;
            var updatedData = {};
            const rowData = grid.getRow(rowKey);
            console.log('Row data: ', rowData);
	            
         		// 업데이트
	     	   $.ajax({
	    	       url: '${conPath}/updateFMpi',
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
	    	   	});
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });
	  });
	});

</script>

<style>

.right-btn-group{
    /* border: 1px solid red; */
    display: flex;
}
.editer-content{
     /* border: 1px solid red; */
     display: flex;
    padding: 1rem 1rem;
    border-radius: 10px;
    background: #F8F8F8;
    margin-top: 0.5rem;
        }

.right-tap-btn{
    height: 45px;
    font-size: 1.8em;
    text-align: center;
    margin-right: 4px;
    border: 1px solid #D6DAE2;
    border-radius: 5px;
    font-size: 0.875rem;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    height: 2rem;
    padding: 0 0.75rem;
    font-weight: 500;
    color: #636363;
}

.footer_form{
    display: inline;
    width: 95%;
    font-size: 1.2em;
    text-align: center;
    background-color: #F8F8F8!important;
    /* border: none!important; */
    border-width: 1px 0px 0px 0px;
    border-color: #e6e6e6!important;
    border-style: solid;
}

.footer_btn1{
    background: linear-gradient(to right, rgb(19, 78, 94), rgb(113, 178, 128));
    display: inline-block;
 
}
.footer_btn2{
    background: linear-gradient(to right, rgb(229, 57, 53), rgb(227, 93, 91));
    display: inline-block;
 
}

</style>		
</head>
<body>

	<div class="file-title" style="margin: 20px;">
        <div class="right-btn-group">
        <input type="submit" id="search" value="조회">
        <input type="reset" id="resetRow" value="초기화">
  
        <form id=FMpr_move name=FMpr_move  method="GET" action="${conPath}/FMpr">
	        <input type="submit" id="FMpr_move" value="구매발주조회">
	        <input type="submit" id="FMpi_move" value="입고등록">
     	</form>

        </div>
    </div>
    
    <div class="right-content">
        <div class="editer-content">
            <div>
                <div >
                    구매요청번호 검색<input type="text" name="in_number" id="in_number">
                </div>
                <div>
           ITEM코드<input type="text" name="item_code" id="item_code">
                </div>
            </div>
            <div>
                <div>
                    입고일자<input type="text" name="in_date" id="in_date">
                </div>
                <div>
                    창고선택<input type="text" name="warehouse_code" id="warehouse_code">
                </div>
            </div>
        </div>
     </div>
     
	<!-- 그리드 화면 -->
 <div id="grid"></div>
 
 <script>
//그리드
 var gridData=[];
 var grid = new tui.Grid({
     el: document.getElementById('grid'),
     data: gridData,
     scrollX: false,
     scrollY: false,
     rowHeaders: ['checkbox'],
     
  columns: [
    {
      header: '구매요청번호',	//헤더 제목
      name: 'in_number',	//컬럼 이름
      sortable: true,		//정렬 위아래로
      editor: 'text',		//글씨 수정
      align:'center', 	//텍스트 센터
    },
    {
      header: '입고일자',
      name: 'in_date',
      sortable: true,
      editor: 'text',
      align:'center',
    },
    {
      header: 'ITEM코드',
      name: 'item_code',
      sortable: true,
      editor: 'text',
      align:'center',
    },
    {
      header: '품명',
      name: 'item_name',
      sortable: true,
      editor: 'text',
      align:'center',
    },
    {
      header: '품번',
      name: 'item_no',
      sortable: true,
      editor: 'text',
      align:'center',
    },
    {
      header: '규격',
      name: 'item_specification',
      sortable: true,
      editor: 'text',
      align:'center',
	  },
	  {
      header: '재고단위',
      name: 'item_stock_unit',
      sortable: true,
      editor: 'text',
      align:'center',
	  },
	  {
	      header: '창고코드',
	      name: 'warehouse_code',
	      sortable: true,
	      editor: 'text',
	      align:'center',
		  }
	  
  ]
}); //그리기 끝

//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	grid.on('check', function(ev) {
  const rowKey = ev.rowKey;
  const columnName = ev.columnName;
  var updatedData = {};
  const rowData = grid.getRow(rowKey);
  console.log('Row data: ', rowData);
  if(grid.getCheckedRows().length==1){
	var in_number = document.getElementById('in_number');
	var in_date = document.getElementById('in_date');
	var item_code = document.getElementById('item_code');
	var warehouse_code = document.getElementById('warehouse_code');
	
	var test1 =rowData.in_number;
	var test2 =rowData.in_date;
	var test3 =rowData.item_code;
	var test4 =rowData.warehouse_code;
	
	in_number.value=test1;
	in_number.readOnly=true;
	in_number.disabled=true;
	in_number.style.outline='none';
	
	in_date.value=test2;
	in_date.readOnly=true;
	in_date.disabled=true;
	in_date.style.outline='none';
	
	item_code.value=test3;
	item_code.readOnly=true;
	item_code.disabled=true;
	item_code.style.outline='none';
	
	warehouse_code.value=test4;
	warehouse_code.readOnly=true;
	warehouse_code.disabled=true;
	warehouse_code.style.outline='none';

  }else{
		
		var in_number = document.getElementById('in_number');
    	var in_date = document.getElementById('in_date');
    	var item_code = document.getElementById('item_code');
    	var warehouse_code = document.getElementById('warehouse_code');
    
    	in_number.value="";
    	in_number.readOnly=false;
    	in_number.style.removeProperty('outline');
		
    	in_date.value="";
    	in_date.readOnly=false;
    	in_date.style.removeProperty('outline');
		
		item_code.value="";
		item_code.readOnly=false;
		item_code.style.removeProperty('outline');
		
		warehouse_code.value="";
		warehouse_code.readOnly=false;
		warehouse_code.style.removeProperty('outline');
  }
	
	
 });

//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
grid.on('uncheck', (ev) => {
	var in_number = document.getElementById('in_number');
	var in_date = document.getElementById('in_date');
	var item_code = document.getElementById('item_code');
	var warehouse_code = document.getElementById('warehouse_code');

	in_number.value="";
	in_number.readOnly=false;
	in_number.style.removeProperty('outline');
	in_number.disabled=false;
	
	in_date.value="";
	in_date.readOnly=false;
	in_date.style.removeProperty('outline');
	in_date.disabled=false;
	
	item_code.value="";
	item_code.readOnly=false;
	item_code.style.removeProperty('outline');
	item_code.disabled=false;
	
	warehouse_code.value="";
	warehouse_code.readOnly=false;
	warehouse_code.style.removeProperty('outline');
	warehouse_code.disabled=false;

	
});
 </script>
 
  <!-- footer -->
    <div class="footer" style="display: inline">
        <div class="footer_title">작업자
            <div class="footer_form">
                <input type="text" id="footer_form" placeholder="관리자" >
            </div>
            <div class="footer_btn" style="display: inline">
                <button class="footer_btn1">입고등록</button>
                <button class="footer_btn2">취소</button>
            </div>
        </div>
    </div>
</body>
</html>