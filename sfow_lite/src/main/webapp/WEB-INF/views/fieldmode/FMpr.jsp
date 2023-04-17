<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>구매요청(필드모드)</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css"/>
<script>
$(document).ready(window.onload=function() {
	   
	
/* 		//FMpr 구매발주조회 이동하기
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
	   }); */

//------------------------------------------------------------------------------//	
		
		//초기화
	   var resetRow = document.getElementById('resetRow');
	   resetRow.addEventListener('click', function() {
	      var confirmMsg = `초기화 하시겠습니까?`;
	      if(confirm(confirmMsg))
	         grid.clear();
	   });
	   
//------------------------------------------------------------------------------//
	   
	   //검색
	  $('#search').click(function(event) {
	    event.preventDefault(); // prevent form submission
	    // get search parameters
	  
	    var item_type = $('#item_type').val();
	    var client_name = $('#client_name').val();
	    var item_code = $('#item_code').val();
	    
	    
	    // make AJAX call to server
	    $.ajax({
	      url:'${conPath}/FMpr',
	      type:'GET',
	      dataType:'JSON',
	      contentType: 'application/json',
	      data: {
	    	  
	    	  item_type:item_type,
	    	  client_name:client_name,
	    	  item_code:item_code
	    	  
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
	    	       url: '${conPath}/updateFMpr',
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
//------------------------------------------------------------------------------//

//그리드 추가 버튼
var addRowBtn = document.getElementById('addRow-Btn');
addRowBtn.addEventListener('click', function() {
var newRowData = {
		request_order: '',
		item_type: '',
		client_name: '',
		item_code: '',
		item_name: '',
		item_no: '',
		item_specification: '',
		item_stock_unit: '',
		request_quantity: '',
		buy_price: '',
		amount: ''
		

 };
  grid.appendRow(newRowData);
});    

//------------------------------------------------------------------------------//

//그리드 행 제거
var delRowBtn = document.getElementById('delRow-Btn');
delRowBtn.addEventListener('click', function() {
     var lastIndex = grid.getRowCount()-1;
     grid.removeRow(lastIndex);
   });	

//------------------------------------------------------------------------------//

//등록
$("#insertRowBtn").click(function() {      //버튼네임등록
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
     alert("rowDatas : " + rowDatas);
     var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
     alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
     $.ajax({
        url : "${conPath}/insertFMpr",
        method : "post",
        data : jsonRowDatas,
        contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
        dataType: "json",         // 서버에서 받을 데이터타입
        success : function (result) {
           //alert(result); // result는 반환받은 json형태의 객체 
        },
        error: function() {
             console.log("입력실패");
         },
         complete:function(){
         }
         
     });
     
  }   
  
//------------------------------------------------------------------------------//

//행 삭제
  function deleteRow() {

     var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
     alert(rowKeys);
     var test = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
     alert(test);
     
     var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
     alert(rowDatas);
     var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
     alert(jsonRowDatas);
     
     grid.removeCheckedRows([test]);      // 그리드 인덱스 제거용 (한 줄 제거용)

     $.ajax({
        url : "${conPath}/deleteFMpr",
        method : "POST",
        data : JSON.stringify(rowDatas),
        contentType : "application/json; charset=UTF-8",
        dataType: "JSON",
        success : function (dd) {
           alert(dd);
           alert('성공');  // result를 배열로 받는다
        },
        error: function() {
             console.log("실패");
         }
     });
  }	
	
</script>		




<style>


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

	<div class="file-title" style="margin: 10px;">
        <div class="right-btn-group">
	        <input type="submit" id="search" value="조회" style="background-color: #4e73df; color: white;">
	  		<button type="button" id="insertRowBtn" style="background-color: #4e73df; color: white;">등록</button>
		    <button  type="button" id="delRowBtn" onclick="deleteRow()" style="background-color: #e03221; color: white;">삭제</button>
	        <input type="reset" id="resetRow" value="초기화" style="background-color: #e03221; color: white;">
	    	<button id="addRow-Btn">+</button>
			<button id="delRow-Btn">-</button>
        </div>
    </div>
    
	<%-- <div class="file-title" style="margin: 20px;">
        <div class="right-btn-group">
        <input type="submit" id="search" value="조회">
        <input type="reset" id="resetRow" value="초기화">
  
        <form id=FMpr_move name=FMpr_move  method="GET" action="${conPath}/FMpr">
	        <input type="submit" id="FMpr_move" value="구매발주조회">
	        <input type="submit" id="FMpi_move" value="입고등록">
     	</form>

        </div>
    </div> --%>
    
    <div class="right-content">
        <div class="editer-content">
            <div>
          			품목유형
     			<select id="item_type" name="item_type">
                   <option value="">--선택--</option>
                   <option value="제 품">제 품</option>
                   <option value="반제품">반제품</option>
                   <option value="원자재">원자재</option>
                   <option value="부자재">부자재</option>
                   <option value="상품">상품</option>
                   <option value="기타">기타</option>
                   <option value="설비">설비</option>
                   <option value="설비예비부품">설비예비부품</option>
                   <option value="금형">금형</option>
                   <option value="금형예비부품">금형예비부품</option>
                   <option value="치공구">치공구</option>
                   <option value="검사장비">검사장비</option>
                   <option value="소재">소재</option>
                   <option value="예비부품">예비부품</option>
                   <option value="소모품">소모품</option>
                   <option value="완제품">완제품</option>
                   <option value="국내품">국내품</option>
                   <option value="수출품">수출품</option>
                 </select>

            </div>
            <div>
               		 거래처검색<input type="text" name="client_name" id="client_name">
            </div>
            <div>
                	item코드<input type="text" name="item_code" id="item_code">
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
   	        header: '번호',	//헤더 제목
   	        name: 'request_order',	//컬럼 이름
   	        sortable: true,		//정렬 위아래로
   	        editor: 'text',		//글씨 수정
   	        align:'center', 	//텍스트 센터
   	      },
	      {
	        header: '품목유형',	//헤더 제목
	        name: 'item_type',	//컬럼 이름
	        sortable: true,		//정렬 위아래로
	        editor: 'text',		//글씨 수정
	        align:'center', 	//텍스트 센터
	      },
	      {
	        header: '거래처명',
	        name: 'client_name',
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
	        header: '수량',
	        name: 'request_quantity',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	        
		  },
		  {
	        header: '단가',
	        name: 'buy_price',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	        
		  },
		  {
	        header: '공급가액',
	        name: 'amount',
	        sortable: true,
	        editor: 'text',
	        align:'center',
		        
		  }
	    ]
	  });//그리기 끝
	   
	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	   	grid.on('check', function(ev) {
          const rowKey = ev.rowKey;
          const columnName = ev.columnName;
          var updatedData = {};
          const rowData = grid.getRow(rowKey);
          console.log('Row data: ', rowData);
          if(grid.getCheckedRows().length==1){
	    	var client_name = document.getElementById('client_name');
	    	var item_code = document.getElementById('item_code');
	    	
	    	var test1 =rowData.client_name;
	    	var test2 =rowData.item_code;
	    	
	    	client_name.value=test1;
	    	client_name.readOnly=true;
	    	client_name.disabled=true;
	    	client_name.style.outline='none';
	    	
	    	item_code.value=test2;
	    	item_code.readOnly=true;
	    	item_code.disabled=true;
	    	item_code.style.outline='none';
	
          }else{
	    		
	    		var client_name = document.getElementById('client_name');
		    	var item_code = document.getElementById('item_code');
		    
	    		client_name.value="";
	    		client_name.readOnly=false;
	    	
	    		client_name.style.removeProperty('outline');
	    		
	    		item_code.value="";
	    		item_code.readOnly=false;
	    	
	    		item_code.style.removeProperty('outline');
          }
	    	
	    	
  	   });
	   
	  //checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
    	grid.on('uncheck', (ev) => {
    		var client_name = document.getElementById('client_name');
	    	var item_code = document.getElementById('item_code');
	  
    		client_name.value="";
    		client_name.readOnly=false;
    		client_name.style.removeProperty('outline');
    		client_name.disabled=false;
    		
    		item_code.value="";
    		item_code.readOnly=false;
    		item_code.style.removeProperty('outline');
    		item_code.disabled=false;
 
    		
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