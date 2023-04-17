$(document).ready(window.onload=function() {

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
          { header: '회사코드	', name: 'company_code', hidden:true },		
          {  header: 'ITEM코드', name: 'item_code', align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          {  header: '품명', name: 'item_name', align: 'center', editor: 'text', align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true }, validation:{required: true}},
          {  header: '품번', name: 'item_no', editor: 'text', align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true }, validation:{required: true}},
          {  header: '유형', name: 'item_type',
            
        	  onBeforeChange(tp) {
        	  
            	openModal();
            	
            	function openModal(){
            		
            	  var body = document.querySelector('body');
            	  var modal = document.querySelector('.modal');
            	  //modalGrid 초기화
            	  var modalGrid = document.getElementById("modalGrid");
            	  modalGrid.innerHTML = "";
            	  const keyword = document.getElementById("keyword");
            	  keyword.value="";
            	  var applyBtn = document.createElement("button");
            	  applyBtn.setAttribute("type", "button");
            	  applyBtn.setAttribute("id", "applyBtn");
            	  applyBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  applyBtn.innerText = "적용";
            	  modalGrid.appendChild(applyBtn);
            	  var resetMdBtn = document.createElement("button");
            	  resetMdBtn.setAttribute("type", "reset");
            	  resetMdBtn.setAttribute("id", "resetMdBtn");
            	  resetMdBtn.setAttribute("style","height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  resetMdBtn.innerText = "초기화";
            	  modalGrid.appendChild(resetMdBtn);
            	  var closeBtn = document.createElement("button");
            	  closeBtn.setAttribute("type", "button");
            	  closeBtn.setAttribute("id", "closeBtn");
            	  closeBtn.setAttribute("style","height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  closeBtn.innerText = "닫기";
            	  modalGrid.appendChild(closeBtn);
            	  
            	  modal.classList.toggle('show');
            	 
    			const Grid = tui.Grid;
    			const grid2 = new Grid({
    				
    		  	el: document.getElementById('modalGrid'),
    		  	scrollX: false,
    		  	scrollY: false,
    		  	autoWidth: true,
    		  	rowHeaders: [{ type: 'rowNum', align: 'center'},{ type: 'checkbox' }],
    		    columns: [ { header: '회사코드	', name: 'company_code', hidden:true },	{ header: '유형', name: 'item_type', align: 'center', editor:'text'}]});       		
    			
    		$.ajax({
    			url : './item/typeSelectAjax',
    	        method :'GET',
    	        dataType : 'JSON',
    		  	  success: function(result) {
    		  		console.log('result', result);
    		  	  	grid2.resetData(result)
    		  	  },
    		    error: function(xhr, status, error) {
    		      console.log(error);
    		    }
    		  });
    				grid2.on('check', function(ev) {
    					
    			    const rowKey = ev.rowKey;
    			    const columnName = ev.columnName;
    			    const rowData = grid2.getRow(rowKey);
    			    const item_type = rowData.item_type;
    			    
    			   Array.prototype.forEach.call(document.querySelectorAll('#applyBtn'), el => {
    				      el.addEventListener('click', ev => {
    				    	  console.log('item_type!', item_type);
    				    	  	grid.setValue(tp.rowKey,tp.columnName,item_type)
    	    			    	modal.classList.remove('show');
    	    			    	body.style.overflow = 'auto';
    						});
    					});
    				}); 
    			  Array.prototype.forEach.call(document.querySelectorAll('#closeBtn'), el => {
  				      el.addEventListener('click', ev => {
  				    	  modal.classList.remove('show');
  				    	  body.style.overflow = 'auto';
  				      });
    			  });
    			  		//검색
    					 Array.prototype.forEach.call(document.querySelectorAll('#mdshBtn'), el => {   
    			           	 el.addEventListener('click', ev => {
    			           var item_type = $("#modal_search input[name='keyword']").val();
    			           console.log('item_type:', item_type);
    			           $.ajax({
    			       		type: 'POST',
    			       		dataType: 'JSON',
    			       		url: './item/typeSelectSearchAjax',
    			       		contentType: 'application/json',
    			       	    data: JSON.stringify({	
    			       	    	"item_type": item_type
    			       	        }),
    			       		success: function(data) {
    			       			 //gridData=data
    			       	         grid2.resetData(data)      
    			               	},
    			               error: function(error) {
    			                   console.log('Error:', error);
    			               	}
    			           });	         
    			           	 });
    			           });		
            		}//openModal끝
                },
            editor: 'text', align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          { header: '규격', name: 'item_specification',
            onBeforeChange(sp) {
        	  
            	openModal();
            	
            	function openModal(){
            		
            	  var body = document.querySelector('body');
            	  var modal = document.querySelector('.modal');
            	  //modalGrid 초기화
            	  var modalGrid = document.getElementById("modalGrid");
            	  modalGrid.innerHTML = "";
            	  const keyword = document.getElementById("keyword");
            	  keyword.value="";
            	  var applyBtn = document.createElement("button");
            	  applyBtn.setAttribute("type", "button");
            	  applyBtn.setAttribute("id", "applyBtn");
            	  applyBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  applyBtn.innerText = "적용";
            	  modalGrid.appendChild(applyBtn);
            	  var resetMdBtn = document.createElement("button");
            	  resetMdBtn.setAttribute("type", "reset");
            	  resetMdBtn.setAttribute("id", "resetMdBtn");
            	  resetMdBtn.setAttribute("style","height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  resetMdBtn.innerText = "초기화";
            	  modalGrid.appendChild(resetMdBtn);
            	  var closeBtn = document.createElement("button");
            	  closeBtn.setAttribute("type", "button");
            	  closeBtn.setAttribute("id", "closeBtn");
            	  closeBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  closeBtn.innerText = "닫기";
            	  modalGrid.appendChild(closeBtn);
            	  
            	  modal.classList.toggle('show');
            	 
    			const Grid = tui.Grid;
    			const grid2 = new Grid({
    				
    		  	el: document.getElementById('modalGrid'),
    		  	scrollX: false,
    		  	scrollY: false,
    		  	autoWidth: true,
    		  	rowHeaders: [{ type: 'rowNum', align: 'center'},{ type: 'checkbox' }],
    		    columns: [ { header: '회사코드	', name: 'company_code', hidden:true },	{ header: '규격', name: 'item_specification', align: 'center', editor:'text'}]});       		  	
    		$.ajax({
    			url : './item/specificationListAjax',
    	        method :'GET',
    	        dataType : 'JSON',
    		  	  success: function(result) {
    		  		console.log('result', result);
    		  	  		grid2.resetData(result)
    		  	  },
    		    error: function(xhr, status, error) {
    		      console.log(error);
    		    }
    		  });
    				grid2.on('check', function(ev) {
    					
    			    const rowKey = ev.rowKey;
    			    const columnName = ev.columnName;
    			    const rowData = grid2.getRow(rowKey);
    			    const item_specification = rowData.item_specification;
    			    
    			   Array.prototype.forEach.call(document.querySelectorAll('#applyBtn'), el => {
    				      el.addEventListener('click', ev => {
    				    	  console.log('item_specification!', item_specification);
    				    	  	grid.setValue(sp.rowKey,sp.columnName,item_specification)
    	    			    	body.style.overflow = 'auto';
    						});
    					});
    				}); 
    			  Array.prototype.forEach.call(document.querySelectorAll('#closeBtn'), el => {
  				      el.addEventListener('click', ev => {
  				    	  modal.classList.remove('show');
  				    	  body.style.overflow = 'auto';
  				      });
    			  });
    			  Array.prototype.forEach.call(document.querySelectorAll('#resetMdBtn'), el => {
    				  el.addEventListener('click', ev => {
    					  grid2.uncheckAll();
    					  $("#modal_search input[name='keyword']").innerHTML = "";
    				  });
    			  });
    			  		//검색
    					 Array.prototype.forEach.call(document.querySelectorAll('#mdshBtn'), el => {   
    			           	 el.addEventListener('click', ev => {
    			           var item_specification = $("#modal_search input[name='keyword']").val();
    			           console.log('item_specification:', item_specification);
    			           $.ajax({
    			       		type: 'POST',
    			       		dataType: 'JSON',
    			       		url: './item/specificationSearchAjax',
    			       		contentType: 'application/json',
    			       	    data: JSON.stringify({	
    			       	    	"item_specification": item_specification
    			       	        }),
    			       		success: function(data) {
    			       			 //gridData=data
    			       	         grid2.resetData(data)      
    			               	},
    			               error: function(error) {
    			                   console.log('Error:', error);
    			               	}
    			           });	         
    			           	 });
    			           });	
            	  
            	}//openModal끝
            },
            editor: 'text', align: 'center',
            filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          { header: '재고단위', name: 'item_stock_unit',
            onBeforeChange(su) {
        	  
            	openModal();
            	
            	function openModal(){
            	  var body = document.querySelector('body');
            	  var modal = document.querySelector('.modal');
            	  //modalGrid 초기화
            	  var modalGrid = document.getElementById("modalGrid");
            	  modalGrid.innerHTML = "";
            	  const keyword = document.getElementById("keyword");
            	  keyword.value="";
            	  var applyBtn = document.createElement("button");
            	  applyBtn.setAttribute("type", "button");
            	  applyBtn.setAttribute("id", "applyBtn");
            	  applyBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  applyBtn.innerText = "적용";
            	  modalGrid.appendChild(applyBtn);
            	  var resetMdBtn = document.createElement("button");
            	  resetMdBtn.setAttribute("type", "reset");
            	  resetMdBtn.setAttribute("id", "resetMdBtn");
            	  resetMdBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  resetMdBtn.innerText = "초기화";
            	  modalGrid.appendChild(resetMdBtn);
            	  var closeBtn = document.createElement("button");
            	  closeBtn.setAttribute("type", "button");
            	  closeBtn.setAttribute("id", "closeBtn");
            	  closeBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
            	  closeBtn.innerText = "닫기";
            	  modalGrid.appendChild(closeBtn);
            	  
            	  console.log('su', su.value)
            	  modal.classList.toggle('show');
            	 
    			const Grid = tui.Grid;
    			const grid2 = new Grid({
    				
    		  	el: document.getElementById('modalGrid'),
    		  	scrollX: false,
    		  	scrollY: false,
    		  	autoWidth: true,
    		  	rowHeaders: [{ type: 'rowNum', align: 'center'},{ type: 'checkbox' }],
    		        columns: [ { header: '회사코드	', name: 'company_code', hidden:true },	{ header: '재고단위', name: 'item_stock_unit', align: 'center', editor:'text' }]});
    		$.ajax({
    			url : './item/stockunitListAjax',
    	        method :'GET',
    	        dataType : 'JSON',
    		  	  success: function(result) {
    		  		console.log('result', result);
    		  	  		grid2.resetData(result)
    		  	  },
    		    error: function(xhr, status, error) {
    		      console.log(error);
    		    }
    		  });
    				grid2.on('check', function(ev) {

    				const rowKey = ev.rowKey;
    			    const columnName = ev.columnName;
    			    const rowData = grid2.getRow(rowKey);
    			    const item_stock_unit = rowData.item_stock_unit;
    			    console.log('item_stock_unit!', item_stock_unit);
    			    
    			   Array.prototype.forEach.call(document.querySelectorAll('#applyBtn'), el => {
    				      el.addEventListener('click', ev => {
    				    	  console.log('item_stock_unit!', item_stock_unit);
    				    	  	grid.setValue(su.rowKey,su.columnName,item_stock_unit)
    				    	  	modal.classList.remove('show');
    				    	  	body.style.overflow = 'auto';
    						});
    					});
    				}); 
    			  Array.prototype.forEach.call(document.querySelectorAll('#closeBtn'), el => {
  				      el.addEventListener('click', ev => {
  				    	  modal.classList.remove('show');
  				    	  body.style.overflow = 'auto';
  				      });
    			  });
    			  Array.prototype.forEach.call(document.querySelectorAll('#resetMdBtn'), el => {
    				  el.addEventListener('click', ev => {
    					  grid2.uncheckAll();
    					  $("#modal_search input[name='keyword']").innerHTML = "";
    				  });
    			  });
    			  		//검색
    					 Array.prototype.forEach.call(document.querySelectorAll('#mdshBtn'), el => {   
    			           	 el.addEventListener('click', ev => {
    			           		 
    			           var item_stock_unit = $("#modal_search input[name='keyword']").val();
    			           		           
    			           console.log('item_stock_unit:', item_stock_unit);
    			           
    			           $.ajax({
    			       		type: 'POST',
    			       		dataType: 'JSON',
    			       		url: './item/stockunitSearchAjax',
    			       		contentType: 'application/json',
    			       	    data: JSON.stringify({	
    			       	    	"item_stock_unit": item_stock_unit
    			       	        }),
    			       		success: function(data) {
    			       	         grid2.resetData(data)      
    			               	},
    			               error: function(error) {
    			                   console.log('Error:', error);
    			               	}
    			           });	         
    			           	 });
    			           });	
            	}//openModal끝
            },
            editor: 'text',align: 'center',filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          { header: 'lot_Size', name: 'lotsize', editor: 'text',align: 'center',filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          { header: '비고', name: 'memo', editor: 'text', align: 'center' },
          { header: '사용여부', name: 'useyn', formatter: 'listItemText', editor: { type: 'select', options: { listItems: [{ text: 'Y', value: 'Y' },{ text: 'N', value: 'N' } ]},validation:{required: true}},
            align: 'center', filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          { header: '등록일시', name: 'createdate', align: 'center',filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
          { header: '수정일시', name: 'updatedate', align: 'center',filter: { type: 'text', showApplyBtn: true, showClearBtn: true },},
        ]       
      });
    
 //행추가   
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
        url : './item/productListAjax',
        method :'GET',
        dataType : 'JSON',
        contentType : 'application/json',
        success : function(result){
        	console.log('result', result);
            grid.resetData(result);
            
        } //success끝 
    }); //ajax(/item/productListAjax)끝
     
    grid.on('check', function(ev) {	
	      
	    const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
    	var updatedData = {};
			console.log('check!', ev);
			console.log('item_code!', rowData.item_code);
			
    Array.prototype.forEach.call(document.querySelectorAll('#insertRow'), el => {
	      el.addEventListener('click', ev => {
	    	  if(!rowData.item_code){
		    		 $.ajax({
	                 url: './item/productInsertAjax', //입력
	                 method :'POST',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                     location.href="javascript:acyncMovePage('./item/productList');"
	                 	},
	                 error: function(error) {
	                     console.log('Error:', error);
	                     location.href="javascript:acyncMovePage('./item/productList');"
	                 	}
	             }); //ajax(/item/typeInsertAjax)끝
	    	  }else{
			    	$.ajax({
		                url: './item/productUpdateAjax', //수정
		                method :'PUT',
		                dataType: 'JSON',
		                data: JSON.stringify(rowData),
		                contentType: 'application/json',
		                success: function(response) {
		                    console.log('Success:', response);
		                    location.href="javascript:acyncMovePage('./item/productList');"
		                },
		                error: function(error) {
		                    console.log('Error:', error);
		                    location.href="javascript:acyncMovePage('./item/productList');"
		                }
		            }); //ajax(/item/productUpdateAjax)끝
	    	  }//else끝	 
          }); //addEventListener끝
    	}); //insertRow 끝
    Array.prototype.forEach.call(document.querySelectorAll('#deleteRow'), el => {
	      el.addEventListener('click', ev => {
				$.ajax({
               url: './item/productDeleteAjax', //삭제(수정)
               method :'PUT',
               dataType: 'JSON',
               data: JSON.stringify(rowData),
               contentType: 'application/json',
               success: function(response) {
                   console.log('Success:', response);
                   location.href="javascript:acyncMovePage('./item/productList');"
               	},
               error: function(error) {
                   console.log('Error:', error);
                   location.href="javascript:acyncMovePage('./item/productList');"
               	}
           }); //ajax(/item/productDeleteAjax)끝
        }); //addEventListener끝
  	}); //deleteRow 끝
}); //grid.on('check')끝 

	grid.on('click', function(ev) {
		
		const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
    	
    	$('input[name=item_code]').attr('value',rowData.item_code);
    	$('input[name=item_name]').attr('value',rowData.item_name);
    	$('input[name=item_no]').attr('value',rowData.item_no);
    	$('input[name=item_type]').attr('value',rowData.item_type);
	});
	
	 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
       	 el.addEventListener('click', ev => {
       		 
       var item_code = $("#search_area input[name='item_code']").val();
       var item_name = $("#search_area input[name='item_name']").val();
       var item_no = $("#search_area input[name='item_no']").val();
       var item_type = $("#search_area input[name='item_type']").val();
       var company_code = 1234567890;
       		           
       console.log('item_type', item_type);
       console.log('item_name', item_name);
       console.log('item_code', item_code);
       console.log('item_no', item_no);
       console.log('company_code', company_code);
       
       $.ajax({
   		type: 'POST',
   		dataType: 'JSON',
   		url: './item/productSearchAjax',
   		contentType: 'application/json',
   	    data: JSON.stringify({	
   	    	"item_type": item_type,
   	    	"item_name": item_name,
   	    	"item_code": item_code,
   	    	"item_no": item_no,
   	    	"company_code": company_code
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
				$('input[name=item_code]').attr('value',null);
		    	$('input[name=item_name]').attr('value',null);
		    	$('input[name=item_no]').attr('value',null);
		    	$('input[name=item_type]').attr('value',null);
		    	 $.ajax({
		    	        url : './item/productListAjax',
		    	        method :'GET',
		    	        dataType : 'JSON',
		    	        contentType : 'application/json',
		    	        success : function(result){
		    	        	console.log('result', result);
		    	            grid.resetData(result);
		    	            
		    	        } //success끝 
		    	    }); //ajax(/item/productListAjax)끝
		  });
	  });
	 //유형검색시 모달
	 Array.prototype.forEach.call(document.querySelectorAll('#btnFas'), el => {   
       	 el.addEventListener('dblclick', ev => {
       		 
       	  var body = document.querySelector('body');
    	  var modal = document.querySelector('.modal');
    	  //modalGrid 초기화
    	  var modalGrid = document.getElementById("modalGrid");
    	  modalGrid.innerHTML = "";
    	  const keyword = document.getElementById("keyword");
    	  keyword.value="";
    	  var applyBtn = document.createElement("button");
    	  applyBtn.setAttribute("type", "button");
    	  applyBtn.setAttribute("id", "applyBtn");
    	  applyBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
    	  applyBtn.innerText = "적용";
    	  modalGrid.appendChild(applyBtn);
    	  var resetMdBtn = document.createElement("button");
    	  resetMdBtn.setAttribute("type", "reset");
    	  resetMdBtn.setAttribute("id", "resetMdBtn");
    	  resetMdBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
    	  resetMdBtn.innerText = "초기화";
    	  modalGrid.appendChild(resetMdBtn);
    	  var closeBtn = document.createElement("button");
    	  closeBtn.setAttribute("type", "button");
    	  closeBtn.setAttribute("id", "closeBtn");
    	  closeBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
    	  closeBtn.innerText = "닫기";
    	  modalGrid.appendChild(closeBtn);
    	  
    	  modal.classList.toggle('show');
    	  
    	  const Grid = tui.Grid;
		  const grid2 = new Grid({
				
		  	el: document.getElementById('modalGrid'),
		  	scrollX: false,
		  	scrollY: false,
		  	autoWidth: true,
		  	rowHeaders: [{ type: 'rowNum', align: 'center'},{ type: 'checkbox' }],
		    columns: [ { header: '회사코드	', name: 'company_code', hidden:true },	{ header: '유형', name: 'item_type', align: 'center', editor:'text'}]});       		
			
		$.ajax({
			url : './item/typeSelectAjax',
	        method :'GET',
	        dataType : 'JSON',
		  	  success: function(result) {
		  		console.log('result', result);
		  	  	grid2.resetData(result)
		  	  },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		
		grid2.on('check', function(ev) {
			
		    const rowKey = ev.rowKey;
		    const columnName = ev.columnName;
		    const rowData = grid2.getRow(rowKey);
		    
		   Array.prototype.forEach.call(document.querySelectorAll('#applyBtn'), el => {
			      el.addEventListener('click', ev => {
			    	  $("#btnFas input[name='item_type']").attr("value",rowData.item_type);
    			    	modal.classList.remove('show');
    			    	body.style.overflow = 'auto';
					});
				});
			}); 
		  Array.prototype.forEach.call(document.querySelectorAll('#closeBtn'), el => {
			      el.addEventListener('click', ev => {
			    	  modal.classList.remove('show');
			    	  body.style.overflow = 'auto';
			      });
		  	});
		  Array.prototype.forEach.call(document.querySelectorAll('#resetMdBtn'), el => {
			  el.addEventListener('click', ev => {
				  grid2.uncheckAll();
				  $("#modal_search input[name='keyword']").attr('value',null);
			  });
		  });
		  		//검색
				 Array.prototype.forEach.call(document.querySelectorAll('#mdshBtn'), el => {   
		           	 el.addEventListener('click', ev => {
		           var item_type = $("#modal_search input[name='keyword']").val();
		           console.log('item_type:', item_type);
		           $.ajax({
		       		type: 'POST',
		       		dataType: 'JSON',
		       		url: './item/typeSelectSearchAjax',
		       		contentType: 'application/json',
		       	    data: JSON.stringify({	
		       	    	"item_type": item_type
		       	        }),
		       		success: function(data) {
		       			 //gridData=data
		       	         grid2.resetData(data)      
		               	},
		               error: function(error) {
		                   console.log('Error:', error);
		               	}
		           });	         
		           	 });
		           });		
       	 });
	 });

  }); //window.onload끝