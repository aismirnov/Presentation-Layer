<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
						"http://www.w3.org/TR/html4/loose.dtd">
<%
Integer num1 = null, num2 = null, sum = null;
String num1Text = request.getParameter("num1");
String num2Text = request.getParameter("num2");
String error = new String();

//If the form form has been submitted
if(num1Text != null) {
	try {
		num1 = Integer.valueOf(num1Text);
	} catch(NumberFormatException e) {
		error += "<font color=\"red\">Error in number 1 format!</font><br>";
	}
	try {
		num2 = Integer.valueOf(num2Text);
	} catch(NumberFormatException e) {
		error += "<font color=\"red\">Error in number 2 format!</font><br>";
	}
}
if(num1 != null && num2 != null) {
	sum = num1 + num2;
}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Calculator</title>
	</head>
	<body style="text-align: center; vertical-align: center">
		<br>
		<form method="POST">
			<input type="text" name="num1" value="<%=num1Text == null ? "" : num1Text %>"> +
			<input type="text" name="num2" value="<%=num2Text == null ? "" : num2Text %>"> = 
			<input type="text" name="sum" value="<%=sum == null ? "" : sum %>" readonly>
			<input type="submit" value="Calculate">
		</form>
		<p>
		<%=error %>
		</p>
	</body>
</html>
