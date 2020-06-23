<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %><!-- userdao의 클래스를 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
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
	 	if(userID != null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('이미 로그인이 되어 있습니다')");
	 		script.println("location.href = 'main.jsp'");
	 		script.println("</script>");
	 	}
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		//로그인 성공
		if(result==1){
			session.setAttribute("userID",user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		//로그인 실패
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//db오류
		else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>