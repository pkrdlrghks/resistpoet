package poet.ex01;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;


@WebServlet("/setpoet")
public class SetPoet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String poetTitle=request.getParameter("poetTitle");
		String content= doGetFile(poetTitle);
		//doGetURL(request, response);
		ReviewDAO dao=new ReviewDAO();
		ArrayList<ReviewVO> reviewlist=dao.listView(poetTitle);
		request.setAttribute("content", content);
		request.setAttribute("reviewlist", reviewlist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/poetview.jsp");
        requestDispatcher.forward(request, response);
	}
	protected String doGetFile(String poetTitle) throws ServletException, IOException {
		String content=null;
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		    factory.setValidating(true);
		    factory.setIgnoringElementContentWhitespace(true);
		    DocumentBuilder builder = factory.newDocumentBuilder();
		    File file = new File("C:\\JAVAEXE\\poet\\src\\main\\webapp\\poet.xml");
		    Document doc = builder.parse(file);
		    Element root= doc.getDocumentElement();
		    Node node = root.getElementsByTagName(poetTitle).item(0);
            Transformer tf = TransformerFactory.newInstance().newTransformer();
            tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            Writer out = new StringWriter();
            tf.transform(new DOMSource(node), new StreamResult(out));
            content=out.toString();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return content;
	}
	protected void doGetURL(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String poetTitle=request.getParameter("name");
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		    factory.setValidating(true);
		    factory.setIgnoringElementContentWhitespace(true);
		    DocumentBuilder builder = factory.newDocumentBuilder();
		    File file = new File("C:\\JAVAEXE\\poet\\src\\main\\webapp\\poet.xml");
		    /*URL url= new URL("http://127.0.0.1:8080/poet/poet.xml");
		    System.out.println("접속");
		    
		    BufferedReader buffer=new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		    System.out.println("읽기형식 지정");*/
		   //Document doc = (Document) builder.parse(buffer.readLine());
		    Document doc = builder.parse(file);
		    Element root= doc.getDocumentElement();
		    Node node = root.getElementsByTagName("poet").item(0);
            Transformer tf = TransformerFactory.newInstance().newTransformer();
            tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            Writer out = new StringWriter();
            tf.transform(new DOMSource(node), new StreamResult(out));
            String content=out.toString();
            //request.setAttribute("content", content);
            System.out.println(content);
           
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

}
