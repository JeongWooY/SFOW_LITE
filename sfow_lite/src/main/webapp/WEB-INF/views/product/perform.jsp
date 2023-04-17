<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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

input[type="date"],
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


.form-field {
  display: inline-block;
  width: 20%;
  vertical-align: top;
  margin-right: 2%;
}

.form-field:last-child {
  margin-right: 0;
}

.form-field input[name="user_code"] {
  background-image: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-512.png');
  background-repeat: no-repeat;
  background-size: 20px;
  background-position: right center;
  padding-right: 30px;
}
.modal {
  display: none;
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 5000;
}

.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 600px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.custom-button {
    background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
}

#saveBtn:hover, #saveBtn2:hover, #search:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}

#deleteRowBtn:hover, #deleteRowBtn2:hover, #reset:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}

#addRowBtn:hover, #addRowBtn2:hover {
  background-color: rgba(80, 201, 141);
  opacity: 0.8;
}
</style>
<script>
$(document).ready(function() {
	  $('#search').click(function(event) {
		 event.preventDefault();
			var pp_no = $('#pp_no').val();
			var pp_date = $('#pp_date').val();
			var end_date = $('#end_date').val();
			var user_code = $('#user_code').val();
			var user_name = $('#user_name').val();
			var per_quantity = $('#per_quantity').val();
		 
		 
	$.ajax({
	type : "GET",
	dataType :"JSON",
	url : "${conPath}/selectOrder",
	data:{	
			pp_no:pp_no,
			pp_date:pp_date,
			end_date:end_date,
			user_code:user_code,
			user_name:user_name,
			per_quantity:per_quantity
	},
	success : function(data){
	  	grid2.clear()
	  	grid3.clear()
		grid.resetData(data);
 	   	// 그리드 수정
	   	grid.on('editingFinish', function(ev) {
        const rowKey = ev.rowKey;
        const columnName = ev.columnName;
        var updatedData = {};
        const rowData = grid.getRow(rowKey);
        console.log('Row data:', rowData);
        
        $.ajax({
             url: "${conPath}/updateOrder",
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
	  	
        grid.on('check', function(ev){
            
        	const rowKey = ev.rowKey;
            const columnName = ev.columnName;
            var updatedData = {};
            const rowData = grid.getRow(rowKey);
            console.log('Row data: ', rowData);
            
            if(grid.getCheckedRows().length==1){
	            var pp_no = document.getElementById('pp_no');
	          	var pp_date = document.getElementById('pp_date');
	          	var end_date = document.getElementById('end_date');
	         	
	          	var test1 =rowData.pp_no;
	          	var test2 =rowData.pp_date;
	          	var test3 =rowData.end_date;
	          	
	          	pp_no.value=test1;
	          	pp_no.disabled=true;
	          	
	          	if(test2==null || test2==""){
	          		pp_date.value=test2;
	          		pp_date.disabled=false; 
	          	}else{
	          		pp_date.value=test2;
	          		pp_date.disabled=true;
	          		} 
	          	
	          	if(test3==null || test3==""){
	          		end_date.value=test3;
	          		end_date.disabled=false; 
	          	}else{
	          		end_date.value=test3;
	          		end_date.disabled=true; 	
	          		}
	          	
            }else{
	            
            	var pp_no = document.getElementById('pp_no');
	          	var pp_date = document.getElementById('pp_date');
	          	var end_date = document.getElementById('end_date');
                
	        	pp_no.value=test1;
	          	pp_no.disabled=false;
	          	pp_date.value=test2;
	          	pp_date.disabled=false; 
	          	end_date.value=test3;
	          	end_date.disabled=false; 
               	grid2.clear();
               	
            }
            event.preventDefault();
            
          	$.ajax({
          	    url: "${conPath}/selectPerform",
          	    method: 'GET',
          	    dataType: 'JSON',
          	    data:{ pp_no: pp_no.value},
          	    contentType: 'application/json',
          	    success: function(response){
          	    	grid2.resetData(response)
          	    	console.log('Success:', response); 
          	    	
          	       grid2.on('check', function(ev){
          	        	const rowKey = ev.rowKey;
          	            const columnName = ev.columnName;
          	            var updatedData = {};
          	            const rowData = grid2.getRow(rowKey);
          	            console.log('Row data2: ', rowData);
          		   
          	            $.ajax({
          	             url: "${conPath}/selectBOM",
          	             method: 'PUT',
          	             dataType: 'JSON',
          	          	 data: JSON.stringify(rowData),
          	             contentType: 'application/json',
          	             success: function(response){
          	            	 grid3.resetData(response);
          	            	console.log('Success:', response);
          	             },
          	             error: function(error) {
          	                 console.log('Error:', error);
          	             }
          		   		});
          	       		
          	          $('#deleteRowBtn2').click(function(event) {
            	            $.ajax({
                 	           url: "${conPath}/deletePerform",
                 	           method: 'PUT',
                 	           dataType: 'JSON',
                 	           data: JSON.stringify(rowData),
                 	           contentType: 'application/json',
                 	           success: function(response){
                 	            	console.log('Success:', response);
                 	            	alert("삭제완료");          
                 	                 var rowCount = grid2.getRowCount();
                 	                 var lastIndex = rowCount - 1;
                 	                 if (rowCount > 0 && !grid2.getData()[lastIndex]["in_order"]) {
                 	                   grid2.removeRow(lastIndex);
                 	                 }  else {
                 	                   return null;
                 	                 }
                 	             
                 	            	
                 	             },
                 	             error: function(error) {
                 	                 console.log('Error:', error);
                 	             }
          	          
          	         	 });
          	          });
          	            
          	            });
          	       
          	        grid2.on('uncheck',(ev) => {
          	        	
          	            grid3.clear();
          	            
          	         });
          	    	
          	    	
          	    },
          	    error: function(error) {
          	      console.log('Error:', error);
          	    }
          	 });
            
          });
        
        grid.on('uncheck',(ev) => {
        	var pp_no = document.getElementById('pp_no');
           	var pp_date = document.getElementById('pp_date');
           	var end_date = document.getElementById('end_date');

           	pp_no.value="";
           	pp_no.disabled=false;
           	pp_date.value="";
           	pp_date.disabled=false;
           	end_date.value="";
           	end_date.disabled=false;
            grid2.clear();
            
         }); 
	},
	error: function(xhr, status, error) {
    	console.log(error);
  	}
	});
		});
	  
	$('#saveBtn').click(function(event) {
			 event.preventDefault();
			 
		var pp_no = $('#pp_no').val();
		var pp_date = $('#pp_date').val();
		var end_date = $('#end_date').val();
		var user_code = $('#user_code').val();
		var user_name = $('#user_name').val();
		var per_quantity = $('#per_quantity').val();
      	
		if(end_date!=null && end_date!=""){
			alert("이미 완료된 작업지시입니다.")
			return
		}
		
		$.ajax({
      	    url: "${conPath}/insertPerform",
      	    method: 'GET',
      	    dataType: 'JSON',
      	    data:{ pp_no: pp_no,
      	    	   pp_date:pp_date,
      	    	   end_date:end_date,
      	    	   user_code:user_code,
      	    	   user_name:user_name,
      	    	   per_quantity:per_quantity
      	    },
      	    success: function(response){
      	      if (response.result === "success") {
      	        alert("생산을 등록하였습니다.")
      	        gird.clear();
      	        gird2.clear();
      	        gird3.clear();
      	        $("#searchOrder").trigger("click");
      	        
      	      } else {
      	        alert("작업량을 초과하였습니다.");
      	        
      	      }
      	    },
      		error: function(xhr, status, error) {
      		    	console.log(error);
      		  	}
      	    
		
		});
		
});
	

	
	
});

function restAllOrder(){
	grid.clear();
	grid2.clear();
	grid3.clear();
  	pp_no.disabled=false;
  	pp_date.disabled=false; 
  	end_date.disabled=false; 
  	user_code.disabled=false; 
  	user_name.disabled=false; 
  	per_quantity.disabled=false;
  	idInput.readOnly=false;
  	idInput.disabled=false;
  	
}

</script>
</head>
<body>
	<form id="orderSearch">
	<div>
		<input type="submit" value="조회" id="search" class="custom-button">
		<input type="reset" value="초기화" d="reset" class="custom-button" onclick="restAllOrder()">
		<input type="submit" value="작업등록" id="saveBtn" class="custom-button" name="saveBtn">
 		<br/><br/>
 	</div>
 		<div class="form-field">
			<label for="pp_no">지시번호:</label>
			<input type="text" name="pp_no" id="pp_no" value="">
		</div>
		<div class="form-field">
			<label for="pp_date">시작날짜:</label>
			<input type="date" name="pp_date" id="pp_date" value="">
		</div>
		<div class="form-field">
			<label for="end_date">종료날짜:</label>
			<input type="date" name="end_date" id="end_date" value="">
		</div>
			<div class="form-field">
			<label for="user_code">작업자코드:</label>
			<input type="text" name="user_code" id="user_code" ondblclick="openModal()" value="">
		</div>
		<div class="form-field">
			<label for="user_name">작업자명:</label>
			<input type="text" name="user_name" id="user_name" value="">
		</div>
		<div class="form-field">
			<label for="per_quantity">작업수량:</label>
			<input type="text" name="per_quantity" id="per_quantity" value="">
		</div>
	</form>
	<div id="grid">지시목록</div>
<script>
var gridData = [];
var grid = new tui.Grid({
  el: document.getElementById('grid'),
  data: gridData,
  scrollX: true,
  scrollY: true,
  rowHeaders: [{
      type: 'rowNum',
      header: "",
      width: 50,
  },'checkbox'],
  columns: [
    {
      header: '지시번호',
      name: 'pp_no',
      align: 'center'
    },
    {
      header: 'ITEM코드',
      name: 'item_code',
      align: 'center'
    },
    {
      header: '품명',
      name: 'item_name',
      align: 'center'
    },
    {
      header: '지시수량',
      name: 'pp_quantity',
      align: 'center'
    },
    {
      header: '작업시작',
      name: 'pp_date',
      editor: 'text',
      align: 'center'
    },
    {
      header: '작업종료',
      name: 'end_date',
      editor: 'text',
      align: 'center'
     },
    {
      header: '입고창고',
      name: 'warehouse_name',
      align: 'center'
     }
  ]
});
</script>
	<div id="grid2">생산LOT <input type="button" name="deleteRowBtn2"  id="deleteRowBtn2" class="custom-button" style="float:right;" value="작업 삭제하기"></div>
<script>
var gridData2 = [];
var grid2 = new tui.Grid({
  el: document.getElementById('grid2'),
  data: gridData2,
  scrollX: true,
  scrollY: true,
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
	  header: '작업자',
	  name: 'user_name',
	  align: 'center'
	},
    {
      header: '수량',
      name: 'per_quantity',
      align: 'center'
    },
    {
      header: 'ITEM코드',
      name: 'item_code',
      align: 'center'
    },
    {
      header: 'ITEM이름',
      name: 'item_name',
      align: 'center'
    }
  ]
});
</script>	
	<div id="grid3">BOM투입내역</div>
<script>
var gridData3 = [];
var grid3 = new tui.Grid({
  el: document.getElementById('grid3'),
  data: gridData3,
  scrollX: true,
  scrollY: true,
  rowHeaders: [{
      type: 'rowNum',
      header: "",
      width: 50,
  },'checkbox'],
  columns: [
    {
      header: 'ITEM코드',
      name: 'sitem_cd',
      align: 'center'
    },
    {
      header: '품명',
      name: 'item_name',
      align: 'center'
    },
    {
      header: '수량',
      name: 'item_qty',
      align: 'center'
    }
  ]
});
</script>
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
	<div id="search-result">
	    <h3>직원 검색</h3>
	    <input type="text" id="idInput" placeholder="검색어를 입력하세요">
	    <input type="button" id="workerSearch" name="workerSearch" value="조회">
	    <input type="button" id="choiceUser" value="확인" style="float:right;">
    </div>
    <div id="grid4"></div>
  </div>
</div>
<script>
$(document).ready(function() {
	$('#user_code').on('dblclick', function() {
		 event.preventDefault();
		 var myModal = document.getElementById("grid4");
         var idInput = document.getElementById("idInput");
 	  	 var user_code = document.getElementById('user_code');
      	 var user_name = document.getElementById('user_name');
       	 var end_date = document.getElementById('end_date');
     	
			      
      	 user_name.value="";
      	 user_code.value="";
         idInput.value="";
         myModal.innerHTML = "";
         
		 event.preventDefault();
		var data = $(this).val();
		
		$('#search-input').val(data);
		
		var gridData4 = [];
		var grid4 = new tui.Grid({
		  el: document.getElementById('grid4'),
		  data: gridData4,
		  scrollX: true,
		  scrollY: true,
		  bodyHeight:200,
		  rowHeaders: [{
		      type: 'rowNum',
		      header: "",
		      width: 50,
		  },'checkbox'],
		  columns: [
		    {
		      header: 'id',
		      name: 'id',
		      align: 'center'
		    },
		    {
		      header: '이름',
		      name: 'user_name',
		      align: 'center'
		    }
		  ]
		});
		
		openModal();
		
		$('#workerSearch').click(function(event) {
			event.preventDefault();
			var user_code = $('#idInput').val();
			var user_name = $('#user_name').val();
			$('#search-result').show();
			
			$.ajax({
				type : "GET",
				dataType :"JSON",
				url : "${conPath}/selectWorker",
				data:{
					user_code:user_code,
					user_name:user_name
				},
				success : function(data){
					grid4.resetData(data);
					$('#search-result').show();
					
					// 모달이 열릴 때, grid4에 'check' 이벤트 바인딩
					grid4.on('check', function(ev){
						const rowKey = ev.rowKey;
						var updatedData = {};
						const rowData = grid4.getRow(rowKey);
						console.log('Row data4: ', rowData);
						
						// ID를 고유하게 변경한 후 해당 input 태그의 value 변경
						var idInput = document.getElementById('idInput');
						var testId = rowData.id;
						idInput.value = testId;
					   
						$('#choiceUser').click(function(event) {
					        event.preventDefault();
					    	
					        // 외부 input 요소에 체크한 데이터 입력
					        $('#user_code').val(rowData.id);
					        $('#user_name').val(rowData.user_name);
							
					        // 모달창 닫기
					        closeModal();
					      
					    });
						
					});
					
				     grid4.on('uncheck',(ev) => {
				       	var idInput = document.getElementById('idInput');
				        idInput.value="";			            
				         }); 
				     
				     
				},
				error: function(error) {
					console.log('Error:', error);
				}
			});
			
		});
	});
	  
	

});

//모달 창 열기 함수
function openModal() {
	
	
	var modal = document.getElementById("myModal");
	modal.style.display = "block";

	var span = document.getElementsByClassName("close")[0];
	span.onclick = function () {
		modal.style.display = "none";
		
		// 모달이 닫힐 때, 이전에 바인딩된 'check' 이벤트 언바인딩
		grid4.off('check');

	}
}
	window.onload=function (event) {
		if (event.target == modal) {
			modal.style.display = "none";
			// 모달이 닫힐 때, 이전에 바인딩된 'check' 이벤트 언바인딩
	
		}
	}

function closeModal() {
	  var modal = document.getElementById("myModal");
	  modal.style.display = "none";

	  // 모달이 닫힐 때, 이전에 바인딩된 'check' 이벤트 언바인딩
	  	var user_code = document.getElementById('user_code');
      	var user_name = document.getElementById('user_name');
      	
      	if(user_code==null || user_code==""){
      		user_code.disabled=false;
        	user_name.disabled=false;
      	}else{
      		user_code.disabled=true;
      		user_name.disabled=true;
      	}

	}

</script> 
</body>
</html>