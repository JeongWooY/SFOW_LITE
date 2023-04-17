 var grid = new tui.Grid({
	    	el: document.getElementById('grid'),
	        scrollX: false,
	        scrollY: false,
	        rowHeaders: ['rowNum'],
	        checkOnlyOneRow: true,
	        columns: [
	        	{
	        	    header: '선택',
	        	    align: 'center',
	        	    width: 50,
	        	    renderer: {
	        	        type: CustomRadioRenderer
	        	    }
	        	},
	        	{
	    			header: '상태',
	    			name: 'out_status',
	    			formatter: 'listItemText',
	    			editor: {
	    				type: 'select',
	    				options: {
	    					listItems: [
	    						{text: '저장',value: '0'},
	    						{text: '확정',value: '1'}
	    					]
	    				}
	    			}
	    		},
	    		{
	    			header: '반품일자',
	    			name: 'return_date',
	    	          editor: {
	    	        	  type: 'datePicker',
	    	              options: {
	    	                format: 'yyyy-MM-dd'
	    	              }
	    	          }
	    		},
	    		{
	    			header: '입고번호',
	    			name: 'return_number',
	    			editor: false
	    		},
	    		{
	    			header: '거래처코드',
	    			name: 'client_code',
	    			editor: false
	    		},
	    		{
	    			header: '거래처명',
	    			name: 'client_name',
	    			editor: false
	    		},		{
	    			header: '비고',
	    			name: 'memo',
	    			editor: 'text'
	    		}
	    	]
	    	}); //그리드 테이블
	    	
	//전체 데이터 조회	    	
    $.ajax({
        url : "<%=request.getContextPath()%>/so/getReturnAdd",
        method :"POST",
        dataType : "JSON",
        contentType : "application/json; charset=utf-8",
        success : function(returnAdd){
            console.dir(returnAdd);
            grid.resetData(returnAdd);
        },
        error:function(returnAdd){
        	alert('에러');
        }
    
   }); //ajax끝