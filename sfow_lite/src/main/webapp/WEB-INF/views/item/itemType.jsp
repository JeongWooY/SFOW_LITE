<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목유형 코드등록</title>
</head>
<link rel="shortcut icon" href="#">
<script src="<%=request.getContextPath()%>/resources/js/main/itemType.js"></script>
<body>
<form id=tySearch name=tySearch>
&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black; font-weight:bolder;" id="searchBtn"><i class="fas fa-search"></i>&nbsp;조회</button>&nbsp;
<button type="button" id="insertRow" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><i class="fas fa-arrow-down"></i>&nbsp;저장</button>
&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" id="deleteRow"><i class="fas fa-trash"></i>&nbsp;삭제</button>&nbsp;
<button type="reset" id="resetBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><i class="fas fa-power-off"></i>&nbsp;초기화</button>
<br/><br/>
<div id="search_area" style="display:inline-block; margin-left:6px; font-size:13px; color:black;">
<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목구분" disabled/><select class="form-data" id="item_category" name="item_category">
    <option value="">--</option>
    <option value="제품">제품</option>
    <option value="반제품">반제품</option>
    <option value="원자재">원자재</option>
</select></div>
<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목유형" disabled/><input type="text" class="form-data" id ="item_type" name="item_type"/></div>  
</div>
</form>
<br/>
<hr/>
<div style="display:flex; justify-content:space-between; align-items:center;">
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;품목유형 코드등록</h6>
<div style="display:flex; justify-content:flex-end; align-items:center;">
<button type="button" style="height:25px; width:25px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" id="addRow"><i class="fas fa-plus"></i></button>&nbsp;
<button type="button" style="height:25px; width:25px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" id="minusRow"><i class="fas fa-minus"></i></button>&nbsp;
</div>
</div>
<div id="grid"></div>
</body>
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
line-height : 30px;
border-radius:3px;
border:1px solid #e2e2e2;
display:inline-block;
}
button {
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
}
</style>
</html>