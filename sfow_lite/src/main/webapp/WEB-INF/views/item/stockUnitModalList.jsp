<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>ItemModalList</title>

   <link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
   <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script type="text/javascript">
   
   $(document).ready(function(){

      var contextPath = '<%= request.getContextPath() %>';
      
      const grid = new tui.Grid({
          el: document.getElementById('grid'),
          columns: [
              { header: '재고단위', name: 'itemStockUnit' },
          ]
      });
      
      // 서버에서 데이터를 가져와서 그리드에 데이터를 설정합니다.
      function loadGridData() {
          $.ajax({
              url:contextPath + '/raw/getModalStockUnit', // 실제 데이터를 가져올 URL을 입력해주세요.
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
      
   });
   </script>
</head>
<body>
    <div id="grid"></div>
    <button id="confirmBtn">확인</button>
</body>
</html>