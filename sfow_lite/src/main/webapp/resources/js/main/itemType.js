$(document).ready(window.onload=function() {

    const Grid = tui.Grid;
    const grid = new Grid({    
		
        el: document.getElementById('grid'),
        scrollX: true,
        scrollY: true,
       
        rowHeaders: [
	       { type: 'rowNum', align: 'center'}, { type: 'checkbox' }
        ],
        columns: [
          { header: '회사코드	', name: 'company_code', hidden:true },		
          { header: '품목구분', name: 'item_category', formatter: 'listItemText', editor: {type: 'select',
        	  		options: { listItems: [{ text: '제품', value: '제품' },{ text: '반제품', value: '반제품' },{ text: '원자재', value: '원자재' }]},
            validation:{required: true},}, align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true}},
          { header: '품목유형', name: 'item_type', editor: 'text', validation:{required: true}, align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true}}
        ]       
      });
    
    Array.prototype.forEach.call(document.querySelectorAll('#addRow'), el => {
	      el.addEventListener('click', ev => {
	             
			const rowData = [{}]
			 					
			grid.appendRow(rowData, {
			at: grid.getRowCount(),
			focus: true,
			useViewMode: true,
				});
			});
			grid.enable();
		}); //addRow끝
    
    Array.prototype.forEach.call(document.querySelectorAll('#minusRow'), el => {
	      el.addEventListener('click', ev => {
	    	 grid.removeRow(grid.getRowCount()-1);
	    	 grid.refreshLayout();
	      });
		}); //minusRow끝	 
    
$.ajax({
url : './item/typeAjax',
method :'GET',
dataType : 'JSON',
success : function(result){
  grid.resetData(result);

   } //success끝 
}); //ajax(/item/typeAjax)끝


grid.on('check', function(ev) {
	const rowKey = ev.rowKey;
	const columnName = ev.columnName;
	const rowData = grid.getRow(rowKey);
		console.log('check!', ev);
		console.log('check!', rowData);
		
 Array.prototype.forEach.call(document.querySelectorAll('#deleteRow'), el => {
     el.addEventListener('click', ev => {

			$.ajax({
            url: './item/typeDeleteAjax',
            method :'DELETE',
            dataType: 'JSON',
            data: JSON.stringify(rowData),
            contentType: 'application/json',
            success: function(response) {
                console.log('Success:', response);
                location.href="javascript:acyncMovePage('./item/type');"
            	},
            error: function(error) {
                console.log('Error:', error);
                location.href="javascript:acyncMovePage('./item/type');"
            	}
        }); //ajax(/item/typeDeleteAjax)끝
     }); //addEventListener끝
	}); //deleteRow 끝
}); //grid.on('check')끝


	grid.on('check', function(ev) {	
     
    const rowKey = ev.rowKey;
	const columnName = ev.columnName;
	const rowData = grid.getRow(rowKey);
		console.log('check!', ev);
		console.log('check!', rowData);
		
Array.prototype.forEach.call(document.querySelectorAll('#insertRow'), el => {
     el.addEventListener('click', ev => {

			$.ajax({
            url: './item/typeInsertAjax',
            method :'POST',
            dataType: 'JSON',
            data: JSON.stringify(rowData),
            contentType: 'application/json',
            success: function(response) {
                console.log('Success:', response);
                location.href="javascript:acyncMovePage('./item/type');"
            	},
            error: function(error) {
                console.log('Error:', error);
                location.href="javascript:acyncMovePage('./item/type');"
            	}
        }); //ajax(/item/typeInsertAjax)끝
     }); //addEventListener끝
	}); //insertRow 끝
}); //grid.on('check')끝

	grid.on('click', function(ev) {
		
	const rowKey = ev.rowKey;
   	const columnName = ev.columnName;
   	const rowData = grid.getRow(rowKey);
   	
   	$('select[name=item_category]').prop('value',rowData.item_category);
   	$('input[name=item_type]').attr('value',rowData.item_type);
	});
	
	 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
      	 el.addEventListener('click', ev => {
      		 
      var item_category = $("#search_area select").val();
      var item_type = $("#search_area input[name='item_type']").val();
      		           
      console.log('item_category', item_category);
      console.log('item_type:', item_type);
      
      $.ajax({
  		type: 'POST',
  		dataType: 'JSON',
  		url: './item/typeSearchAjax',
  		contentType: 'application/json',
  	    data: JSON.stringify({	
  	    	"item_category": item_category,
  	    	"item_type": item_type
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
			  grid.uncheckAll();
			  $('select[name=item_category]').prop('value',null);
			  $('input[name=item_type]').attr('value',null);
			  $.ajax({
				  url : './item/typeAjax',
				  method :'GET',
				  dataType : 'JSON',
				  success : function(result){
				    grid.resetData(result);
				     } //success끝 
				  }); //ajax(/item/typeAjax)끝
		  });
	  });
  }); //window.onload끝