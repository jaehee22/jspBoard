<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="evaluation.Evaluation" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>맛집 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		Comment comment = new CommentDAO().getComment(bbsID);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">
				<p style="font-weight: bold">여기 맛있어</p>
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<% if (boardID == 1){ %>
					<li class="active"><a href="bbs.jsp?boardID=1">맛집 평가</a></li>
					<li><a href="bbs.jsp?boardID=2">자유 게시판</a></li>
				<%} else if(boardID == 2){ %>
					<li><a href="bbs.jsp?boardID=1">맛집 평가</a></li>
					<li class="active"><a href="bbs.jsp?boardID=2">자유 게시판</a></li>
				<% } %>
			</ul>
			<%
				if(userID == null){		//로그인이 되어있지 않은 경우
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false">접속하기<span class="caret"></span></a>
        			<ul class="dropdown-menu">
        				<a href="login.jsp">로그인</a></li>
              			<li><a href="join.jsp">회원가입</a></li>
        			</ul>
         		</li>
       		</ul>
			<% 
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false">회원관리<span class="caret"></span></a>
        		<ul class="dropdown-menu">
              		<a href="logout.jsp">로그아웃</a></li>
            	</ul>    
         		</li>
       		</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="4" style="background-color: #eeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="3"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="3"><%= bbs.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="3"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" +  bbs.getBbsDate().substring(14,16) + "분"  %></td>
						</tr>
							<% 	
								String real = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\bbsUpload";
								File viewFile = new File(real+"\\"+bbsID+"사진.jpg");
								if(viewFile.exists()){
							%>
								<tr>
									<td><br><br><br><br><br><br><br><br>이미지</td>
									<td colspan="3" align="center"><img src = "bbsUpload/<%=bbsID %>사진.jpg" border="300px" width="300px" height="300px"></td>
								</tr>
							<%} %>
						
						<tr>
							<td>내용</td>
							<td colspan="3" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
						</tr>
						<% if(boardID==1){ %>
						<tr>
							<td></td>
							<td><button onclick="location.href='evaluationAction.jsp?likeEat=1&sosoEat=0&badEat=0&bbsID=<%=bbsID%>'">좋아요</button></td>		
							<td><button onclick="location.href='evaluationAction.jsp?likeEat=0&sosoEat=1&badEat=0&bbsID=<%=bbsID%>'">그럭저럭</button></td>		
							<td><button onclick="location.href='evaluationAction.jsp?likeEat=0&sosoEat=0&badEat=1&bbsID=<%=bbsID%>'">맛없어요</button></td>		
						</tr>
						<tr>
							<%	
								int like = 0;
								int soso = 0;
								int bad = 0;
								EvaluationDAO evaluationDAO = new EvaluationDAO();
								ArrayList<Evaluation> list = evaluationDAO.getList(bbsID);
								for(int i=0; i<list.size(); i++){
									like = like + list.get(i).getLikeEat();
									soso = soso + list.get(i).getSosoEat();
									bad = bad + list.get(i).getBadEat();
								}
							%>
							<td></td>
							<td>(<%= like %>)</td>		
							<td>(<%= soso %>)</td>
							<td>(<%= bad %>)</td>
						</tr>
						<% } %>
			</table>				
		</div>
		<div style="text-align:right">
			<a href="bbs.jsp?boardID=<%=boardID %>" class="btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
						<a href = "update.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary">삭제</a>
				
				<%
					}
				%>
			<a><br><br></a>	
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<%
						CommentDAO commentDAO = new CommentDAO();
						ArrayList<Comment> list = commentDAO.getList(boardID, bbsID);
						for(int i=0; i<list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getCommentText() %></td>
						<td><%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>
						<td><%
								if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){
							%>
									<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>
							<%
								}
							%>	
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>			
		</div>
	</div>
	<div class="container">
		<div class="form-group">
		<form method="post" action="commentAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID%>">
				<table class="table table-striped" style="text-align: center;">
					<tr>
						<td valign="middle"><br><br><%= userID %></td>
						<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
						<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
					</tr>
				</table>
		</form>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>