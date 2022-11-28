package poet.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String poetTitle=request.getParameter("poetTitle");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberDAO dao=new MemberDAO();
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		boolean loginCheck= dao.login(vo);
		if(loginCheck) {
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
			response.sendRedirect("/index.html");
		}else {
			PrintWriter w = response.getWriter();
	        w.write("<script>alert('아이디 또는 비밀번호가 틀립니다.');location.href='./login.html';</script>");
		}
	}

}
