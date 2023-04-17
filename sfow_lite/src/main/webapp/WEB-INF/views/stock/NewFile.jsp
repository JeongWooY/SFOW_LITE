<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function modal(){
	alert("dd");
}
</script>
<body>
<style>
.container {
  display: flex;
  align-items: center;
}

  .search_wh {
    border: 1px solid #ccc;
    padding: 5px;
  }

  .search_wh input[type="text"] {
    border: none;
    outline: none;
  }

  .search_wh .fas.fa-search {
    margin-right: 5px;
  }
	
	
.wh_div { display: inline-block; padding: 5px; border: solid 1px #ccc; background-color: #f4f4f4; font-size: 9pt; }
.wh { background-color: transparent; width: 100px; padding: 3px; border: 0;  font-size: 9pt; border-radius:4px; }
</style>




<div class="search_wh">
<div class="wh_div">창고검색</div>
<div class="wh_div">
<input type="image" src="resources/img/stock/lens.png" alt="돋보기" onclick="modal();" width="25px" height="25px" 
style="border-radius:4px;">
<input type="text" name="wh" class="wh">
</div>
</div>


</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function modal(){
	alert("dd");
}
</script>
<body>
<style>
.container {
  display: flex;
  align-items: center;
}

  .search_wh {
    border: 1px solid #ccc;
    padding: 5px;
  }

  .search_wh input[type="text"] {
    border: none;
    outline: none;
  }

  .search_wh .fas.fa-search {
    margin-right: 5px;
  }
	
	
.wh_div { display: inline-block; padding: 5px; border: solid 1px #ccc; background-color: #f4f4f4; font-size: 9pt; }
.wh { background-color: transparent; width: 100px; padding: 3px; border: 0;  font-size: 9pt; border-radius:4px; }
</style>




<div class="search_wh">
<div class="wh_div">창고검색</div>
<div class="wh_div">
<input type="image" src="resources/img/stock/lens.png" alt="돋보기" onclick="modal();" width="25px" height="25px" 
style="border-radius:4px;">
<input type="text" name="wh" class="wh">
</div>
</div>


</body>
>>>>>>> refs/heads/master
</html>