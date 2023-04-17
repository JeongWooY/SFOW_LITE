<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<c:set var="CP"  value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
   <title>창고등록</title>
   <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
      
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/>

<style type="text/css">

div#grid{
 margin-top: 15px; 
}

button{
 width: 100px;
 
}
input#addRowBtn{
	margin-top: 15px;
	margin-bottom: 10px;
	float: right;
}
table{
	width:100%;
	height: 50px;
	border:1px;
	background-color: #C8FFFF;
	float: left;
	margin: auto;
}
td#td1{
}
div.whbox1{
	margin: 10px;
}

</style>
 
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
window.onload = function() {
     
   var gridData=[];
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
                 header: '회사코드',            // [필수] 컬럼 이름
                 name: 'company_code',                 // [필수] 컬럼 매핑 이름 값
                 hidden: true,                   // [선택] 숨김 여부
             },
            	{
                header: '창고구분',
                sortable: true, //정렬하는거 옆에 삼각형 2개생김
                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
                align:'center', //텍스트 가운데정렬
                name: 'warehouse_type'
              },
           {
             header: '창고코드',
             sortable: true,
             editor:'text',
             filter: {
                 type: 'text',
                 showApplyBtn: true,
                 showClearBtn: true
             },
             align:'center',
             name: 'warehouse_code',
           
           },
           {
             header: '창고명',
             sortable: true,
             editor:'text',
             align:'center',
             name: 'warehouse_name',
             filter: {
                 type: 'text',
                 showApplyBtn: true,
            	 showClearBtn: true
             },
           },
           {
             header: '거래처코드',
             sortable: true,
             editor:'text',
             align:'center',
             name: 'customer_code'
           },
           {
             header: '비고',
             sortable: true,
             editor:'text',
             width:'auto',
             align:'center',
             name: 'memo'
           },
           {
             header: '사용여부',
             sortable: true,
             editor:'text',
             align:'center',
             width:'90',
             name: 'useyn',
          //formatter: 'listItemText',     // [선택] 값을 기반으로 select box 옵션
             editor: {
                 type: 'select',
                 options: {
                     listItems: [
                         {text: "Y", value: "Y"},
                         {text: "N", value: "N"},
                     ]
                 }
             },
           },
           {
               header: '등록일',
               sortable: true,
               align:'center',
               width:'150',
               name: 'createdate'
             },
             {
               header: '등록자',
               sortable: true,
               editor:'text',
               align:'center',
               name: 'createuser'
             },
             {
                 header: '수정일시',
                 sortable: true,
                 align:'center',
                 width:'150',
                 name: 'updatedate'
               },
             {
                 header: '수정자',
                 sortable: true,
                 editor:'text',
                 align:'center',
                 name: 'updateuser'
               }
             
         ]

       }); //그리드 컬럼끝
   
   
    $.ajax({
      url : "${conPath}/warehouse/whinfoAJ",
      method : "GET",
      dataType : "JSON",
      success : function(result) {
         console.dir(result);
        grid.resetData(result);
      } 
      
      
   });
       //insert 저장하기
	 var saveBtn = document.getElementById('saveBtn');
	saveBtn.addEventListener('click',function() {
		
		});
       
 //행 추가
	var addRowBtn = document.getElementById('addRowBtn');
	addRowBtn.addEventListener('click', function() {
	  var newRowData = {
		warehouse_type:'',
		warehouse_code:'',
		warehouse_name:'',
		customer_code:'',
		 memo: '',
		 useyn: '',
		 createdate: '',
		 createuser:'',
		 updatedate: '',
		 updateuser:''
		 };
	  grid.appendRow(newRowData);
		 
	}); 

//};
	var gridData2=[];
	   var grid2 = new tui.Grid({
	         el: document.getElementById('areaGrid'),
	         data: gridData2,
	         scrollX: false,
	         scrollY: false,
	         align:'center',
	         width: '500px',
	         rowHeaders: [{
	             type: 'rowNum',
	             header: "",
	             width: 50,
	         },'checkbox'],
	           columns: [
	        	 {
	        		 header: '구역코드',
		                sortable: true, //정렬하는거 옆에 삼각형 2개생김
		                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
		                align:'center', //텍스트 가운데정렬
		                width: '150',
		                name: 'area_code'              
	             },
	            	{
	                header: '구역명',
	                sortable: true, //정렬하는거 옆에 삼각형 2개생김
	                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
	                align:'center', //텍스트 가운데정렬
	                width: '150',
	                name: 'area_name'
	              }
	         ]
	       }); //area 그리드 컬럼끝
	       
	  //행 추가
		var addRowBtn2 = document.getElementById('addRowBtn2');
		addRowBtn2.addEventListener('click', function() {
		  var newRowData =[{area_code:''},{ area_name:''}];
		  grid2.appendRow(newRowData);
		});
		
		// 그리드 
 		/*grid.on('click', (ev) => {
			  const { rowKey } = grid.getFocusedCell();
			  const rowData = grid.getRow(rowKey);
			  
			  const whcode= rowData.warehouse_code;
			  
			//alert(whcode); 
		});
		*/
		
		//조회 버튼 클릭하면 특정 내용 검색(빈내용이면 전부 검색)
		$(document).ready(function(){
			
			  $('#searchBtn').click(function(event) {
				  event.preventDefault(); // prevent form submission
				  var Grid = tui.Grid;
				    // get search parameters
				    var warehouse_type = $('#warehouse_type').val();
				    var warehouse_code = $('#warehouse_code').val();
				    var warehouse_name = $('#warehouse_name').val();
				   // alert(warehouse_type);
				     
				    // make AJAX call to server
				    $.ajax({
				      url:'${conPath}/warehouse/searchWH',
				      type: 'get',
				      dataType:'JSON',
				      data: {
			    	  warehouse_type: warehouse_type,
			    	  warehouse_code: warehouse_code,
			    	  warehouse_name: warehouse_name
			      },
			      success: function(data) {
			    	 	console.dir(data);
			    	 	grid.clear();
			    	 	grid.resetData(data);
			    	  	
			    	  	
			      }
			    	   	 });
			 	});
			});
		
		
		
		
		
		
};//윈로드 스크립트 시작,종료
</script>



<body>

	<h3>창고등록(입력폼)</h3>
<hr>
	
	<form name="whFrm" id="whFrm">
		
		<div class="whbox1">
	<!-- 	<input type="button" name="serchBtn" id="serchBtn" value="조회"> -->
		<input type="submit" name="saveBtn" id="saveBtn" value="저장">
		<input type="button" name="delBtn" id="delBtn" value="삭제">
		<input type="button" name="clearBtn" id="clearBtn" value="초기화" onClick="window.location.reload()">
		</div>
		
		
		<!-- 
		<button name="WH_type_btn" id="WH_type_btn">창고구분</button>
		<select>
			<option value="null">--</option>
			<option value="type1">제품창고</option>
			<option value="type2">반제품창고</option>
			<option value="type3">자재창고</option>
			<option value="type4">일반창고</option>
			<option value="type5">설비창고</option>
			<option value="type6">금형창고</option>
			<option value="type7">기타창고</option>
			<option value="type8">자동차감창고</option>
			<option value="type9">외주출곤창고</option>
		</select>
		
		<button name="WH_code_btn" id="WH_code_btn">창고코드</button>
		<input type="text" name="WH_type" id="WH_type">
		
		<button name="WH_name_btn" id="WH_name_btn">창고명</button>
		<input type="text" name="WH_name" id="WH_name">
		 -->

		<table>
		
		<tr>
			<td id="td1">창고구분
				<select id="warehouse_type" name="warehouse_type"style="text-align: center;">
					<option value="">--</option>
					<option value="제품창고">제품창고</option>
					<option value="반제품창고">반제품창고</option>
					<option value="자재창고">자재창고</option>
					<option value="일반창고">일반창고</option>
					<option value="설비창고">설비창고</option>
					<option value="금형창고">금형창고</option>
					<option value="기타창고">기타창고</option>
					<option value="금형창고">자동차감창고</option>
					<option value="외주출곤창고">외주출곤창고</option>
				</select>
			</td >
			<td id="td2">창고코드
				<input type="text" name="warehouse_code" id="warehouse_code">
			</td>
			<td id="td3">창고명
				<input type="text" name="warehouse_name" id="warehouse_name">
			</td>
			<td id="td4">
				<input type="submit" name="searchBtn" id="searchBtn" value="조회">
			</td>
			
		</tr>
		</table>
		
		<!-- <input type="hidden" name="warehouse_type" id="warehouse_type">
		<input type="hidden" name="warehouse_code" id="warehouse_code">
		<input type="hidden" name="warehouse_name" id="warehouse_name"> -->
		
		<br/>
		<input type="button" name="addRowBtn" id="addRowBtn" value="+">
		<div style="margin-top:30px;">창고</div>
		<div id="grid"></div>
		
	
	<%-- <input type="hidden" id="warehouse_code" value="${warehouse_code}"> --%>
	
	
<hr>
		<div style="display: flex; margin:10px;">구역(Area)<input type="button"  name="addRowBtn2" id="addRowBtn2" value="+" ></div>
		
		
		<div id="areaGrid"></div>

<script>

</script> 




	</form>

</body>
</html>