package poet.ex01;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/noticeControllServlet")
public class NoticeControllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String controllKey=request.getParameter("controll");
		NoticeDAO dao=new NoticeDAO();
		NoticeVO vo=new NoticeVO();
		vo.setContent(request.getParameter("content"));
		vo.setNoticeNum(Integer.parseInt(request.getParameter("noticeNum")));
		vo.setTitle(request.getParameter("title"));
		if(controllKey.equals("add")) {
			dao.add(vo);
		}else if(controllKey.equals("update")) {
			dao.update(vo);
		}else if (controllKey.equals("delete")){
			dao.delete(vo);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/notice.jsp");
        requestDispatcher.forward(request, response);
	}
}
