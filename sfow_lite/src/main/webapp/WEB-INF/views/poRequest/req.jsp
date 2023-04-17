<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<h3>구매발주</h3>
<script>

 $(document).ready(window.onload=function() {
	 
	 var addRowBtn = document.getElementById('addRowBtn');
	   addRowBtn.addEventListener('click', function() {
	     var newRowData = {
	    request_number: '',
	    request_type: '',
	    request_date: '',
	    createdate: '',
	    memo: '',
	    delyn: '',
	    company_code: '${sessionScope.AUTHUSER.companyCode}'
	    };
	     grid.appendRow(newRowData);
	   });  
	   
	 var addRowBtn2 = document.getElementById('addRowBtn2');
	   addRowBtn2.addEventListener('click', function() {
	     var newRowData = {
 		 request_order: '',
 		 item_code: '',
 		 no: '',
 		 item_name: '',
 		 item_no: '',
 		 item_stock_unit: '',
 		 request_quantity: '',
 		 price: '',
 		 amount: '',
 		 tax_amount: '',
 		 memo: '',
 		 request_number: document.getElementById('request_number').value.toString()
	    };
	     grid2.appendRow(newRowData);
	   });  
 
	 //행삭제
     var removeRowBtn = document.getElementById('removeRowBtn');
	   removeRowBtn.addEventListener('click', function() {
		var rowCount = grid.getRowCount();
	  	 var lastIndex = grid.getRowCount()-1;
	     if (rowCount > 0 && !grid.getData()[lastIndex]["request_number"]) {
	            grid.removeRow(lastIndex);
	         } else {
	            return null;
	         
	         }
	   }); 

 
	 var removeRowBtn2 = document.getElementById('removeRowBtn2');
	   removeRowBtn2.addEventListener('click', function() {
		var rowCount = grid2.getRowCount();
	  	 var lastIndex = grid2.getRowCount()-1;
	     if (rowCount > 0 && !grid2.getData()[lastIndex]["request_order"]) {
	            grid2.removeRow(lastIndex);
	         } else {
	            return null;
	         
	         }
	   });  
		   
	   
	   
	 //데이터삭제
	 // 삭제실행
	 $("#deleteBtn").click(function() {
      let d = confirm('삭제하시겠습니까?');
      if(d) {
         reqDelfunction();
      }else {
        return false;
      }
	});
	 
	 //초기화
  	 var resetRow = document.getElementById('resetRow');
	   resetRow.addEventListener('click', function() {
	      var confirmMsg = `초기화하시겠습니까?`;
	      if(confirm(confirmMsg))
	      grid.clear();
	      grid2.clear();
	   });
	
    //입력
    $("#saveBtn").click(function() {
       let i = confirm('등록하시겠습니까?');
         if(i) {
            saveFunction();
         }else {
            return false;
         }
      });
    $("#saveBtn2").click(function() {
       let i = confirm('등록하시겠습니까?');
         if(i) {
            saveFunction2();
         }else {
            return false;
         }
      });
    
 
	 $('#searchBtn').click(function(event) {
		 event.preventDefault();
	    var request_number = $('#request_number').val();
	    var request_type = $('#request_type').val();
	    var request_date = $('#request_date').val();
	    var request_empid = $('#request_empid').val();
	    
	 $.ajax({
	      url : "${conPath}/reqSearch",
	      type : "GET",
	      dataType : "JSON",
	      data:  {
	    	    request_number: request_number,
	    	    request_type: request_type,
	    	    request_date: request_date,
	    	    request_empid:request_empid
	    	},
	      success : function(data) {
	         console.dir(data);
	         grid2.clear();
	         grid.resetData(data);
	         
	         grid.on('click', function(ev) {
	             const rowKey = ev.rowKey;
	             const columnName = ev.columnName;
	             var updatedData = {};
	             const rowData = grid.getRow(rowKey);
	             console.log('Row data: ', rowData);

	             $.ajax({
	            	 url: '${conPath}/reqUpdate',
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
	             });//ajax_update
	            
	          });//gridon
	          
	          //추가!!!
	          grid.on('check', function(ev){
	              const rowKey = ev.rowKey;
	              const columnName = ev.columnName;
	              var updatedData = {};
	              const rowData = grid.getRow(rowKey);
	              console.log('Row data: ', rowData);
	              if(grid.getCheckedRows().length==1){
	              
	              	var request_number = document.getElementById('request_number');
	            	var request_type = document.getElementById('request_type');
	            	var request_date = document.getElementById('request_date');
	            	var request_empid = document.getElementById('request_empid');
	            	
	            
	            	var test1 =rowData.request_number;
	            	var test2 =rowData.request_type;
	            	var test3 =rowData.request_date;
	            	var test4 =rowData.request_empid;
	            	
	            	request_number.value=test1;
	            	request_number.disabled=true;
	            	request_type.value=test2;
	            	request_type.disabled=true;
	            	request_date.value=test3;
	            	request_date.disabled=true;
	            	request_empid.value=test4;
	            	request_empid.disabled=true;}
	              else{
	            	  var request_number = document.getElementById('request_number');
	                  var request_type = document.getElementById('request_type');
	                  var request_date = document.getElementById('request_date');
	                  var request_empid = document.getElementById('request_empid');
	                  
	                  request_number.value="";
	                  request_number.disabled=false;
	                  request_type.value="";
	                  request_type.disabled=false;
	                  request_date.value="";
	                  request_date.disabled=false;
	                  request_empid.value="";
	                  request_empid.disabled=false;
	                  grid2.clear()
	                  }
	              
	               $.ajax({
	            	    url: "${conPath}/reqDetail",
	            	    method: 'GET',
	            	    dataType: 'JSON',
	            	    data:  {
	            	    	request_number:request_number.value
				    	},
	            	    contentType: 'application/json',
	            	    success: function(response) {
	            	    	grid2.resetData(response)
	            	    	console.log('Success:', response);
	         	     
	            	    	grid2.on('editingFinish', function(ev) {
	           	             const rowKey = ev.rowKey;
	           	             const columnName = ev.columnName;
	           	             var updatedData = {};
	           	             const rowData = grid2.getRow(rowKey);
	           	             console.log('Row data: ', rowData);

	           	             $.ajax({
	           	            	 url: '${conPath}/reqDetailUpdate',
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
	           	             });//ajax_update
	            	    	});
	           	           
	            	    },
	            	    error: function(error) {
	            	      console.log('Error:', error);
	            	    }
	            	 });
	          });
	          
	          grid.on('uncheck',(ev) => {
	        	  var request_number = document.getElementById('request_number');
            	  var request_type = document.getElementById('request_type');
            	  var request_date = document.getElementById('request_date');
            	  var request_empid = document.getElementById('request_empid');
	              
	              request_number.value="";
                  request_number.disabled=false;
                  request_type.value="";
                  request_type.disabled=false;
                  request_date.value="";
                  request_date.disabled=false;
                  request_empid.value="";
                  request_empid.disabled=false;
                  grid2.clear()
	              
	           });
	          
	       }//search_success
		});//ajax_search
	 }); //searchBtn
	 

	   // 삭제함수
    function reqDelfunction() {
       
       var rowKeys = grid.getCheckedRowKeys();  
       var jsonRowKeys = JSON.stringify(rowKeys); 
       var rowDatas = grid.getCheckedRows();   
       var jsonRowDatas = JSON.stringify(rowDatas);
  
       grid.removeCheckedRows([jsonRowKeys]);
  
       $.ajax({
            url : "${conPath}/reqDel",
            method : "PUT",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8",
            dataType: "JSON",
            success : function (result) {
            },
            error: function() {
                console.log("실패");
             }
		});
    }  

	 
	 //입력함수
  	 function saveFunction() {

         var rowDatas = grid.getCheckedRows(); 
         alert("rowDatas : " + rowDatas);
         var jsonRowDatas = JSON.stringify(rowDatas); 
         alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
         
         $.ajax({
            url : "${conPath}/reqInsert",
            method : "post",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8", 
            dataType: "JSON", 
            success : function (result) {
               
            },
            error: function() {
                 console.log("입력실패");
          }
        });
	  } 
	 //입력함수
  	 function saveFunction2() {

         var rowDatas = grid2.getCheckedRows(); 
         alert("rowDatas : " + rowDatas);
         var jsonRowDatas = JSON.stringify(rowDatas); 
         alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
         
         $.ajax({
            url : "${conPath}/reqDetailInsert",
            method : "post",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8", 
            dataType: "JSON", 
            success : function (result) {
            	
            	grid2.on('editingFinish', function(ev) {
					  const rowKey = ev.rowKey;
					  const columnName = ev.columnName;
					  var updatedData = {};
					  const rowData = grid2.getRow(rowKey);
					  console.log('Row data: ', rowData);

					  $.ajax({
						  url: '${conPath}/reqDetailUpdate',
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
					  });//ajax_update
				  });
            },
            error: function() {
                 console.log("입력실패");
          }
        });
	  } 
	}); //doc끝
	 	
  	
 	</script>
 	
 	<script>
 	//modal에 띄워지는 grid3

 	  var body = document.querySelector('body');
 	  var modal = document.querySelector('.modal');
 	  var btnOpenPopup = document.querySelector('.btnFas');

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
 		
 		//modal 안에 grid2의 checkbox 체크된 row데이터 input태그에 찍기
 		function applyModal() {
 		      if (grid3 && grid3.getCheckedRows().length > 0) {
 		   	    const checkedRows = grid3.getCheckedRows();
 		   	    const id = document.getElementById('request_empid');
 		   		id.value = checkedRows[0].id;
 		      }        
 		         modal.classList.remove('show');
 		         body.style.overflow = 'auto';
 			   // });
 			}	
 		



 	$(document).ready(function() {
 		
 	  $('.btnFas').dblclick(function(event) {
 		  
 	  
 		  event.preventDefault();
 		//추가된 부분!!
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
 	      	header: 'id',
 	      	name: 'id',
 	      	sortable: true,
 	      	align:'center',
 	      	width:165
 	 	    	},
 	    	{
 	      	header: '담당자명',
 	      	name: 'user_name',
 	      	sortable: true,
 	      	align:'center',
 	      	width:165
 	    	}
 	  	]
 		});
 	  	

  	$.ajax({
 	    type:"GET", //요청방식 
 	    dataType:"JSON",
 	    url: '<%=request.getContextPath()%>/reqSearch1',
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
 		  
 			$('#searchBtn1').click(function(event) {
 	 			 event.preventDefault(); 
 	 		    var user_name = $('#user_name').val();
 	 		    
 	 		 $.ajax({
 	 		      url : "${conPath}/reqSearch1",
 	 		      type : "GET",
 	 		      dataType : "JSON",
 	 		      data:  {
 	 		    		user_name:user_name
 	 		    	},
 	 		      success : function(data) {
 	 		         console.dir(data);
 	 		         gridData3=data
 	 		         grid3.resetData(data);
 	 		      }
 	 		
				});//reqSearch1 ajax
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

	</script>
		
	<style>

	
	button {
	  /* background-color: rgba(60, 80, 135, 1); */
	  background-color: rgba(051, 51, 102, 1);
	  font-weight : bolder;
	}
	#searchBtn {
	  /* background-color: rgba(60, 80, 135, 1); */
	  background-color: rgba(051, 51, 102, 1);
	  font-weight : bolder;
	  height:35px;
	  width:80px; 
	  color:white; 
	  border:1px solid #8c8c8c;
	}
	
	#resetRow {
	  /* background-color: rgba(60, 80, 135, 1); */
	  background-color: rgba(051, 51, 102, 1);
	  font-weight : bolder;
	  height:35px;
	  width:80px; 
	  color:white; 
	  border:1px solid #8c8c8c;
	}
	
	
	#searchBtn:hover {
	  background-color: rgba(051, 102, 102, 1);
	  opacity: 0.8;
	}
	
	#searchBtn1:hover {
	  background-color: rgba(051, 102, 102, 1);
	  opacity: 0.8;
	}
	
	#resetRow:hover {
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
	
	#resetMdBtn:hover {
	  background-color: rgba(204, 000, 051, 1);
	  opacity: 0.8;
	}
	
	#closeBtn:hover {
	  background-color: rgba(051, 102, 204, 1);
	  opacity: 0.8;
	}
	
	#saveBtn:hover {
	  background-color: rgba(153, 102, 000, 1);
	  opacity: 0.8;
	}
	
	#deleteBtn:hover {
	  background-color: rgba(102, 102, 102, 1);
	  opacity: 0.8;
	}
		
	
	
	.form-title{
	  width : 100px;
	  height: 30px;
	  color:black;
	  font-weight:bold;
	  background-color: #e2e2e2;
	  /* background-color: #828282; */
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
	  /* background-color: rgb(230, 242, 255) */
	  /* text-align:center; */
	  /* vertical-align: middle; */
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
	  /* vertical-align: middle; */
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
	  /* position: absolute; */
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
	  /* margin-right: 4px; */
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
  
	.search_wh i.fa-search {
      position: absolute;
      left: 5px;
      top: 50%;
      transform: translateY(-50%);
      z-index: 1;
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

	.selectbox1 {
	    width: calc(100%)
	}
	.buttonRight{
		float:right
	}
	
	.divTable{
	   display: table;
	   background: #F8F8F8;
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
	</style>

</head>
<title>구매발주</title>

<body>
<h3>구매발주</h3>
		<form id="selectReq">
         <input type="submit" name="searchBtn" id="searchBtn" value="조회"/>
         <button type="button" name="deleteBtn" id="deleteBtn" style="height:35px; width:80px; color:white;">삭제</button>
         <button type="button" name="saveBtn" id="saveBtn" style="height:35px; width:80px; color:white;">저장</button>
        
         <input type="reset" name="resetRow" id="resetRow" value="초기화">
         <div class="buttonRight">
         	<button type="button" name="addRowBtn" id="addRowBtn" style="height:35px; width:30px; font-size:13px; color:white; border:1px solid #8c8c8c;">
			<i class="fas fa-plus"></i></button>
	    	<button type="button" name="removeRowBtn" id="removeRowBtn" style="height:35px; width:30px; font-size:13px; color:white; border:1px solid #8c8c8c;">
	    	<i class="fas fa-minus"></i></button>
         </div>
          <div class="divTable">
            <div class="divTableBody">
            <div class="divTableRow">
            <div class="divTableCell">구매발주번호</div>
                <div class="divTableCell">
                    <input class="divTableCell" type="text" name="request_number" id="request_number" value=""/>
                </div>
            <div class="divTableCell" style="border-color: rgb(255, 92, 92);">구매발주유형</div>
                <div class="divTableCell">
                    <select name="request_type" id="request_type">
                        <option value="">--</option>
                        <option value="일반구매">일반구매</option>
                        <option value="특별구매">특별구매</option>
                    </select>
                </div>
            <div class="divTableCell" style="border-color: rgb(255, 92, 92);">구매발주일자</div>
                <div class="divTableCell">
                    <input type="date" name="request_date" id="request_date"/>
                </div>
            </div>
            <div class="divTableRow">
            <div class="divTableCell" style="border-color: rgb(255, 92, 92);">구매발주담당자
            </div>
            <div class="divTableCell">
                <span style="position: relative;" class="btnFas">
                <input type="text" class="btn-open-popup" name="request_empid" id="request_empid" style="background-color: rgb(230, 242, 255);"/>
			  	</span>
                </div>
        	</div>
            </div>
          </div>
		</form>
	<p/>
	<div id="grid"></div>
	 <button type="button" name="saveBtn2" id="saveBtn2" style="height:35px; width:80px; color:white;">세부저장</button>
	 <div class="buttonRight">
	<button type="button" name="addRowBtn2" id="addRowBtn2" style="height:35px; width:30px; font-size:13px; color:white; border:1px solid #8c8c8c;">
	<i class="fas fa-plus"></i></button>
    <button type="button" name="removeRowBtn2" id="removeRowBtn2" style="height:35px; width:30px; font-size:13px; color:white; border:1px solid #8c8c8c;">
    <i class="fas fa-minus"></i></button>
    </div>
	<p/>
	<div id="grid2"></div>


 <script>
	 var gridData=[];
	 var grid = new tui.Grid({
	       el: document.getElementById('grid'),
	       data: gridData,
	       bodyHeight:250,
	       scrollX: false,
	       scrollY: true,
	       rowHeaders: [{
	           type: 'rowNum',
	           header: "  ",
	           width: 50,
	       },'checkbox'],
	       
	       columns: [
	          {
	           header: '구매발주번호',
	           sortable: true,
	           editor:'text',
	           name: 'request_number',
	           align:'center'
	          },
	         {
	           header: '구매발주유형',
	           sortable: true,
	           //editor:'text',
	           name: 'request_type',
	           formatter: 'listItemText',
	           editor: {
	             type: 'select',
	             options: {
	               listItems: [
	                 { text: '일반구매', value: '일반구매' },
	                 { text: '특별구매', value: '특별구매' }
	               ]
	             }
	           },
	           align:'center'
	         },
	         {
	           header: '구매발주일자',
	           sortable: true,
	           editor:'text',
	           name: 'request_date',
	           align:'center'
	         },
	         {
	           header: '구매발주담당',
	           sortable: true,
	           name: 'request_empid',
	           align:'center',
	           validation: { required: true }
	         },
	         {
	           header: '비고',
	           sortable: true,
	           editor:'text',
	           name: 'memo',
	           align:'center'
	           },
	         {
	           header: '등록수정일',
	           sortable: true,
	           name: 'createdate',
	           align:'center'
	         },
	         {
	           header: '회사코드',
	           sortable: true,
	           editor:'text',
	           name: 'company_code',
	           align:'center'
		      }
	       ]
	     });
	 
	 var gridData2=[];
	 var grid2 = new tui.Grid({
	       el: document.getElementById('grid2'),
	       data: gridData2,
	       bodyHeight:250,
	       scrollX: false,
	       scrollY: true,
	       rowHeaders: [{
	           type: 'rowNum',
	           header: "  ",
	           width: 50,
	       },'checkbox'],
	       
	       columns: [
	         {
	           header: '상세번호',
	           sortable: true,
	           name: 'request_order',
	           align:'center'
	          },
	         {
	           header: 'ITEM코드',
	           sortable: true,
	           name: 'item_code',
	           align:'center',
	           validation: { required: true }
	         },
	         {
	           header: '거래처번호',
	           sortable: true,
	           editor:'text',
	           name: 'no',
	           align:'center'
	         },
	        /* {
	           header: '거래처명',
	           sortable: true,
	           editor:'text',
	           name: 'client_name',
	           align:'center'
		      },*/
	         {
	           header: '품명',
	           sortable: true,
	           editor:'text',
	           name: 'item_name',
	           align:'center'
	         },
	         {
	           header: '품번',
	           sortable: true,
	           editor:'text',
	           name: 'item_no',
	           align:'center'
	           },
	         {
	           header: '재고단위',
	           sortable: true,
	           editor:'text',
	           name: 'item_stock_unit',
	           align:'center'
	         },
	         {
	           header: '수량',
	           sortable: true,
	           editor:'text',
	           name: 'request_quantity',
	           align:'center'
		     },
	         {
	           header: '단가',
	           sortable: true,
	           editor:'text',
	           name: 'price',
	           align:'center'
			 },
	         {
	           header: '공급가액',
	           sortable: true,
	           name: 'amount',
	           align:'center'
		     },
	         {
	           header: '부가세포함가',
	           sortable: true,
	           name: 'tax_amount',
	           align:'center'
		     },
		     {
	           header: '비고',
	           sortable: true,
	           editor:'text',
	           name: 'memo',
	           align:'center'
		     },
		     {
	           header: '구매발주번호',
	           sortable: true,
	           name: 'request_number',
	           align:'center'
		     }
		    
	       ]
	     }); //grid2
	     
	     
	     grid.on('dblclick', function(ev) {
	          if (ev.columnName === 'request_empid') {
	              window.open('${conPath}/reqChild2', 'childWindow', 'width=500,height=500');
	          }
	      });
		    	
	      window.addEventListener('message', function(ev) {
	          const selectedRow = ev.data;
	          const focusedCell = grid.getFocusedCell();
	          alert(JSON.stringify(selectedRow));
	          grid.setValue(focusedCell.rowKey, 'request_empid', selectedRow.id);
	      });
	      
	      function loadGridData() {
	    		
	    	  var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	          alert("rowDatas : " + rowDatas);
	          var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	          alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
	    	  
	    	  
	    	  $.ajax({
	    			url: "${conPath}/reqSearch",
	    			method: "GET",
	    			dataType: "JSON",
	    			contentType: "application/json; charset=utf-8",
	    			success: function(reqOrder) {
	    				console.dir(reqOrder);
	    				grid.resetData(reqOrder);
	    				
    					  grid.on('click', function(ev) {
    						  const rowKey = ev.rowKey;
    						  const columnName = ev.columnName;
    						  var updatedData = {};
    						  const rowData = grid.getRow(rowKey);
    						  console.log('Row data: ', rowData);

    						  $.ajax({
    							  url: '${conPath}/reqUpdate',
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
    						  });//ajax_update
    					  });
	    						
	    				  },
	    				  error: function(error) {
	    					console.log('Error:', error);
	    				  },

	    			error: function(reqOrderDetail) {
	    				alert('에러');
	    			}
	    		
	    		}); //ajax끝
	    	}
	     
	     
	     
	     grid2.on('dblclick', function(ev) {
	          if (ev.columnName === 'item_code') {
	              window.open('${conPath}/reqChild', 'childWindow', 'width=500,height=500');
	          }
	      });
		    	
	      window.addEventListener('message', function(ev) {
	          const selectedRow = ev.data;
	          const focusedCell = grid2.getFocusedCell();
	          alert(JSON.stringify(selectedRow));
	          grid2.setValue(focusedCell.rowKey, 'item_code', selectedRow.item_code);
	          grid2.setValue(focusedCell.rowKey, 'item_name', selectedRow.item_name);
	          grid2.setValue(focusedCell.rowKey, 'item_no', selectedRow.item_no);
	          grid2.setValue(focusedCell.rowKey, 'item_stock_unit', selectedRow.item_stock_unit);
	          grid2.setValue(focusedCell.rowKey, 'price', selectedRow.buy_price);
	      });
	      
	      
	      function loadGridData() {
	    		
	    	  var rowDatas = grid2.getCheckedRows();   // 선택한 row에 해당하는 객체값
	          alert("rowDatas : " + rowDatas);
	          var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	          alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
	    	  
	    	  
	    	  $.ajax({
	    			url: "${conPath}/reqDetail",
	    			method: "GET",
	    			dataType: "JSON",
	    			contentType: "application/json; charset=utf-8",
	    			success: function(reqOrderDetail) {
	    				console.dir(reqOrderDetail);
	    				grid2.resetData(reqOrderDetail);
	    				
    					  grid2.on('editingFinish', function(ev) {
    						  const rowKey = ev.rowKey;
    						  const columnName = ev.columnName;
    						  var updatedData = {};
    						  const rowData = grid2.getRow(rowKey);
    						  console.log('Row data: ', rowData);

    						  $.ajax({
    							  url: '${conPath}/reqDetailUpdate',
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
    						  });//ajax_update
    					  });
	    						
	    				  },
	    				  error: function(error) {
	    					console.log('Error:', error);
	    				  },

	    			error: function(reqOrderDetail) {
	    				alert('에러');
	    			}
	    		
	    		}); //ajax끝
	    	}
	    		
	      
	      

</script>
     <div class="modal">
  <!-- modal에 grid 띄우기 -->
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
	  <span>담당자명<input type="text" id="user_name" name="user_name">
	  <button type="button" id="searchBtn1" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c;">조회</button></span>
	  <p/>
    <!-- reset 버튼 추가 -->
    <button type="button" id="applyBtn" onclick="applyModal()" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources/img/request/apply_h.png" width="13px"/>&nbsp;&nbsp;적용
    </button>
    
    <button type="button" id="resetMdBtn" onclick="resetCheck()" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources/img/request/reset_h.png" width="11px"/>&nbsp;&nbsp;초기화
    </button>
    
    <button type="button" id="closeBtn" onclick="closeModal()" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources/img/request/ex_h.png" width="11px"/>&nbsp;&nbsp;닫기
    </button>
  </div>
</div>
</body>
</html>