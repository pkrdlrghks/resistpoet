package poet.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/checkServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String chekingId=request.getParameter("checkingId").toString();
		MemberDAO dao=new MemberDAO();
		boolean checkResult=dao.checkId(chekingId);
		PrintWriter out=response.getWriter();
		String idResult="";
		String textResult="이미있는 아이디 입니다.";
		if(checkResult) {
			idResult=chekingId;
			textResult="사용가능한 아이디 입니다.";
		}
		out.println("<script type=\"text/javascript\">"
				+ "window.opener.form.id("+chekingId+")"
				+ "</script>"
				+ "사용가능한 아이디 입니다.");
	}

}
