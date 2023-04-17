<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" >
<style>
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
<script type="text/javascript">
$(document).ready(function(){
	
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    bodyHeight:400,
        scrollX: true, //스크롤 가로 false시 고정
        scrollY: true, //스크롤 세로
	    columns: [
	        { header: '발주상세보기번호', 
	        	align:'center',
	        	name: 'mrequest_order' },
	       	{ header: 'ITEM코드', 
	        	align:'center',
	        	name: 'mitem_code' },
        	{ header: '요청수량', 
	        	align:'center',
	        	name: 'mrequest_quantity' },
	       	{ header: '단가', 
	        	align:'center',
	        	name: 'mprice' },
        	{ header: '공급가액', 
	        	align:'center',
	        	name: 'mamount' },
	       	{ header: '부가세포함가', 
	        	align:'center',
	        	name: 'mtax_amount' },
	       	{ header: '비고', 
	        	align:'center',
	        	name: 'detailmemo' }
									        	
	    ]
	});
	
	// 서버에서 데이터를 가져와서 그리드에 데이터를 설정합니다.
	function loadGridDataPR() {
	    $.ajax({
	        url:'${conPath}/reqDetailM', // 실제 데이터를 가져올 URL을 입력해주세요.
	        method: 'GET',
	        dataType : "JSON",
	        success: function(result) {
	        	console.log("resultdetail"+JSON.stringify(result));
	        	grid.resetData(result);
	        },
	        error: function(xhr, status, errorThrown) {
	            console.log('Error occurred:', status, errorThrown);
	            alert('에러');
	        }
	    });
	}
	
	loadGridDataPR();
	
	$('#confirmBtn').on('click', function() {
	    const selectedRow = grid.getRow(grid.getFocusedCell()["rowKey"]);
	    selectedRow.type = "ModalDetail";
	    window.opener.postMessage(selectedRow, '*');
	    console.log("testdetail"+JSON.stringify(selectedRow));
	 
	   window.close();
	});
	
});
</script>
</head>
<body>
    <div id="grid"></div>
    <button id="confirmBtn">확인</button>
</body>
</html>