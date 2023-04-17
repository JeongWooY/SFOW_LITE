<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목등록(제품)</title>
<script src="<%=request.getContextPath()%>/resources/js/main/itemProduct.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</head>
<body>
<form>
&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black; font-weight:bolder;" id="searchBtn"><i class="fas fa-search"></i>&nbsp;조회</button>&nbsp;
<button type="button" id="insertRow" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><i class="fas fa-arrow-down"></i>&nbsp;저장</button>
&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" id="deleteRow"><i class="fas fa-trash"></i>&nbsp;삭제</button>&nbsp;
<button type="reset" id="resetBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><i class="fas fa-power-off"></i>&nbsp;초기화</button>
<br><br>
<div id="search_area" style="display:inline-block; margin-left:6px; font-size:13px; color:black;">
    <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="ITEM코드" disabled/><input type="text" class="form-data" id ="item_code" name="item_code" placeholder="&nbsp;&nbsp;자동완성" disabled/></div>  
    <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품명" disabled/><input type="text" class="form-data" id ="item_name" name="item_name"/></div>  
    <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목코드" disabled/><input type="text" class="form-data" id ="item_no" name="item_no"/></div>  
<div class="search_tp" style="display:inline-block; margin-left:6px; font-size:13px; color:black;">
  <input type="text" class="form-title" value="유형" disabled/>
  <span style="position: relative;" class="btnFas" id="btnFas">
    <input type="text" class="btn-open-popup" id="item_type" name="item_type" style="background-color: rgb(230, 242, 255);"/>
    <i class='fas fa-search' style="position: absolute; transform: translateY(-50%);"></i>
  </span>
</div>
</div>
</form>
<br/>
<hr/>
<div style="display:flex; justify-content:space-between; align-items:center;">
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;품목등록(제품)</h6>
<div style="display:flex; justify-content:flex-end; align-items:center;">
<button type="button" style="height:25px; width:25px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" id="addRow"><i class="fas fa-plus"></i></button>&nbsp;
<button type="button" style="height:25px; width:25px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" id="minusRow"><i class="fas fa-minus"></i></button>&nbsp;
</div>
</div>
<div id="grid"></div>
<div class="modal">
<div id="modal_search">
    <input type="text" id="keyword" name="keyword" value="" style="border: 1px solid #8c8c8c;">
	<button type="submit" id="mdshBtn" style="color:white;">조회</button>
</div>
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
    <button type="button" id="applyBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;적용</button>
    <button type="reset" id="resetMdBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;초기화</button>
    <button type="button" id="closeBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;닫기</button>
  </div>
</div>
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
.btn-open-popup{
width : 200px;
height: 30px;
background-color: rgb(230, 242, 255);
text-align:left;
line-height : 30px;
border-radius:3px;
border:1px solid #e2e2e2;
display:inline-block;
}
.search_tp .form-title{
border-radius:3px;
line-height : 30px;
}
.search_tp input[type="text"] {
border: none;
outline: none;
border-radius:3px;
border:1px solid #e2e2e2;
line-height : 30px;
height: 30px;
}
.search_tp input[type="text"]#lens_sh {
margin-left:-0.5px;
}
.search_tp input[type="text"].btn-open-popup {
padding-left: 30px;
cursor: text;
margin-left:-3.5px;
margin-right:5px;
}
.search_tp input[type="text"].btn-open-popup:focus {
outline: none;
}
.search_tp i.fa-search {
position: absolute;
left: 5px;
top: 50%;
transform: translateY(-50%);
z-index: 1;
}
#addRow .fas fa-plus {
float: right;
}
.modal{
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  display: none;
  background-color: rgba(0, 0, 0, 0.4);
  justify-content:center;
  align-items:center;
}
.modal.show {
  display: block;
}
#modalGrid{
	  position: fixed;
	  top: 50%; /* 모달이 수직 중앙에 위치하도록 top 값을 50%로 지정 */
  	  left: 50%;
	  width: 500px;
	  height: 500px;
	  padding: 40px;
	  justify-content:center;
  	  align-items:center;
	  text-align: center;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
}
#modal_search{
  position: fixed;
  top: 31%; 
  left: 47%;
  z-index: 1;
}
#keyword{
    flex: 1;
    margin: 0;
    padding: 0;
    border-radius: 4px;
}
button {
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
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
#applyBtn:hover {
  background-color: rgba(051, 102, 204, 1);
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
#resetMdBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
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
#closeBtn:hover {
  background-color: rgba(153, 102, 000, 1);
  opacity: 0.8;
}
#mdshBtn {
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
input::placeholder {
color: grey;
font-style: italic;
font-size:5px;
}
#mdshBtn:hover {
 background-color: rgba(102, 102, 102, 1);
  opacity: 0.8;
}
</style>
</html>