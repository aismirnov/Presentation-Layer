<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
						"http://www.w3.org/TR/html4/loose.dtd">
<%
Integer num1 = (Integer)session.getAttribute("num1");
Integer num2 = (Integer)session.getAttribute("num2");
Integer result = (Integer)session.getAttribute("result");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Calculator</title>
	</head>
	<body style="text-align: center; vertical-align: center">
	<h1>
	<% if(result != null) { %>
		Sum of <font color="green"><%=num1 %></font>
		and <font color="green"><%=num2 %></font>
		is <font color="green"><%=result %></font>
	<%} else {%>
		There are no results to be shown
	<%} %>
	</h1>
	<h3><a href="CalcForm.jsp">go back to calculator form</a></h3>
	</body>
</html>
