package poet.ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addreview")
public class addReview extends HttpServlet {
	
    public addReview() {
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id=(String)request.getSession().getAttribute("id");
		String review=(String)request.getParameter("review");
		String poitTitle=(String)request.getParameter("poetTitle");
		ReviewDAO dao=new ReviewDAO();
		dao.addList(id,review,poitTitle);
		response.sendRedirect("/setpoet?poetTitle="+poitTitle);
	}

}
