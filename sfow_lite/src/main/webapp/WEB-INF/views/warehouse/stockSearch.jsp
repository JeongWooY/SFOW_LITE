<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Search Results</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/>
<script>
var elem = document.documentElement;

$(document).ready(window.onload=function() {
  
  $('#full').click(function(){
	  event.preventDefault();
	  
	  if (elem.requestFullScreen) {
		    elem.requestFullScreen();
		  } else if (elem.webkitRequestFullScreen) { 
		    elem.webkitRequestFullscreen();
		  } else if (elem.msRequestFullScreen) {
		    elem.msRequestFullscreen();
		  }
	  function enterFullscreen() {
		  document.documentElement.requestFullscreen();
		  localStorage.setItem('isFullscreen', true);
		}
  });
    
  
  $('#searchBtn').click(function() {
    event.preventDefault(); // prevent form submission
    
    // get search parameters
    var item_type = $('#item_type').val();
    var warehouse_name = $('#warehouse_name').val();
    var item_name = $('#item_name').val();
    var item_code = $('#item_code').val();
    
    // make AJAX call to server
    $.ajax({
      url: '<%=request.getContextPath()%>/search',
      type: 'get',
      dataType:'JSON',
      data: {
        item_type: item_type,
        warehouse_name: warehouse_name,
        item_name: item_name,
        item_code: item_code
      },
      success: function(data) {
    	 	console.dir(data);
    	 	grid2.clear();
    	  	grid.resetData(data);
    	   	
    	   	grid.on('editingFinish', function(ev) {
            const rowKey = ev.rowKey;
            const columnName = ev.columnName;
            var updatedData = {};
            const rowData = grid.getRow(rowKey);
            console.log('Row data: ', rowData);
            
            $.ajax({
                 url: '<%=request.getContextPath()%>/updateStock',
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
    	   	});//grid.on(첫번쨰)
            //checkbox 체크 시에 input 태그에 해당 value 출력 (추가수정 필요 checkbox 2개 check 시에 박스안에 data clear)
            grid.on('check', function(ev){
              const rowKey = ev.rowKey;
              const columnName = ev.columnName;
              var updatedData = {};
              const rowData = grid.getRow(rowKey);
              console.log('Row data: ', rowData);
              
              if(grid.getCheckedRows().length==1){
              
              	var warehouse_name = document.getElementById('warehouse_name');
            	var item_type      = document.getElementById('item_type');
            	var item_code      = document.getElementById('item_code');
            	var item_name      = document.getElementById('item_name');
            	
            
            	var test1 =rowData.warehouse_name;
            	var test2 =rowData.item_type;
            	var test3 =rowData.item_code;
            	var test4 =rowData.item_name;
            	//alert(rowData.warehouse_name);
            	//warehousename.innerText=test;
            	warehouse_name.value=test1;
            	warehouse_name.disabled=true;
            	item_type.value=test2;
            	item_type.disabled=true;
            	item_code.value=test3;
            	item_code.disabled=true;
            	item_name.value=test4;
            	item_name.disabled=true;}
              else{
            	  var warehouse_name = document.getElementById('warehouse_name');
                  var item_type = document.getElementById('item_type');
                  var item_code = document.getElementById('item_code');
                  var item_name = document.getElementById('item_name');
                  
                     //warehousename.innerText="";
                  warehouse_name.value="";
                  warehouse_name.disabled=false;
                  item_type.value="";
                  item_type.disabled=false;
                  item_code.value="";
                  item_code.disabled=false;
                  item_name.value="";
                  item_name.disabled=false;
                  grid2.clear();
              }
            	
              
            	$.ajax({
            	    url: '<%=request.getContextPath()%>/search2',
            	    method: 'GET',
            	    dataType: 'JSON',
            	    data:{item_type: item_type.value,
            	          warehouse_name: warehouse_name.value,
            	          item_name: item_name.value,
            	          item_code: item_code.value
            	         },
            	    contentType: 'application/json',
            	    success: function(response) {
            	    	grid2.resetData(response)
            	    	console.log('Success:', response);
            	     
            	    },
            	    error: function(error) {
            	      console.log('Error:', error);
            	    }
            	 });
              
            });
         //checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
         grid.on('uncheck',(ev) => {
            var warehouse_name = document.getElementById('warehouse_name');
            var item_type = document.getElementById('item_type');
            var item_code = document.getElementById('item_code');
            var item_name = document.getElementById('item_name');
            
               //warehousename.innerText="";
            warehouse_name.value="";
            warehouse_name.disabled=false;
            item_type.value="";
            item_type.disabled=false;
            item_code.value="";
            item_code.disabled=false;
            item_name.value="";
            item_name.disabled=false;
            grid2.clear();
            
         });
    	   	
    	  },
      error: function(xhr, status, error) {
        // handle error
        console.log(error);
      }
    });
  });
});
//모든 테이블  초기화하는 부분, 위 아래 두 개 테이블 모두 초기화하고 checked상태에서 초기화할 경우 readOnly랑 disabled false처리
function fnReset(){
	//처음엔 ajax로 넘어온 데이터를 다 ""로 입력해서 다시 resetData하려했는데 grid자체적으로 clear()함수가 있었음
	 grid.clear();
	 grid2.clear();
	 
	 warehouse_name.disabled=false;
	 item_type.disabled=false;
     item_code.disabled=false;
     item_name.disabled=false;
}



</script>
<style>
	body {
		font-family: sans-serif;
		background-color: #f0f0f0;
	}
	h1 {
		font-size: 24px;
		color: #333;
		text-align: center;
		margin-top: 20px;
		margin-bottom: 10px;
	}
	form {
		background-color: #fff;
		border-radius: 5px;
		box-shadow: 0px 0px 5px #ccc;
		padding: 20px;
		margin: 0 auto;
	}
	label {
		display: block;
		font-size: 16px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	input[type="text"],
	select {
		width: 100%;
		padding: 10px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 5px;
		margin-bottom: 20px;
		box-sizing: border-box;
	}
	input[type="submit"],
	input[type="reset"],
	button {
		background-color: #333;
		color: #fff;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		font-size: 16px;
		cursor: pointer;
		margin-right: 10px;
	}
	input[type="submit"]:hover,
	input[type="reset"]:hover,
	button:hover {
		background-color: #555;
	}
	button {
		background-color: #ccc;
		color: #333;
	}
	.form-field {
	    display: inline-block;
	    width: 20%; 
	    vertical-align: top;
	    margin-right: 2%;
	}
	.form-field:last-child {
	    margin-right: 0;
	}
	
	.moveEtc{
	padding: 10px;
	}
	#moveBtn{
	margin:5px;
	color:white;
	background-color:green;
			 }
	#moveResetBtn{
	margin:5px;
	color:white;
	background-color:red;
			 }
	#worker{
	margin:5px;
	width:20%;
	}

</style>
</head>

<body>
	<h1>재고현황(필드모드)</h1>
 	<form id="stockSearch" >
	<div>
	<input type="submit" value="검색하기" id="searchBtn">
	<input type="reset" value="초기화" onclick="fnReset()">
	<input type="submit" id="full" value="Open Fullscreen">
	<input type="button" id="pageMove" value="페이지이동" onclick="location.href='<%=request.getContextPath()%>/test2'"/>
 	<br/><br/>
 	</div>
		
			<div class="form-field">
				<label for="itemType">품목구분</label>
				<select name="item_type" id="item_type">
					<option value="">--</option>
					<option value="ITEM01">마우스</option>
					<option value="ITEM02">키보드</option>
					<option value="올레드">OLED</option>
					<option value="4k">4k</option>
				</select>
			</div>
			<div class="form-field">
				<label for="warehouseName">창고명:</label>
				<select name="warehouse_name" id="warehouse_name">
					<option value="">--</option>
					<option value="마우스창고">마우스창고</option>
					<option value="키보드창고">키보드창고</option>
					<option value="모니터창고">모니터창고</option>
				</select>
			</div>
		<div class="form-field">
		<label for="itemName">품명:</label>
		<input type="text" name="item_name" id="item_name" value="">
		</div>
		<div class="form-field">
		<label for="itemCode">품목코드:</label>
		<input type="text" name="item_code" id="item_code" value="">
		</div>
	</form> 
	

<div id="grid"></div>
<div id="grid2"></div>
<script>
    //첫번째 테이블
    var gridData = [];
    var grid = new tui.Grid({
      el: document.getElementById('grid'),
      data: gridData,
      scrollX: false,
      scrollY: false,
      rowHeaders: [{
          type: 'rowNum',
          header: "",
          width: 50,
      },'checkbox'],
      columns: [
        {
          header: '창고명',
          name: 'warehouse_name',
          align: 'center'
        },
        {
          header: '품목이름',
          name: 'item_name',
          align: 'center'
        },
        {
          header: '품목코드',
          name: 'item_code',
          align: 'center'
        },
        {
          header: '양품수량',
          name: 'pass_quantity',
          editor: 'text',
          align: 'center'
        },
        {
          header: '불량수량',
          name: 'fail_quantity',
          editor: 'text',
          align: 'center'
        },
        {
          header: '수량',
          name: 'quantity',
          editor: 'text',
          align: 'center'
        }
      ]
    });

    grid.on('check', function(ev) {
      console.log('check', ev);
    });

    grid.on('uncheck', function(ev) {
      console.log('uncheck', ev);
    });
    
    //체크박스로 가지고오는 두번째 테이블
    var gridData2 = [];
    var grid2 = new tui.Grid({
      el: document.getElementById('grid2'),
      data: gridData2,
      scrollX: false,
      scrollY: false,
      rowHeaders: [{
          type: 'rowNum',
          header: "",
          width: 50,
      },'checkbox'],
      columns: [
        {
          header: 'LOT번호',
          name: 'lot_no',
          align: 'center'
        },
        {
          header: '양품수량',
          name: 'pass_quantity',
          editor: 'text',
          align: 'center'
        },
        {
          header: '불량수량',
          name: 'fail_quantity',
          editor: 'text',
          align: 'center'
        },
        {
          header: '수량',
          name: 'quantity',
          editor: 'text',
          align: 'center'
        }
      ]
    });
</script>
		<div style="text-align:center;" class="moveEtc">
		작업자<input type="text" name="worker" id="worker">
			<input type="submit" value="이동하기" name="moveBtn" id="moveBtn">
			<input type="reset" value="취소하기" name="moveResetBtn" id="moveResetBtn">
		</div>
</body>
</html>