package ru.bmstu.iu10.smirnov;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1, num2, sum;
		String answer;
		try {
			num1 = Integer.parseInt(request.getParameter("num1"));
			num2 = Integer.parseInt(request.getParameter("num2"));
			sum = num1 + num2;
			answer = num1 + " + " + num2 + " = " + sum;
		} catch(NumberFormatException e) {
			answer = "Type correct numbers!";
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			out.println("<html>");
			out.println("	<head>");
			out.println("		<title>Servlet Calculator</title>");
			out.println("	</head>");
			out.println("	<body>");
			out.println("		<h1>" + answer + "</h1>");
			out.println("	</body>");
			out.println("</html>");
		} finally {
			out.close();
		}
	}
}
