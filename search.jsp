<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">

<title>맛집 게시판</title>
</head>
<body>
	<%
	 int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
	%>
	<div class="container" align="center">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">				
				<h3><br>검색창</h3>
				<form name="c_search">
					<input type="text" id="search">
					<input type="button" onclick="send(<%=boardID %>)" value="검색">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
<script>
	function send(boardID){
		var sb;
		var search = document.c_search.search.value;
		sb = "searchBbs.jsp?boardID="+boardID+"&search=" + search;
		window.opener.location.href= sb;
		window.close();
	}
</script>
</html>