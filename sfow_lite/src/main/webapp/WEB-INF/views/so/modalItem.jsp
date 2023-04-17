<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ItemModal</title>
	
	<style type="text/css">
	body {
        background-color: #f1f1f1;
        font-family: Arial, sans-serif;
    }
    #grid {
        background-color: white;
        margin: 20px;
        border: 1px solid #ccc;
    }
    .tui-grid-cell-content {
        color: #333;
    }
    .tui-grid-border-line-top,
    .tui-grid-border-line-bottom,
    .tui-grid-border-line-left,
    .tui-grid-border-line-right {
        border-color: #999;
    }
    .tui-grid-cell-header {
        background-color: #007bff;
        color: white;
    }
   
    #confirmBtn{
      background-color: #4e73df;
      color: white;
      padding: 10px 20px;
      text-align: center;
      display: inline-block;
      font-size: 12px;
      margin: 10px 2px;
      margin-right:5px;
      cursor: pointer;

    }
   
    #cancelBtn{
      background-color: #e03221;
      color: white;
      padding: 10px 20px;
      text-align: center;
      display: inline-block;
      font-size: 12px;
      margin: 10px 2px;
      cursor: pointer;
      margin-right:5px;
    }
   
    .button-container {
        text-align: center;
    }
	</style>

	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){

		
		
		const grid = new tui.Grid({
		    el: document.getElementById('grid'),
		    rowHeaders: ['rowNum'],
		    columns: [
		        { header: '수주번호', name: 'orderNumber', align:"center"},
		        { header: '거래처코드', name: 'clientCode', align:"center"},
		        { header: '회사코드', name: 'companyCode', align:"center" }
		    ]
		});
		
		// 서버에서 데이터를 가져와서 그리드에 데이터를 설정합니다.
		function loadGridData() {
		    $.ajax({
		        url:'${conPath}/shipout/getModalItem', // 실제 데이터를 가져올 URL을 입력해주세요.
		        method: 'GET',
		        dataType : 'JSON',
		        success: function(result) {
		        	console.dir(result);
		        	grid.resetData(result);
		        },
		        error: function(xhr, status, errorThrown) {
		            console.log('Error occurred:', status, errorThrown);
		            alert('에러');
		        }
		    });
		}
		
		loadGridData();
		
		$('#confirmBtn').on('click', function() {
		    const selectedRow = grid.getRow(grid.getFocusedCell().rowKey);
		    window.opener.postMessage(selectedRow, '*');
		    window.close();
		});
		
		$('#cancelBtn').on('click', function() {
		       window.close();
		   });
		
	});
	</script>
</head>
<body>
    <div id="grid"></div>
    <button id="confirmBtn">확인</button>
    <button id="cancelBtn">취소</button>
    
</body>
</html>