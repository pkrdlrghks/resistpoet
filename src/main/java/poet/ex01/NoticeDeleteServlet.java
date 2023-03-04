package poet.ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/noticeDeleteServlet")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int noticeNum=Integer.parseInt(request.getParameter("noticeNum"));
		NoticeVO vo=new NoticeVO();
		vo.setNoticeNum(noticeNum);
		NoticeDAO dao=new NoticeDAO();
		dao.delete(vo);
		response.sendRedirect("NoticeServlet");
	}

}
