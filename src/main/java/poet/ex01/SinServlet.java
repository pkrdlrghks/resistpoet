package poet.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SinServlet
 */
@WebServlet("/sinServlet")
public class SinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		MemberDAO DAO=new MemberDAO();
		MemberVO vo=new MemberVO();
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setTel(tel);
		vo.setEmail(email);
		boolean clear=DAO.addMember(vo);
		if (clear) {
			PrintWriter w = response.getWriter();
	        w.write("<script>alert('회원가입이 완료 됐습니다.');location.href='login.html';</script>");
		}else {
			PrintWriter w = response.getWriter();
	        w.write("<script>alert('회원가입에 실패 했습니다.');location.href='sin.html';</script>");
		}
		
		
	}

}
