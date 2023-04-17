window.onload = function() {
     
   var gridData=[];
   var grid = new tui.Grid({
         el: document.getElementById('grid'),
         data: gridData,
         scrollX: true,
         scrollY: true,
         
         rowHeaders: [{
             type: 'rowNum',
             header: "",
             align: 'center',
             width: 50,
         },'checkbox'],
           columns: [
        	 {
                 header: '회사코드',            // [필수] 컬럼 이름
                 name: 'company_code',                 // [필수] 컬럼 매핑 이름 값
                 hidden: true,                   // [선택] 숨김 여부
             },
            	{
                header: '창고구분',
                sortable: true, //정렬하는거 옆에 삼각형 2개생김
                // editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
                align:'center', //텍스트 가운데정렬
                name: 'warehouse_type',
                  editor: {
                 type: 'select',
                 options: {
                     listItems: [
                         {text: "제품창고", value: "제품창고"},
                         {text: "반제품창고", value: "반제품창고"},
                         {text: "자재창고", value: "자재창고"},
                         {text: "일반창고", value: "일반창고"},
                         {text: "설비창고", value: "설비창고"},
                         {text: "금형창고", value: "금형창고"},
                          {text: "기타창고", value: "기타창고"},
                         {text: "자동차감창고", value: "자동차감창고"},
                           {text: "외주출곤창고", value: "외주출곤창고"},
                         
                     ]
                 }
             },
              },
           {
             header: '창고코드',
             sortable: true,
             editor:'text',
             filter: {
                 type: 'text',
                 showApplyBtn: true,
                 showClearBtn: true
             },
             align:'center',
             name: 'warehouse_code',
           
           },
           {
             header: '창고명',
             sortable: true,
             editor:'text',
             align:'center',
             name: 'warehouse_name',
             filter: {
                 type: 'text',
                 showApplyBtn: true,
            	 showClearBtn: true
             },
           },
           {
             header: '거래처코드',
             sortable: true,
             editor:'text',
             align:'center',
             name: 'customer_code'
           },
           {
             header: '비고',
             sortable: true,
             editor:'text',
             width:100,
             align:'center',
             name: 'memo'
           },
           {
             header: '사용여부',
             sortable: true,
             editor:'text',
             align:'center',
             width:'90',
             name: 'useyn',
          //formatter: 'listItemText',     // [선택] 값을 기반으로 select box 옵션
             editor: {
                 type: 'select',
                 options: {
                     listItems: [
                         {text: "Y", value: "Y"},
                         {text: "N", value: "N"},
                     ]
                 }
             },
           },
           {
               header: '등록일',
               sortable: true,
               align:'center',
               width:'150',
               name: 'createdate'
             },
             {
               header: '등록자',
               sortable: true,
               editor:'text',
               align:'center',
               name: 'createuser'
             },
             {
                 header: '수정일시',
                 sortable: true,
                 align:'center',
                 width:'150',
                 name: 'updatedate'
               },
             {
                 header: '수정자',
                 sortable: true,
                 editor:'text',
                 align:'center',
                 name: 'updateuser'
               }
         ]

       }); //그리드 컬럼끝
   
    // 모든 목록 보여주는 ajax
    $.ajax({
      url : '../warehouse/whinfoAJ',
      method : 'GET',
      dataType : 'JSON',
      success : function(result) {
         console.dir(result);
        grid.resetData(result);
      } 
      
      
   });
        
 //행 추가
	var addRowBtn = document.getElementById('addRowBtn');
	addRowBtn.addEventListener('click', function() {
	  var newRowData = {
		warehouse_type:'',
		warehouse_code:'',
		warehouse_name:'',
		customer_code:'',
		 memo: '',
		 useyn: '',
		 createdate: '',
		 createuser:'',
		 updatedate: '',
		 updateuser:''
		 };
	  grid.appendRow(newRowData);
		 
	}); 


	var gridData2=[];
	   var grid2 = new tui.Grid({
	         el: document.getElementById('areaGrid'),
	         data: gridData2,
	         scrollX: false,
	         scrollY: false,
	         align:'center',
	         width: '500px',
	         rowHeaders: [{
	             type: 'rowNum',
	             header: "",
	             width: 50,
	         },'checkbox'],
	           columns: [
	        	 {
	        		 header: '구역코드',
		                sortable: true, //정렬하는거 옆에 삼각형 2개생김
		                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
		                align:'center', //텍스트 가운데정렬
		                width: '150',
		                name: 'area_code'              
	             },
	            	{
	                header: '구역명',
	                sortable: true, //정렬하는거 옆에 삼각형 2개생김
	                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
	                align:'center', //텍스트 가운데정렬
	                width: '150',
	                name: 'area_name'
	              }
	         ]
	       }); //area 그리드 컬럼끝
	       
	  //행 추가
		var addRowBtn2 = document.getElementById('addRowBtn2');
		addRowBtn2.addEventListener('click', function() {
		  var newRowData =[{area_code:''},{ area_name:''}];
		  grid2.appendRow(newRowData);
		});
		
		
		// 그리드1 행 누르면 구역(Area) 그리드2 데이터도 보여주기
	/*	grid.on('click', function(ev) {
		
			const rowKey = ev.rowKey;
		    const columnName = ev.columnName;
		    const area_rowData = grid2.getRow(rowKey);


				$.ajax({
                 url: '../warehouse/WHarea',
                 method :'GET',
                 dataType: 'JSON',
                 data: JSON.stringify(grid2),
                 contentType: 'application/json',
                 success: function(response) {
                     console.log('Success:', response);
                      location.href = "../warehouse/whinfo";
                 	},
                 error: function(error) {
                     console.log('Error:', error);
                     location.href = "../warehouse/whinfo";
                 	}
             }); //ajax /warehouse/AreaList 끝
        
    	}); //구역 그리드ON data보여주기 끝 
	*/ 
		
		// 그리드 내용 클릭하면 자동 체크 & 두번누르면 해제
		const checkedRows = []; // 체크된 행의 rowKey를 저장할 배열
		
		grid.on('click', function(ev) {
		    const rowKey = ev.rowKey;
		    const columnName = ev.columnName;
		    const rowData = grid.getRow(rowKey);
		
		    // 체크된 행인지 여부를 checkedRows 배열로 확인
		    const isChecked = checkedRows.includes(rowKey);
		
		    if (isChecked) {
		        // 체크된 상태에서 클릭하면 언체크
		        const index = checkedRows.indexOf(rowKey);
		        checkedRows.splice(index, 1);
		        grid.uncheck(rowKey);
		    } else {
		        // 체크되지 않은 상태에서 클릭하면 체크
		        checkedRows.push(rowKey);
		        grid.check(rowKey);
		    }
   			
             
		});
				
		
	//조회 버튼 클릭하면 특정 내용 검색(빈내용이면 전부 검색)
	$(document).ready(function(){
			
			  $('#searchBtn').click(function(event) {
				  event.preventDefault(); // prevent form submission
				  var Grid = tui.Grid;
				    // get search parameters
				    var warehouse_type = $('#warehouse_type').val();
				    var warehouse_code = $('#warehouse_code').val();
				    var warehouse_name = $('#warehouse_name').val();
				   // alert(warehouse_type);
				     
				    // make AJAX call to server
				    $.ajax({
				      url:'../warehouse/searchWH',
				      type: 'get',
				      dataType:'JSON',
				      data: {
			    	  warehouse_type: warehouse_type,
			    	  warehouse_code: warehouse_code,
			    	  warehouse_name: warehouse_name
			      },
			      success: function(data) {
			    	 	console.dir(data);
			    	 	grid.clear();
			    	 	grid.resetData(data);
			    	  	
			    	  	
			      }
			    	   	 });
			 	});
			});
		
		//체크된 행 삭제하기 (update 삭제)
		grid.on('check', function(ev) {	
	      
	    const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
			//console.log('check!', ev);
			//console.log('check!', rowData);
		
		Array.prototype.forEach.call(document.querySelectorAll('#delBtn'), el => {
	      el.addEventListener('click', ev => {

				$.ajax({
                 url: '../warehouse/deleteWH',
                 method :'PUT',
                 dataType: 'JSON',
                 data: JSON.stringify(rowData),
                 contentType: 'application/json',
                 success: function(response) {
                     console.log('Success:', response);
                      location.href = "../warehouse/whinfo";
                 	},
                 error: function(error) {
                     console.log('Error:', error);
                     location.href = "../warehouse/whinfo";
                 	}
             }); //ajax(/item/productDeleteAjax)끝
          }); //addEventListener끝
    	}); //deleteRow 끝
    }); //grid.on('check')끝 
		
		
		
	//체크 버튼 눌린 행 데이터 추가하기 (insert & update grid)	
	grid.on('check', function(ev) {	
	      
	    const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
    	const createdate = rowData.createdate;
			
    Array.prototype.forEach.call(document.querySelectorAll('#saveBtn'), el => {
	      el.addEventListener('click', ev => {
			
			 //alert(createdate); 
			  
			if(createdate == ''){
		
				$.ajax({
                 url: '../warehouse/insertWH',
                 method :'POST',
                 dataType: 'JSON',
                 data: JSON.stringify(rowData),
                 contentType: 'application/json',
                 success: function(response) {
                     console.log('Success:', response);
                     location.href = "../warehouse/whinfo";
                 	},
                 error: function(error) {
                     console.log('Error:', error);
                     location.href = "../warehouse/whinfo";
                 	}
             }); //insert ajax 끝
             
           }

			else {
           
            const rowKey2 = ev.rowKey;
    		const columnName2 = ev.columnName;
    		const rowData2 = grid.getRow(rowKey);
           
	           $.ajax({
	                 url: '../warehouse/updateWH',
	                 method :'PUT',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData2),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                     location.href = "../warehouse/whinfo";
	                 	},
	                 error: function(error) {
	                     console.log('Error:', error);
	                     location.href = "../warehouse/whinfo";
	                 	}
	             }); //update ajax 끝
           }
           
             
          }); //addEventListener끝
    	 }); //insertRow 끝
	}); //grid.on('check')끝 	
		
	
};	//최초시작


