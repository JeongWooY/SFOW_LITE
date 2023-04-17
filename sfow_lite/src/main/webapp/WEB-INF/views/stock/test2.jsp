<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Safari syntax */
:-webkit-full-screen {
  background-color: yellow;
}

/* IE11 */
:-ms-fullscreen {
  background-color: yellow;
}

/* Standard syntax */
:fullscreen {
  background-color: yellow;
}

/* Style the button */
button {
  padding: 20px;
  font-size: 20px;
}

#section2 {
  display: none;
}
</style>
<script>

var elem = document.documentElement;
function openFullscreen(){
  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.webkitRequestFullscreen) { 
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) {
    elem.msRequestFullscreen();
  }
  document.getElementById("section1").style.display = "none";
  document.getElementById("section2").style.display = "block";
}

function closeFullscreen() {
	  if(document.exitFullscreen) {
	    document.exitFullscreen();
	  } else if (document.webkitExitFullscreen) { 
	    document.webkitExitFullscreen();
	  } else if (document.msExitFullscreen) { 
	    document.msExitFullscreen();
	  }
	  document.getElementById("section1").style.display = "block";
	  document.getElementById("section2").style.display = "none";
	}
</script>
</head>
<body>
<div id="field mode" style="display: none;"></div>
<section id="section1">
<h2>Fullscreen with JavaScript</h2>
<p>Click on the "Open Fullscreen" button to open this page in fullscreen mode. Close it by either clicking the "Esc" key on your keyboard, or with the "Close Fullscreen" button.</p>

<button onclick="openFullscreen();">Open Fullscreen</button>
<button onclick="closeFullscreen();">Close Fullscreen</button>

<p>페이지 로드하면서 전체화면 가보자</p>
</section>
<section id="section2">
<table>
	<tr>
		<th>1</th>
		<th>2</th>
		<th>3</th>
		<th>4</th>
	</tr>
	<tr>
		<td>5</td>
		<td>6</td>
		<td>7</td>
		<td><button onclick="location.href='<%=request.getContextPath()%>/stockSearch'">aa</button>
		<button onclick="closeFullscreen();">Close Fullscreen</button>
		</td>
	</tr>
	
</table>
</section>

</body>
</html>