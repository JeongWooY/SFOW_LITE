<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/so/returnMainChild.css">
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var contextPath = '<%= request.getContextPath() %>';
	
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
        scrollX: false,
        scrollY: false,
	    rowHeaders: ['rowNum'],
	    columns: [
	        { header: '거래처코드', name: 'client_code', sortable: true, align: 'center' },
	        { header: '거래처명', name: 'client_name', sortable: true, align: 'center' }
	    ]
	});
	
	// 서버에서 데이터를 가져와서 그리드에 데이터를 설정합니다.
	function loadGridData() {
	    $.ajax({
	        url: contextPath + '/so/getClient', // 실제 데이터를 가져올 URL을 입력해주세요.
	        method: 'GET',
	        dataType : "JSON",
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

	
	grid.on('dblclick', function(ev) {
	    if (ev.targetType === 'cell') {
	        $('#confirmBtn').click();
	    }
	});
	
});
</script>
</head>
<body>
<h3>거래처 선택</h3>
    <div id="grid"></div>
    <div class="grid_btn">
    <button id="confirmBtn" class="custom-button"><i class="fa fa-save fa-fw"></i> 확인</button>
    <button id="cancelBtn" class="custom-button"><i class="fa fa-undo fa-fw"></i>취소</button>
    </div>
</body>
</html>