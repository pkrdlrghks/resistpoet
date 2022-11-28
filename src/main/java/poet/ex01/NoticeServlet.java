package poet.ex01;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/NoticeServlet")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		NoticeDAO dao=new NoticeDAO();
		List<NoticeVO> vo=dao.list();
		request.setAttribute("noticevo", vo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/notice.jsp");
        requestDispatcher.forward(request, response);
		
		
	}

}
