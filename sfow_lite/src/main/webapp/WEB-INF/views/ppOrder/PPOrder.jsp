<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>작업지시(하늘)</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css"/>
<script>
$(document).ready(window.onload=function() {
	



		          
//------------------------------------------------------------------------------//
	
		//초기화
	   var resetRow = document.getElementById('resetRow');
	   resetRow.addEventListener('click', function() {
	      var confirmMsg = `초기화 하시겠습니까?`;
	      if(confirm(confirmMsg))
	         grid.clear();
	   });
	   
//------------------------------------------------------------------------------//	 

	   //검색(조회)
	  $('#search').click(function(event) {
	    event.preventDefault(); // prevent form submission
	    // get search parameters
	  
	    var pp_type = $('#pp_type').val();
	    var po_date = $('#po_date').val();
	    var end_date = $('#end_date').val();
	    var pp_no = $('#pp_no').val();
	    var warehouse_code = $('#warehouse_code').val();
	    var warehouse_name = $('#warehouse_name').val();
	    
	    // make AJAX call to server
	    $.ajax({
	      url:'${conPath}/PPOrder',
	      type:'GET',
	      dataType:'JSON',
	      contentType: 'application/json',
	      data: {
	    	  
	    	  pp_type:pp_type,
	    	  po_date:po_date,
	    	  end_date:end_date,
	    	  pp_no:pp_no,
	    	  warehouse_code:warehouse_code,
	    	  warehouse_name:warehouse_name
	    	 
	    	  
	      },
	      success: function(data) {
	    
	    	  	grid.resetData(data);
	    	   	
	    	   	grid.on('editingFinish', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	           
	            // 업데이트
	     	   $.ajax({
	    	       url: '${conPath}/updatePPOrder',
	    	       method: 'PUT',
	    	       dataType: 'JSON',
	    	       data: JSON.stringify(rowData),
	    	       contentType: 'application/json',
	    	       success: function(response) {
	    	           console.log('Success:', response);
	    	       },
	    	       error: function(error) {
	    	           console.log('Error:', error);
	               }
	             }); 
	    	   	});
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });
	  });
	});
	
//------------------------------------------------------------------------------//

	//그리드 추가 버튼
	var addRowBtn = document.getElementById('addRow-Btn');
	addRowBtn.addEventListener('click', function() {
	var newRowData = {
			pp_no: '',
			pp_type: '',
			po_date: '',
			end_date: '',
			item_code: '',
			item_name: '',
			item_no: '',
			item_specification: '',
			warehouse_code: '',
			warehouse_name: '',
			pp_quantity: '',
			pp_status:''
	
	 };
	  grid.appendRow(newRowData);
	});    

//------------------------------------------------------------------------------//
	
	//그리드 행 제거
    var delRowBtn = document.getElementById('delRow-Btn');
    delRowBtn.addEventListener('click', function() {
         var lastIndex = grid.getRowCount()-1;
         grid.removeRow(lastIndex);
       });	

//------------------------------------------------------------------------------//
    
//등록
    $("#insertRowBtn").click(function() {      //버튼네임등록
         let i = confirm('등록하시겠습니까?');
         if(i) {
            saveFunction();
         }else {
            return false;
         }
      });
      
      // 등록 진행
      function saveFunction() {

         var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
         console.log(rowDatas);
         /* alert("rowDatas : " + rowDatas); */
         var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
         /* alert("JSON.stringify(rowDatas) : " + jsonRowDatas); */
         $.ajax({
            url : "${conPath}/insertPPOrder",
            method : "post",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
            dataType: "json",         // 서버에서 받을 데이터타입
            success : function (result) {
               //alert(result); // result는 반환받은 json형태의 객체 
            },
            error: function() {
                 console.log("입력실패");
             },
             complete:function(){
             }
             
         });
         
      }   
      
//------------------------------------------------------------------------------//

//행 삭제
      function deleteRow() {

         var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
        /*  alert(rowKeys); */
         var test = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
         alert(test);
         
         var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
        /*  alert(rowDatas); */
         var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
        /*  alert(jsonRowDatas); */
         
         grid.removeCheckedRows([test]);      // 그리드 인덱스 제거용 (한 줄 제거용)

         $.ajax({
            url : "${conPath}/deletePPOrder",
            method : "POST",
            data : JSON.stringify(rowDatas),
            contentType : "application/json; charset=UTF-8",
            dataType: "JSON",
            success : function (dd) {
             /*   alert(dd); */
            /*    alert('성공');   // result를 배열로 받는다 */
            },
            error: function() {
                 console.log("실패");
             }
         });
      }
</script>		

<style>



.editer-content{
    
     display: flex;
    padding: 1rem 1rem;
    border-radius: 10px;
    background: #F8F8F8;
    margin-top: 0.5rem;
        }

.right-tap-btn{
    height: 45px;
    font-size: 1.8em;
    text-align: center;
    margin-right: 4px;
    border: 1px solid #D6DAE2;
    border-radius: 5px;
    font-size: 0.875rem;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    height: 2rem;
    padding: 0 0.75rem;
    font-weight: 500;
    color: #636363;
    }
    
.form-title{
	width : 100px;
	height: 30px;
	color:black;
	font-weight:bold;
	background-color: #e2e2e2;
	
	border:1px solid #e2e2e2;
	text-align:center;
	
	line-height : 30px;
	border-radius:3px;
	display:inline-block;
	}
		
.form-data{
	width : 200px;
	height: 30px;
	background-color: rgb(230, 242, 255)
	text-align:center;
	
	line-height : 30px;
	border-radius:3px;
	border:1px solid #e2e2e2;
	display:inline-block;
}


	

button {
/*   background-color: rgba(60, 80, 135, 1); */
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
  color: white;
   border: 1px solid #8c8c8c;
  border-radius: 5px;
}

/* 조회 */
#search:hover {
  background-color: rgba(051, 102, 102, 1);
  opacity: 0.8;
}

/* 삭제 */	
#delRowBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}

/* 등록 */
#insertRowBtn:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}

/* 초기화 */
#resetRow:hover {
  background-color:  rgba(204, 000, 051, 1);
  opacity: 0.8;
}

/* +버튼 */
#addRow-Btn{
/* 	color:black;
	font-weight:bold;
	background-color: #e2e2e2; */
}
#addRow-Btn:hover {
   background-color: rgba(051, 102, 204, 1);
  color: white;
}
/* -버튼 */
#delRow-Btn{
/* 	color:black;
	font-weight:bold;
	background-color: #e2e2e2; */
}
#delRow-Btn:hover {
  background-color: rgba(204, 000, 051, 1);
  color: white;
}

</style>		
</head>
<body>

	<div class="file-title" style="margin: 10px;">
        <div class="right-btn-group">
	      
	        <button type="button" class="search" id="search" value="조회"><i class="fa fa-search"></i> 조회</button>
	  		<button type="button" id="insertRowBtn"><i class="fa fa-save"></i> 등록</button>
		    <button  type="button" id="delRowBtn" onclick="deleteRow()" ><i class="fa fa-trash"></i> 삭제</button>
	        
	        <button type="reset" id="resetRow" value="초기화" ><i class="fa fa-power-off"></i> 초기화</button>
	    	<button id="addRow-Btn"> <i class="fa fa-plus"></i> 작업지시서 행 추가</button>
			<button id="delRow-Btn"> <i class="fa fa-minus"></i> 작업지시서 행 제거</button>
        </div>
    </div>
    
    
    <div class="right-content">
        <div class="editer-content" style="display:inline-block; margin:5px; font-size:13px; color:black;">
           <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="유형" disabled/>
    
     			<select id="pp_type" name="pp_type" class="form-data" >
                   <option value="">--선택--</option>
                   <option value="일반">일반</option>
                   <option value="재작업">재작업</option>
                	<option value="개발품(시제품)">개발품(시제품)</option>
                 </select>
            </div>
  
            <div style="display:inline; margin:5px; font-size:13px; color:black;" >
            <input type="text" class="form-title" value="조회시작일" disabled/>
            <input type="text" class="form-data" id ="po_date" name="po_date"/>
            </div>
            <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="조회종료일" disabled/><input type="text" class="form-data" id ="end_date" name="end_date"/></div>
            <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="지시번호조회" disabled/><input type="text" class="form-data" id ="pp_no" name="pp_no"/></div><br/><br/>
            <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="창고" disabled/><input type="text" class="form-data" id ="warehouse_code" name="warehouse_code"/></div>
            <div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="창고명" disabled/><input type="text" class="form-data" id ="warehouse_name" name="warehouse_name"/></div>

        </div>
           
     </div>
     
	<!-- 그리드 화면 -->
 <div id="grid">
 				
			
<!-- <button  type="button" id="delRowBtn" onclick="deleteRow()">-(DB삭제)</button>  -->
			
			

 </div>


 <script>
//------------------------------------------------------------------------------//
//그리드
	   var gridData=[];
	   var grid = new tui.Grid({
	       el: document.getElementById('grid'),
	       data: gridData,
	       scrollX: false,
	       scrollY: false,
	       rowHeaders: ['checkbox'],
	       
	    columns: [
    	   {
   	        header: '지시번호',	//헤더 제목
   	        name: 'pp_no',		//컬럼 이름
   	        sortable: true,		//정렬 위아래로
   	        editor: 'text',		//글씨 수정
   	        align:'center', 	//텍스트 센터
   	      },
	      {
	        header: '유형',
	        name: 'pp_type',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: '지시일자',
	        name: 'po_date',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: '완료일자',
	        name: 'end_date',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: 'ITEM코드',
	        name: 'item_code',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: '품명',
	        name: 'item_name',
	        sortable: true,
	        editor: 'text',
	        align:'center',
		  },
		  {
	        header: '품명코드',
	        name: 'item_no',
	        sortable: true,
	        editor: 'text',
	        align:'center',
		  },
		  {
	        header: '규격',
	        name: 'item_specification',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	        
		  },
		  {
	        header: '창고',
	        name: 'warehouse_code',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	        
		  },
		  {
	        header: '창고명',
	        name: 'warehouse_name',
	        sortable: true,
	        editor: 'text',
	        align:'center',
		        
		  },
		  {
	        header: '작업지시수량',
	        name: 'pp_quantity',
	        sortable: true,
	        editor: 'text',
	        align:'center',
			        
		  },
		  {
	        header: '작업지시상태',
	        name: 'pp_status',
	        sortable: true,
	        editor: 'text',
	        align:'center',
			        
		  },
		  {
	        header: '회사코드',
	        name: 'company_code',
	        sortable: true,
	        editor: 'text',
	        align:'center'
				        
			  }
	    ]
	  });//그리기 끝

//------------------------------------------------------------------------------//
	
	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	   	grid.on('check', function(ev) {
          const rowKey = ev.rowKey;
          const columnName = ev.columnName;
          var updatedData = {};
          const rowData = grid.getRow(rowKey);
          console.log('Row data: ', rowData);
          if(grid.getCheckedRows().length==1){
        	var pp_type  = document.getElementById('pp_type');
	    	var po_date  = document.getElementById('po_date');
	    	var end_date  = document.getElementById('end_date');
	    	var pp_no = document.getElementById('pp_no');
	    	var warehouse_name = document.getElementById('warehouse_name');
	    	var warehouse_code = document.getElementById('warehouse_code');
	    	
	    	var test1 =rowData.pp_type;
	    	var test2 =rowData.po_date;
	    	var test3 =rowData.end_date;
	    	var test4 =rowData.pp_no;
	    	var test5 =rowData.warehouse_name;
	    	var test6 =rowData.warehouse_code;
	    	
	    	pp_type.value=test1;
	    	pp_type.readOnly=true;
	    	pp_type.disabled=true;
	    	pp_type.style.outline='none';
	    	
	    	po_date.value=test2;
	    	po_date.readOnly=true;
	    	po_date.disabled=true;
	    	po_date.style.outline='none';
	    	
	    	end_date.value=test3;
	    	end_date.readOnly=true;
	    	end_date.disabled=true;
	    	end_date.style.outline='none';
	    	
	    	pp_no.value=test4;
	    	pp_no.readOnly=true;
	    	pp_no.disabled=true;
	    	pp_no.style.outline='none';
	    	
	    	warehouse_name.value=test5;
	    	warehouse_name.readOnly=true;
	    	warehouse_name.disabled=true;
	    	warehouse_name.style.outline='none';
	    	
	    	warehouse_code.value=test6;
	    	warehouse_code.readOnly=true;
	    	warehouse_code.disabled=true;
	    	warehouse_code.style.outline='none';
	
          }else{
	    		
        	 	var pp_type = document.getElementById('pp_type');
	    		var po_date = document.getElementById('po_date');
		    	var end_date = document.getElementById('end_date');
		    	var pp_no = document.getElementById('pp_no');
		    	var warehouse_name = document.getElementById('warehouse_name');
		    	var warehouse_code = document.getElementById('warehouse_code');
		    
		    	pp_type.value="";
		    	pp_type.readOnly=false;
		    	pp_type.style.removeProperty('outline');
		    	
		    	po_date.value="";
		    	po_date.readOnly=false;
		    	po_date.style.removeProperty('outline');
	    		
		    	end_date.value="";
		    	end_date.readOnly=false;
		    	end_date.style.removeProperty('outline');
		    	
		    	pp_no.value="";
		    	pp_no.readOnly=false;
		    	pp_no.style.removeProperty('outline');
		    	
		    	warehouse_name.value="";
		    	warehouse_name.readOnly=false;
		    	warehouse_name.style.removeProperty('outline');
		    	
		    	warehouse_code.value="";
		    	warehouse_code.readOnly=false;
		    	warehouse_code.style.removeProperty('outline');
          }
	    	
	    	
  	   });
	   
	  //checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
    	grid.on('uncheck', (ev) => {
    		var pp_type = document.getElementById('pp_type');
    		var po_date = document.getElementById('po_date');
	    	var end_date = document.getElementById('end_date');
	    	var pp_no = document.getElementById('pp_no');
	    	var warehouse_name = document.getElementById('warehouse_name');
	    	var warehouse_code = document.getElementById('warehouse_code');
	  
	    	pp_type.value="";
	    	pp_type.readOnly=false;
	    	pp_type.style.removeProperty('outline');
	    	pp_type.disabled=false;
	    	
	    	po_date.value="";
	    	po_date.readOnly=false;
	    	po_date.style.removeProperty('outline');
	    	po_date.disabled=false;
    		
	    	end_date.value="";
	    	end_date.readOnly=false;
	    	end_date.style.removeProperty('outline');
	    	end_date.disabled=false;
	    	
	    	pp_no.value="";
	    	pp_no.readOnly=false;
	    	pp_no.style.removeProperty('outline');
	    	pp_no.disabled=false;
	    	
	    	warehouse_name.value="";
	    	warehouse_name.readOnly=false;
	    	warehouse_name.style.removeProperty('outline');
	    	warehouse_name.disabled=false;
	    	
	    	warehouse_code.value="";
	    	warehouse_code.readOnly=false;
	    	warehouse_code.style.removeProperty('outline');
	    	warehouse_code.disabled=false;
 
    		
    	});

//------------------------------------------------------------------------------//
 
</script>

<script>
//modal에 띄워지는 grid2

  var body = document.querySelector('body');
  var modal = document.querySelector('.modal');
  var btnOpenPopup = document.querySelector('.btnFas');

var grid2=null;	 //추가된 부분!!
	function resetCheck() {
	  if (grid2) {
	    grid2.uncheckAll();
	  }
	}
	
	//modal 닫기 함수
	function closeModal() {
		  modal.classList.remove('show');
	         body.style.overflow = 'auto';
		}	
	
	
	
	//modal 안에 grid2의 checkbox 체크된 row데이터 input태그에 찍기
	function applyModal() {
		// grid2가 존재하고 데이터가 있을 때만 이벤트 리스너 등록
		// if (grid2 && grid2.getData().length > 0) {   
		        //modal.classList.toggle('show');
		        //body.style.overflow = 'auto';
	      if (grid2 && grid2.getCheckedRows().length > 0) {
	   	    const checkedRows = grid2.getCheckedRows();
	   	    const warehouse_code = document.getElementById('warehouse_code');
	   	    warehouse_code.value = checkedRows[0].warehouse_code;
	        //alert(warehouse_code.value);
//	         var warehouse_code = document.getElementById('warehouse_code');
//	         var test = rowData.warehouse_code;
//	         warehouse_code.value = test;
	      }        
	         modal.classList.remove('show');
	         body.style.overflow = 'auto';
		   // });
		}	
	



$(document).ready(function() {
	
	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
// 	function resetCheck(){
// 		grid2.uncheckAll();
// 	};

	
  //$('.btn-open-popup').dblclick(function(event) {
  $('.btnFas').dblclick(function(event) {
	  
  
	  event.preventDefault();
	//추가된 부분!!
	  if(grid2){
		  grid2.destroy();
	  }
	  
	var gridData2=[];
  	grid2 = new tui.Grid({
  	el: document.getElementById('modalGrid'),
  	data: gridData2,
  	scrollX: false,
  	scrollY: false,
  	autoWidth: true,
  	rowHeaders: [{
   	   type: 'rowNum',
   	   header: "  ",
   	   width: 50
  	},{type : 'checkbox'}],
  	columns: [
   	 {
    	header: '창고코드',
      	name: 'warehouse_code',
      	sortable: true,
      	align:'center',
      	width:165
    	},
    	{
      	header: '창고명',
      	name: 'warehouse_name',
      	sortable: true,
      	align:'center',
      	width:165
    	}
  	]
	});
  	

$.ajax({
    type:"POST", //요청방식 
    dataType:"JSON",
    url: '<%=request.getContextPath()%>/searchWh',
	      success: function(data) {
	      	gridData2=data
  	  		grid2.resetData(data)
  	   	
  	  },
    error: function(xhr, status, error) {
      // handle error
      console.log(error);
    }
  });
  
	  //modal 안에 grid 행 checkbox 체크시 row데이터 출력(웹 console에만 출력하는 용도)
		grid2.on('check', function(ev) {
	    const rowKey = ev.rowKey;
	    const columnName = ev.columnName;
	    var updatedData = {};
	    const rowData = grid2.getRow(rowKey);
	    console.log('Row data: ', rowData);
	    console.dir('Row data: ', rowData);
		}); 

	});//double클릭 이벤트 끝
});//document.ready끝	


  //modal 띄우기


  
  btnOpenPopup.addEventListener('dblclick', () => {
    modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
    	body.style.overflow = 'hidden';
    }
  });

  //modal 클릭 이벤트 리스너(modal 밖의 바탕을 누르면 modal 창 닫히는 이벤트 리스너 = 닫기 버튼 생성으로 주석처리)
  
/*   modal.addEventListener('click', (event) => {
    if (event.target === modal) {
      modal.classList.toggle('show');

      if (!modal.classList.contains('show')) {
        body.style.overflow = 'auto';
      }
    }
  }); */
  


</script>

<!-- 모달테스트 -->


<div class="modal">
  <!-- modal에 grid 띄우기 -->
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
    <!-- reset 버튼 추가 -->
    <button type="button" id="applyBtn" onclick="applyModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      적용
    </button>
    
    <button type="reset" id="resetMdBtn" onclick="resetCheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      초기화
    </button>
    
    <button type="button" id="closeBtn" onclick="closeModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      닫기
    </button>
  </div>
</div>

</body>
</html>