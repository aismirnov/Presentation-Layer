<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%
String output = new String();

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

Integer empNo = null;
String eName = null;
String job = null;

try {
	conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Lesson22");
	String sqlQuery = "SELECT * from Employee";
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
	          ResultSet.CONCUR_UPDATABLE);
	rs = stmt.executeQuery(sqlQuery);
	//If the form form has been submitted
	if(request.getParameter("EMPNO") != null) {
		//try to add a new record
		try {
			empNo = Integer.valueOf(request.getParameter("EMPNO"));
			eName = request.getParameter("ENAME");
			job = request.getParameter("JOB_TITLE");
			if(eName.isEmpty() || job.isEmpty()) {
				throw new Exception("Name and Job fields cannot be emty!");
			}
			rs.moveToInsertRow();
			rs.updateInt(1, empNo);
			rs.updateString(2, eName);
			rs.updateString(3, job);
			rs.insertRow();
			rs.first();
		} catch (NumberFormatException ne) {
			out.println("<font color=\"red\">Wrong number format in ID!</font>");
		} catch (Exception e) {
			out.println("<font color=\"red\">"+e.getMessage()+"</font>");
		}
	}
	//display data from the table
	while (rs.next()) {
		empNo = rs.getInt("EMPNO");
		eName = rs.getString("ENAME");
		job = rs.getString("JOB_TITLE");
		output += "<tr><td>" + empNo + "</td><td>" + eName + "</td><td>" + job + "</td></tr>";
	}
} catch (SQLException se) {
	System.out.println("SQLERROR: " + se.getMessage() + " code: " + se.getErrorCode());
} catch (Exception e) {
	System.out.println(e.getMessage());
	e.printStackTrace();
} finally {
	try {
		rs.close();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Employee Database</title>
	</head>
	<body>
		<h3>Add new entry:</h3>
		<form method="POST">
			<input type="text" name="EMPNO" placeholder="Employee ID">
			<input type="text" name="ENAME" placeholder="Name">
			<input type="text" name="JOB_TITLE" placeholder="Job">
			<input type="submit" value="Add">
		</form>
		<br>
		<br>
		<table border="1">
			<tr>
				<td width="150"><b>Employee ID</b></td>
				<td width="150"><b>Name</b></td>
				<td width="150"><b>Job</b></td>
			</tr>
			<%=output %>
		</table>
	</body>
</html>
