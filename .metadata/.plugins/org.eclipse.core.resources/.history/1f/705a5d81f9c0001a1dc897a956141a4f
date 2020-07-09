<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.JjimDAO" %>
<%@ page import="bbs.Jjim" %>
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
					<li class="active"><a href="bbs.jsp?boardID=1&pageNumber=1">맛집 평가</a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1">자유 게시판</a></li>
				<%} else if(boardID == 2){ %>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1">맛집 평가</a></li>
					<li class="active"><a href="bbs.jsp?boardID=2&pageNumber=1">자유 게시판</a></li>
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
        				<li><a href="login.jsp">로그인</a></li>
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
              		<li><a href="jjimBbs.jsp?pageNumber=1">찜목록</a></li>
              		<li><a href="logout.jsp">로그아웃</a></li>
            	</ul>    
         		</li>
       		</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-5">
		<div class="container">
			<table class="table table-haver" style="border: 1px solid #dddddd">
					<%if(boardID == 1){%>
					<tr>
						<td colspan="5" align="left" bgcolor="beige">&nbsp;&nbsp;[제목]&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						<%	JjimDAO jjimDAO = new JjimDAO();
							ArrayList<Jjim> list1 = jjimDAO.getJjim(userID, bbsID);
							if (list1.isEmpty()){%>
						<td align="right" bgcolor="beige"><button onclick = "location.href='jjimAction.jsp?bbsID=<%=bbsID%>'">찜하기</button></td>
						<%	}
							else{%>
						<td align="right" bgcolor="beige"><button onclick = "location.href='jjimAction.jsp?bbsID=<%=bbsID%>'">찜해제</button></td>
						<%	} %>						
					</tr>
					<%} 
					if (boardID == 2){%>
					<tr>
						<td colspan="6" align="left" bgcolor="beige">&nbsp;&nbsp;[제목]&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<%} %>	
					<tr>
						<td colspan="3" align="left">&nbsp;&nbsp;<%= bbs.getUserID() %></td>
						<td colspan="3" align="right"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" +  bbs.getBbsDate().substring(14,16) + "분"  %></td>
					</tr>
					<% 	
					String real = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\bbsUpload";
					File viewFile = new File(real+"\\"+bbsID+"사진.jpg");
					if(viewFile.exists()){
				%>
					<tr>
						<td colspan="6"><br><br><img src = "bbsUpload/<%=bbsID %>사진.jpg" border="300px" width="300px" height="300px"><br><br>
					<% }
					else {%><td colspan="6"><br><br><%} %>
						<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%><br><br></td>
					</tr>
					<%
						if(boardID==1){
						int like = 0;
						int soso = 0;
						int bad = 0;
						String Map = bbs.getMap().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>");
						EvaluationDAO evaluationDAO = new EvaluationDAO();
						ArrayList<Evaluation> list = evaluationDAO.getList(bbsID);
						for(int i=0; i<list.size(); i++){
							like = like + list.get(i).getLikeEat();
							soso = soso + list.get(i).getSosoEat();
							bad = bad + list.get(i).getBadEat();
						} %>
					<tr>
						<td colspan="6" align="left">&nbsp;&nbsp;[주소]&nbsp;&nbsp;<a href="https://map.naver.com/v5/search/<%=Map%>"><%=Map %></a></td>
					</tr>
					<tr align="center">
						<td colspan="2"><button onclick="location.href='evaluationAction.jsp?likeEat=1&sosoEat=0&badEat=0&bbsID=<%=bbsID%>'">좋아요(<%=like %>)</button></td>		
						<td colspan="2"><button onclick="location.href='evaluationAction.jsp?likeEat=0&sosoEat=1&badEat=0&bbsID=<%=bbsID%>'">그럭저럭(<%=soso %>)</button></td>		
						<td colspan="2"><button onclick="location.href='evaluationAction.jsp?likeEat=0&sosoEat=0&badEat=1&bbsID=<%=bbsID%>'">맛없어요(<%=bad %>)</button></td>		
					</tr>
					<tr>
					<%
						}
					%>
					<td colspan="6" align="center">	<a href="bbs.jsp?boardID=<%=boardID %>" class="btn-primary" >목록</a>
					<%
						if(userID != null && userID.equals(bbs.getUserID())){
					%>
							<a href = "update.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary">삭제</a>
					</td>
					</tr>
					<% } %>
			</table>		
		</div>
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
					<tr>
						<td align="left" bgcolor="beige">댓글</td>
					</tr>
					<tr>
						<%
							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList(boardID, bbsID);
							for(int i=0; i<list.size(); i++){
						%>
							<div class="container">
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
										<tr>						
										<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
										<td colspan="2"></td>
										<td align="right"><%
													if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){
												%>
														<form name = "p_search">
															<a type="button" onclick="nwindow(<%=boardID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">수정</a>
														</form>	
														<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?bbsID=<%=bbsID %>&commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>
																	
												<%
													}
												%>	
										</td>
										</tr>
										<tr>
											<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
											<% 	
												String commentReal = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\commentUpload";
												File commentFile = new File(commentReal+"\\"+bbsID+"사진"+list.get(i).getCommentID()+".jpg");
												if(commentFile.exists()){
											%>	
											<br><br><img src = "commentUpload/<%=bbsID %>사진<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>											
											<%} %>	
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
					</tr>
				</table>
			</div>
		</div>
		<div class="container">
			<div class="form-group">
			<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID%>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td style="border-bottom:none;" valign="middle"><br><br><%=userID %></td>
							<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
							<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="file" name="fileName"></td>
						</tr>
					</table>
			</form>
			</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	function nwindow(boardID,bbsID,commentID){
		window.name = "commentParant";
		var url= "commentUpdate.jsp?boardID="+boardID+"&bbsID="+bbsID+"&commentID="+commentID;
		window.open(url,"","width=600,height=230,left=300");
	}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>