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
            header: '아이템코드',
            name: 'item_code',
            align: 'center',
            editor:'text'
          },
          {
              header: '품목구분',
              name: 'item_category',
              align: 'center',
              editor:'text'
            },
            {
                header: '품명',
                name: 'item_name',
                align: 'center',
                editor:'text'
              },
              {
                  header: '품번',
                  name: 'item_no',
                  align: 'center',
                  editor:'text'
                },
                {
                    header: '규격',
                    name: 'item_specification',
                    align: 'center',
                    editor:'text'
                  }
        ]
      });
	
	 $.ajax({
	        url : './itemcodeSelectAjax',
	        method :'GET',
	        dataType : 'JSON',
	        success : function(result){
	            grid.resetData(result);
	             } //success끝 
	          }); //ajax(/item/itemcodeSelectAjax)끝
          
          grid.on('check', function(ev){
        	      const rowKey1 = ev.rowKey;
        		  const columnName1 = ev.columnName;
        		  const rowData1 = grid.getRow(rowKey1);
        		  const item_specification1 = rowData1.item_specification;
        		  
        		  console.log('columnName!', columnName1);
        		  console.log('rowData!', rowData1);
        		  console.log('item_specification!', item_specification1);
        		
        	Array.prototype.forEach.call(document.querySelectorAll('#saveBtn'), el => {
        		el.addEventListener('click', ev => {
        		  console.log('item_specification!', item_specification1);
        		<%
        		    session.setAttribute("param1", "item_specification1");
        		%>
        		
          		}); //addEventListener끝
			});   //saveBtn
        		  
        }); //grid.on('check')끝    
   	
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