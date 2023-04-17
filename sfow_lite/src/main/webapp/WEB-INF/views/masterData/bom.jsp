<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<title>BOM 등록</title>
<link href="${conPath}/resources/css/masterData/bom.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div><h2 class="bom-title">BOM 등록</h2></div>
<div class="container-fluid">
	<div class="row" style="align-items: center; justify-content: center; ">
		<div class="form-div">
			<span class="form-item">ITEM코드</span><input type="text" id="form-item-code" class="form-input" readonly="readonly">
			<span class="form-item">품명</span><input type="text" id="form-item-name" class="form-input" readonly="readonly">
			<span class="form-item">품목코드</span><input type="text" id="form-item-no" class="form-input" readonly="readonly">
			<span class="form-item">품목구분</span><input type="text" id="form-item-category" class="form-input" readonly="readonly">
		</div>
	</div>
	<div class="row">
		<div class="col-md-5 item-div">
			<p class="bom-title">ITEM</p>
			<div id="grid1"></div>
		</div>
		<div class="col-md-7 right-side">
			<div class="row">
				<div class="col-md-12 bomTree-div">
					<p class="bom-title">BOM Tree</p>
					<div id="grid2"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 origin-div">
				<div>
					<span class="bom-title">원자재목록</span>
					<span class="btnGroup">
						<button id="addRowBtn"><i class="fa fa-plus" aria-hidden="true"></i></button>
						<button id="delRowBtn"><i class="fa fa-minus" aria-hidden="true"></i></button>
						<button id="saveBtn"><i class="fa fa-save"></i> 저장</button>
						<button id="delItemBtn"><i class="fa fa-trash"></i> 삭제</button>
					</span>
				</div>
				<div id="grid3"></div>
				</div>
			</div>
		</div>
	</div>
</div>
    <div class="background">
      <div class="window">
        <div class="popup">
        <div class="close-area">X</div>
			<div class="searchForm">
				<input type="text" id="searchInput" onKeypress="javascript:press(event)">
				<button id="searchBtn" onclick="searchBtn()"><i class="fa fa-search" aria-hidden="true"></i></button>
			</div>
			<div id="grid_popup"></div>
			<div class="modal-buttons">
				<button class="closeBtn">닫기</button>
				<button type="button" class="applyBtn">적용</button>
			</div>
        </div>
      </div>
    </div>
<script type="text/javascript" src="${conPath}/resources/js/masterData/bom.js"></script>
</body>
</html>