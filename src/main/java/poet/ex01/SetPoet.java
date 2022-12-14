package poet.ex01;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.net.ssl.HttpsURLConnection;
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

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;


@WebServlet("/setpoet")
public class SetPoet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String poetTitle=request.getParameter("poetTitle");
		String address=request.getRequestURL().toString().replace(request.getRequestURI(), "/poet/poet.xml");
		//String content= doGetURL(poetTitle,address);
		//String content= doGetFile(poetTitle);
		ReviewDAO dao=new ReviewDAO();
		ArrayList<ReviewVO> reviewlist=dao.listView(poetTitle);
		//request.setAttribute("content", content);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("poetTitle", poetTitle);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/poetview.jsp");
        requestDispatcher.forward(request, response);
	}
	/*protected String doGetFile(String poetTitle){
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
	protected String doGetURL(String poetTitle, String address) {
		String content=null;
		String xml=URLBuffer(address);
		System.out.println(xml);
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		    factory.setValidating(true);
		    factory.setIgnoringElementContentWhitespace(true);
		    DocumentBuilder builder = factory.newDocumentBuilder();
		    InputStream stream=new ByteArrayInputStream(xml.getBytes());
		    Document doc = builder.parse(stream);
		    Element root= doc.getDocumentElement();
		    Node node = root.getElementsByTagName(poetTitle).item(0);
            Transformer tf = TransformerFactory.newInstance().newTransformer();
            tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            Writer out = new StringWriter();
            tf.transform(new DOMSource(node), new StreamResult(out));
            content=out.toString();
		} catch (Exception e) {
			System.out.println("반영 실패");
			System.out.println(e);
			e.printStackTrace();
		}
		return content;
	}
	private String URLBuffer(String address) {
		System.out.println(address);
		String XML="";
		StringBuilder sBulder=new StringBuilder();
		try {
			URL url=new URL(address);
			HttpsURLConnection con=(HttpsURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setConnectTimeout(1000);
			con.setReadTimeout(1000);
			con.setRequestMethod("post");
			con.setRequestProperty("Accept-Charset", "UTF-8");
			con.setRequestProperty("CONTENT-TYPE","text/xml; charset=utf-8");
			InputStreamReader isr=new InputStreamReader(con.getInputStream(),"UTF-8");
			BufferedReader reader=new BufferedReader(isr);
			while (true) {
				String line=reader.readLine();
				if(line == null) {
					break;
				}
				sBulder.append(line.getBytes());
			}
			reader.close();
		XML=sBulder.toString();
		} catch (Exception e) {
			System.out.println("불러오기 실패");
			System.out.println(e);
			e.printStackTrace();
		}
		
		return XML;
	}*/

}
