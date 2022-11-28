package poet.ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/noticeUpdateServlet")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		NoticeVO vo=new NoticeVO();
		vo.setContent(request.getParameter("content").toString());
		vo.setNoticeNum(Integer.parseInt(request.getParameter("noticeNum")));
		vo.setTitle(request.getParameter("title").toString());
		NoticeDAO dao=new NoticeDAO();
		dao.update(vo);
		response.sendRedirect("/notice.jsp");
	}

}
