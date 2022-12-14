package poet.ex01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MpageServlet
 */
@WebServlet("/mypageServlet")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id=request.getSession().getAttribute("id").toString();
		MemberDAO DAO=new MemberDAO();
		MemberVO vo= DAO.setMypage(id);
		request.setAttribute("setmypage", vo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/mypage.jsp");
        requestDispatcher.forward(request, response);
	}

}
