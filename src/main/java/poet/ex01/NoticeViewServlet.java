package poet.ex01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/noticeViewServlet")
public class NoticeViewServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int noticeNum=Integer.parseInt(request.getParameter("num"));
		NoticeDAO dao=new NoticeDAO();
		NoticeVO vo= dao.view(noticeNum);
		request.setAttribute("noticeView", vo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("./noticetext.jsp");
        requestDispatcher.forward(request, response);
	}

}
