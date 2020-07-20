<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.Evaluation" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="evaluation" class="evaluation.Evaluation" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 게시판</title>
</head>
<body>
	 <%
	 	String userID = null;
	 	if(session.getAttribute("userID") != null){
	 		userID = (String) session.getAttribute("userID");
	 	}
	 	if(userID == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	} 
	 	else{
		 	int bbsID = 0; 
		 	if (request.getParameter("bbsID") != null){
		 		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		 	}
		 	if (bbsID == 0){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('유효하지 않은 글입니다.')");
		 		script.println("location.href = 'login.jsp'");
		 		script.println("</script>");
		 	}
		 	int likeEat = 0;
			int sosoEat = 0;
			int badEat = 0;
			
			if (request.getParameter("likeEat") != null){
				likeEat = Integer.parseInt(request.getParameter("likeEat"));
			}
			if (request.getParameter("sosoEat") != null){
				sosoEat = Integer.parseInt(request.getParameter("sosoEat"));
			}
			if (request.getParameter("badEat") != null){
				badEat = Integer.parseInt(request.getParameter("badEat"));
			}
			
			EvaluationDAO evaluationDAO = new EvaluationDAO();
			ArrayList<Evaluation> list = evaluationDAO.whereList(bbsID, userID);
			int result = 0;
			if (list.isEmpty()){
				result = evaluationDAO.write(bbsID, userID, likeEat, sosoEat, badEat);
			}
			else if (likeEat == list.get(0).getLikeEat() && sosoEat == list.get(0).getSosoEat() && badEat == list.get(0).getBadEat()){
				result = evaluationDAO.delete(bbsID, userID);
			}
			else{
				result = evaluationDAO.update(bbsID, userID, likeEat, sosoEat, badEat);
			}
	 		if (result == -1){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('평가를 실패했습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	}
	 		
	 		else{
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("location.href=document.referrer;");
		 		script.println("</script>");
		 	}
	 	}
	 %>
</body>
</html>