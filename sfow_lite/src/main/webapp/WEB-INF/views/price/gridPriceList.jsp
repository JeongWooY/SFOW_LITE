<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목단가관리</title>
<style>
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
		background-color: rgb(230, 242, 255);
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
    color: #fff;
    border: none;
}

#searchBtn:hover {
  background-color: rgba(051, 102, 102, 1);
  opacity: 0.8;
}

   
#resetBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}


#applyBtn:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}


#resetMdBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}


#closeBtn:hover {
  background-color: rgba(153, 102, 000, 1);
  opacity: 0.8;
}

#whSearchBtn:hover {
  background-color: rgba(102, 102, 102, 1);
  opacity: 0.8;
}

.modal{
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  display: none;
  background-color: rgba(0, 0, 0, 0.4);
  justify-content:center;
  align-items:center;
}
.modal.show {
  display: block;
}
#modalGrid{
	  position: fixed;
	  top: 50%; /* 모달이 수직 중앙에 위치하도록 top 값을 50%로 지정 */
  	  left: 50%;
	  width: 500px;
	  height: 500px;
	  padding: 40px;
	  justify-content:center;
  	  align-items:center;
	  text-align: center;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
}
#modal_search{
  position: fixed;
  top: 33%; 
  left: 47%;
  z-index: 1;
}	
.btn-open-popup{
width : 200px;
height: 30px;
background-color: rgb(230, 242, 255);
text-align:left;
line-height : 30px;
border-radius:3px;
border:1px solid #e2e2e2;
display:inline-block;
}
.search_tp .form-title{
border-radius:3px;
line-height : 30px;
}
.search_tp input[type="text"] {
border: none;
outline: none;
border-radius:3px;
border:1px solid #e2e2e2;
line-height : 30px;
height: 30px;
}
.search_tp input[type="text"]#lens_sh {
margin-left:-0.5px;
}
.search_tp input[type="text"].btn-open-popup {
padding-left: 30px;
cursor: text;
margin-left:-3.5px;
margin-right:5px;
}
.search_tp input[type="text"].btn-open-popup:focus {
outline: none;
}
.search_tp i.fa-search {
position: absolute;
left: 5px;
top: 50%;
transform: translateY(-50%);
z-index: 1;
}
#addRow .fas fa-plus {
float: right;
}
.modal{
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  display: none;
  background-color: rgba(0, 0, 0, 0.4);
  justify-content:center;
  align-items:center;
}
.modal.show {
  display: block;
}
#modalGrid{
	  position: fixed;
	  top: 50%; /* 모달이 수직 중앙에 위치하도록 top 값을 50%로 지정 */
  	  left: 50%;
	  width: 500px;
	  height: 500px;
	  padding: 40px;
	  justify-content:center;
  	  align-items:center;
	  text-align: center;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
}
#modal_search{
  position: fixed;
  top: 33%; 
  left: 47%;
  z-index: 1;
}
#keyword{
    flex: 1;
    margin: 0;
    padding: 0;
    border-radius: 4px;
}
button {
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
}
#applyBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 300px; /* 버튼 위치 조정 */
}
#applyBtn:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}
#resetMdBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 210px; /* 버튼 위치 조정 */
}
#resetMdBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}
#closeBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 120px; /* 버튼 위치 조정 */
}
#closeBtn:hover {
  background-color: rgba(153, 102, 000, 1);
  opacity: 0.8;
}
#mdshBtn {
        margin: 0;
        padding: 0;
        height: 28px;
	    width: 60px;
	    font-size: 13px;
	    color: black;
	    border: 1px solid #8c8c8c;
	    border-radius: 4px;
	    bottom: 10px;
}
input::placeholder {
color: grey;
font-style: italic;
font-size:5px;
}
#mdshBtn:hover {
 background-color: rgba(102, 102, 102, 1);
  opacity: 0.8;
}
</style>
</head>
<body>
	


 	<div>		
        <div class="form-code">
		
            	<form id="semiSearch">
            	<div class="form-title">품목구분</div><input type="text" class="form-data" id ="itemCategory" name = "itemCategory" style="margin-right: 20px; margin-left:20px; " placeholder='--';>
            	<div class="form-title">품목검색</div><input type="text" class="form-data" id ="itemCode" name = "itemCode" style="margin-right: 20px; margin-left:20px; " placeholder='자동완성';>
              	<div class="form-title">품명</div><input type="text" class="form-data" id = "itemName" name = "itemName" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">품번</div><input type="text" class="form-data" id="itemNo" name = "itemNo" style="margin-right: 20px; margin-left:20px; ">
              	<div class="form-title">규격</div><input type="text" class="form-data" id = "itemSpecification" name = "itemSpecification" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">거래처코드</div><input type="text" class="form-data" id = "clientCode" name = "clientCode" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">거래처명</div><input type="text" class="form-data" id = "clientName" name = "clientName" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">사용여부</div><input type="text" class="form-data" id = "useyn" name = "useyn" style="margin-right: 20px; margin-left:20px;">
              	
              	</form>
    </div>
</div>



<font size='7px';>품목단가관리</font>
  <div id="grid">
				<button id="searchBtn"> <i class="fa fa-search"></i>조회</button>
				<button id="updateRowBtn" onclick="updateRow()"><i class="fa fa-save"></i>저장</button>
				<button  type="button" id="delRowBtn" onclick="deleteRow()"> <i class="fa fa-trash"></i> 삭제</button>
				<button id="resetRow"><i class="fa fa-power-off"></i>초기화</button>
				<button id="addRowBtn"> <i class="fa fa-plus"></i></button>
				<button type="button" id="insertRowBtn" style="background-color: #33F6FF">등록</button>
  </div>
  
<div class="modal">
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
    <button type="button" id="applyBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;적용</button>
    <button type="reset" id="resetMdBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;초기화</button>
    <button type="button" id="closeBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;닫기</button>
  </div>
</div>

</body>
<script> 

	var grid = new tui.Grid({
	el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: false,
	    rowHeaders: ['checkbox','rowNum'],

	columns: [
	{ header: '회사코드	', name: 'companyCode', hidden:true	},
    { header: '품목구분',
	      name: 'itemCategory',
	      sortable: true,
	      editor: 'text'
	      ,align:'center' },
    { header: '품목검색'	 , name: 'itemCode' 		, sortable: true, editor: 'text' ,align:'center' },
    { header: '품명'	 	 , name: 'itemName'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '품목번호'	 , name: 'itemNo'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '규격'	 	 , name: 'itemSpecification', sortable: true, editor: 'text' ,align:'center' },
    { header: '거래처코드'  , name: 'clientCode' 		, sortable: true, editor: 'text' ,align:'center' },
    { header: '거래처명'   , name: 'clientName' 		, sortable: true, editor: 'text' ,align:'center' },
    { header: '시작일' 	 , name: 'startDate' 		, sortable: true, editor: {type: 'datePicker',options: { format:'yyyy-MM-dd'}}},
    { header: '종료일' 	 , name: 'endDate' 			, sortable: true, editor: {type: 'datePicker',options: { format:'yyyy-MM-dd'}}},
    { header: '매입단가'	 , name: 'buyPrice' 		, sortable: true, editor: 'text' ,align:'right'  },
	{ header: '매출단가'	 , name: 'salesPrice'		, sortable: true, editor: 'text' ,align:'right'  },
	{ header: '비고'		 , name: 'memo'				, sortable: true, editor: 'text' ,align:'center' },
	{ header: '사용여부',
	  name: 'useyn', 
	  sortable: true ,
	  editor: {type: 'select',
    	  options: {
              listItems: [
                  {text: 'Y', value: "Y"},
                  {text: 'N', value: "N"}
             			 ] 
      				}
      		   },
      align:'center'
	  }
	  	  // itemCode,itemName itemNo itemSpecification clientCode clientName startDate endDate buyPrice salesPrice memo
	]	
	});
	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	grid.on('check', function(ev) {
        const rowKey = ev.rowKey;
        const columnName = ev.columnName;
        var updatedData = {};
        const rowData = grid.getRow(rowKey);
        console.log('Row data: ', rowData);
        if(grid.getCheckedRows().length==1){
        var itemCategory = document.getElementById('itemCategory');
   		var itemCode = document.getElementById('itemCode');
   		var itemName = document.getElementById('itemName');
  		var itemNo = document.getElementById('itemNo');
  		var itemSpecification = document.getElementById('itemSpecification');
  		var clientCode = document.getElementById('clientCode');
  		var clientName = document.getElementById('clientName');
  		var useyn = document.getElementById('useyn');
    	
  		itemCategory.value=rowData.itemCategory;
  		itemCategory.readOnly=true;
  		
    	itemCode.value=rowData.itemCode;
    	itemCode.readOnly=true;

    	
    	itemName.value=rowData.itemName;
    	itemName.readOnly=true;
	
    	
    	itemNo.value=rowData.itemNo;
    	itemNo.readOnly=true;
    	
    	itemSpecification.value=rowData.itemSpecification;
    	itemSpecification.readOnly=true;
    	
    	clientCode.value=rowData.clientCode;
    	clientCode.readOnly=true;
    	
    	clientName.value=rowData.clientName;
    	clientName.readOnly=true;
    	
    	useyn.value=rowData.useyn;
    	useyn.readOnly=true;
    	
        }else{
        	var itemCategory = document.getElementById('itemCategory');
       		var itemCode = document.getElementById('itemCode');
       		var itemName = document.getElementById('itemName');
      		var itemNo = document.getElementById('itemNo');	
      		var itemSpecification = document.getElementById('itemSpecification');
      		var clientCode = document.getElementById('clientCode');
      		var clientName = document.getElementById('clientName');
      		var useyn = document.getElementById('useyn');

      		itemCategory.value="";
      		itemCategory.readOnly=true;
      		
        	itemCode.value="";
    		itemCode.readOnly=true;
        	
    		itemName.value="";
    		itemName.readOnly=false;

        	itemNo.value="";
        	itemNo.readOnly=false;
        	
        	itemSpecification.value="";
        	itemSpecification.readOnly=false;
        	
        	clientCode.value="";
        	clientCode.readOnly=false;
        	
        	clientName.value="";
        	clientName.readOnly=false;
        	
        	useyn.value="";
        	useyn.readOnly=false;
        	
        	}
        
	});
	
	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	grid.on('uncheck', (ev) => {
    	var itemCategory = document.getElementById('itemCategory');
   		var itemCode = document.getElementById('itemCode');
   		var itemName = document.getElementById('itemName');
  		var itemNo = document.getElementById('itemNo');	
  		var itemSpecification = document.getElementById('itemSpecification');
  		var clientCode = document.getElementById('clientCode');
  		var clientName = document.getElementById('clientName');
  		var useyn = document.getElementById('useyn');
	
    	
  		itemCategory.value="";
  		itemCategory.readOnly=true;
  		
    	itemCode.value="";
		itemCode.readOnly=true;
    	
		itemName.value="";
		itemName.readOnly=false;

    	itemNo.value="";
    	itemNo.readOnly=false;
    	
    	itemSpecification.value="";
    	itemSpecification.readOnly=false;
    	
    	clientCode.value="";
    	clientCode.readOnly=false;
    	
    	clientName.value="";
    	clientName.readOnly=false;
    	
    	useyn.value="";
    	useyn.readOnly=false;
	
	
	});
	
	

	// 목록 조회(첫 페이지 출력시 자동 조회)
	
	$.ajax({
		url : "./price/toastPriceDataList",		//toastDataList
		method :"GET",
		dataType : "JSON",
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			console.dir(result);
			grid.resetData(result);
		}
	});
	
	/*아래부터 버튼*/
	
	//목록 조회 버튼(검색 추가)
	$('#searchBtn').on('click', function() { 
		// itemCode,itemName itemNo itemSpecification clientCode clientName startDate endDate buyPrice salesPrice memo
		var searchData = {
				itemCategory: $("#itemCategory").val(),
				itemCode: $("#itemCode").val(),
				itemName: $("#itemName").val(),
				itemNo: $("#itemNo").val(),
				itemSpecification: $("#itemSpecification").val(),
				clientCode: $("#clientCode").val(),
				clientName: $("#clientName").val(),
				useyn: $("#useyn").val()
			    
		}
		
		//var jsonSearchData = JSON.stringify(searchData)
		event.preventDefault();	// 새 창 열림 방지
		
	$.ajax({
		url : "price/toastPriceDataList",		//toastDataList
		method :"POST",
		data:searchData,
		dataType : "JSON",
		/* contentType : "application/json; charset=utf-8", */
		success : function(result) {
			console.dir(result);
			grid.resetData(result);
		}
	});
	});	
	
	//초기화 버튼

	var resetRow = document.getElementById('resetRow');
	resetRow.addEventListener('click', function() {
		var confirmMsg = `초기화 하시겠습니까?`;
		if(confirm(confirmMsg))
			grid.clear();
	});
	
	// 행 추가 버튼
	var addRowBtn = document.getElementById('addRowBtn');
	addRowBtn.addEventListener('click', function() {
	var newRowData = {
	companyCode:'',
    itemCode: '',
    itemName: '',
    itemNo: '',
    itemType: '',
    itemSpecification: '',
    clientCode: '',
    clientName: '',
    startDate:'',
    endDate: '',
    buyPrice: '',
    salesPrice: '',
    memo: '',
    useyn: ''
 	};
 	 grid.appendRow(newRowData);
	});	
	// itemCode,itemName itemNo itemSpecification clientCode clientName startDate endDate buyPrice salesPrice memo
	//행 삭제
	   function deleteRow() {

	      var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
	      var test = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
	      
	      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      
	      grid.removeCheckedRows([test]);		// 그리드 인덱스 제거용 (한 줄 제거용)

	      $.ajax({
	         url : "price/useUpdate",
	         method : "POST",
	         data : JSON.stringify(rowDatas),
	         contentType : "application/json; charset=UTF-8",
	         dataType: "JSON",
	         success : function (dd) {
	         },
	         error: function() {
	              console.log("실패");
	          }
	      });
	   }
		  

		

	// 컬럼 수정
	$('#updateRowBtn').on('click', function() { 
	grid.on('editingFinish', function(ev) {
	      const rowKey = el.rowKey;
	      const columnName = el.columnName;
	      var updatedData = {};
	      const rowData = grid.getRow(rowKey);
	      console.log('Row data: ', rowData);
	      
	     $.ajax({
	        url: '${conPath}/price/updatePrice',
	        method: 'POST',
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
	});
		// 등록 진행
   $("#insertRowBtn").click(function() {
      let i = confirm('등록하시겠습니까?');
      if(i) {
         addBtn();
      }else {
         return false;
      }
   });
   
   // 등록 진행
   function addBtn() {

      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
      
      $.ajax({
         url : "price/insertPrice",
         method : "post",
         data : jsonRowDatas,
         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
         dataType: "json",         // 서버에서 받을 데이터타입
         success : function (result) {
         },
         error: function() {
              console.log("실패");
          }
      });
   }

   function openModal(){
	   
 	  var body = document.querySelector('body');
 	  var modal = document.querySelector('.modal');
 	  //modalGrid 초기화
 	  var modalGrid = document.getElementById("modalGrid");

 	  modal.classList.toggle('show');
 	 
		const Grid = tui.Grid;
		const grid2 = new Grid({
			
	  	el: document.getElementById('modalGrid'),
	  	scrollX: false,
	  	scrollY: false,
	  	autoWidth: true,
	  	rowHeaders: [
	          { type: 'rowNum', align: 'center'},
	    	  { type: 'checkbox' }
	        ],
	        columns: [
	          {
	            header: '아이템코드',
	            name: 'itemCode',
	            align: 'center',
	            editor:'text'
	          },
	          {
	             header: '품목구분',
	             name: 'itemCategory',
	             align: 'center',
	             editor:'text'
	          },
	          {
	              header: '품명',
	              name: 'itemName',
	              align: 'center',
	              editor:'text'
	           },
	            {
	               header: '품번',
	               name: 'itemNo',
	               align: 'center',
	               editor:'text'
	             },
	              {
	                 header: '규격',
	                 name: 'itemSpecification',
	                 align: 'center',
	                 editor:'text'
	              }
	        ]
		});
		
	$.ajax({
		url : './price/itemcodeSelectAjax',
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
 	}//openModal끝

</script>

	
</html>