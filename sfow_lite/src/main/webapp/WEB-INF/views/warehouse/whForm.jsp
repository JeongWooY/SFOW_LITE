<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script><!-- include jQuery -->
   <title>창고등록</title>
   
   <!-- <script src="https://code.jquery.com/jquery-1.11.3.js"></script> -->
      
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
<!-- <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/> -->

<style type="text/css">

div#grid{
 margin-top: 15px; 
}

/* button{
 width: 100px;
 
} */
input#addRowBtn{
	width: 25px;
	height: 25px;
	background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
}
input#deleteRow{
	width: 25px;
	height: 25px;
	background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
}
input#addRowBtn2{
	width: 25px;
	height: 25px;
	background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
}
input#deleteRow2{
	width: 25px;
	height: 25px;
	background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
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
/* #saveBtn:hover, #saveBtn2:hover, #search:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
  background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
} */
#delBtn:hover, #deleteRowBtn2:hover, #reset:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
  background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
}



</style>
 
</head>
<script src="<%=request.getContextPath()%>/resources/js/warehouse/wh_main.js"></script>
<!-- <script src="${conPath}/resources/js/warehouse/wh_main.js"></script> -->

<body>
	<h3>창고등록</h3>
<hr>
	
	<form name="whFrm" id="whFrm">
		
		<div class="whbox1">
	<!-- 	<input type="button" name="serchBtn" id="serchBtn" value="조회"> -->
		</div>
	<table>
		
		<tr>
			<td id="td1">창고구분
				<select id="warehouse_typeS" name="warehouse_typeS" style="text-align: center;">
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
				<input type="text" name="warehouse_codeS" id="warehouse_codeS">
			</td>
			<td id="td3">창고명
				<input type="text" name="warehouse_nameS" id="warehouse_nameS">
			</td>
			<td id="td4">
				<input type="button" name="searchBtn" id="searchBtn" value="조회">
				<input type="button" name="saveBtn" id="saveBtn" value="저장">
				<input type="button" name="delBtn" id="delBtn" value="삭제">
				<input type="button" name="clearBtn" id="clearBtn" value="초기화" onClick="window.location.reload()">
			</td>
		</tr>
		</table>
		
		<!-- <input type="hidden" name="warehouse_type" id="warehouse_type">
		<input type="hidden" name="warehouse_code" id="warehouse_code">
		<input type="hidden" name="warehouse_name" id="warehouse_name"> -->
		
		<br/>
		
		<div style="margin-top:30px;display: flex;">창고
		<input type="button" name="addRowBtn" id="addRowBtn" value="+">
		<input type="button" name="deleteRow" id="deleteRow" value="-">
		</div>
		<div id="grid"></div>
		
	
	<hr>
		<div style="display: flex; margin:10px;">구역(Area)
		<input type="button"  name="addRowBtn2" id="addRowBtn2" value="+" >
		<input type="button" name="deleteRow2" id="deleteRow2" value="-">
		</div>
		
		
		<div id="areaGrid"></div>

<script>

</script> 




	</form>

</body>
</html>