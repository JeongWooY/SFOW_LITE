<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>규격</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/main/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
window.onload = function(){
	
	const Grid = tui.Grid;
	const grid = new Grid({
		
		el: document.getElementById('grid'),
        scrollX: true,
        scrollY: true,
        
        rowHeaders: [
          { type: 'rowNum', align: 'center'},
    	  { type: 'checkbox' }
        ],
        columns: [
          {
            header: '거래처코드',
            name: 'client_code',
            align: 'center',
            editor:'text'
          },
          {
              header: '거래처명',
              name: 'client_name',
              align: 'center',
              editor:'text'
            }
        ]
      });
	
	 $.ajax({
	        url : './companycodeSelectAjax',
	        method :'GET',
	        dataType : 'JSON',
	        success : function(result){
	            grid.resetData(result);
	             } //success끝 
	          }); //ajax(/item/typeAjax)끝
   	
          grid.on('click', function(ev) {
				
			const rowKey = ev.rowKey;
          	const columnName = ev.columnName;
          	const rowData = grid.getRow(rowKey);
          	
          	$('input[name=item_specification]').attr('value',rowData.item_specification);
			});
			
			 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
	           	 el.addEventListener('click', ev => {
	           		 
	           var item_specification = $("#search_area input[name='item_specification']").val();
	           		           
	           console.log('item_specification:', item_specification);
	           
	           $.ajax({
	       		type: 'POST',
	       		dataType: 'JSON',
	       		url: './specificationSearchAjax',
	       		contentType: 'application/json',
	       	    data: JSON.stringify({	
	       	    	"item_specification": item_specification
	       	        }),
	       		success: function(data) {
	       			 gridData=data
	       	         grid.resetData(data)      
	               	},
	               error: function(error) {
	                   console.log('Error:', error);
	               	}
	           		});	         
	           	 });
	           });	
			 
			 Array.prototype.forEach.call(document.querySelectorAll('#resetBtn'), el => {   
	           	 el.addEventListener('click', ev => {
			          grid.clear();
			    		});
			    	});
			 Array.prototype.forEach.call(document.querySelectorAll('#closeBtn'), el => {   
	           	 el.addEventListener('click', ev => {
			          self.close();
			    		});
			    	});

	
};


</script>
<body>
<div>
<br>

<div id="search_area">
    <input type="text" id="item_specification" name="item_specification" value="">
	<button type="submit" id="searchBtn">조회</button>
</div>
<br/>
<div id="grid"></div>
</div>
<button id="closeBtn">닫기</button>
<button id='resetBtn'>초기화</button>
<button id="saveBtn">적용</button>
<script>
</script>
</body>
</html>