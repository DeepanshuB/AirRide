<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<!-- Latest compiled CSS -->
	<link rel="stylesheet" href="css/back.css">
</head>
<body>
<%
session.invalidate();
RequestDispatcher rdisp=request.getRequestDispatcher("/index.jsp");
rdisp.forward(request, response);
%>
</body>
</html>