package poet.ex01;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ReviewDAO {
	
	Connection con = null;
	 DataSource dataSource = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
   // �����ڿ��� DB���� ����
   public ReviewDAO() {
       try {
           Context init = new InitialContext();
           dataSource = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
           System.out.println("���� ����");
       } catch (Exception e) {
           System.out.println("���� ����");
           e.printStackTrace();
       }
   }
	
    //����Ʈ ���
    public ArrayList<ReviewVO> listView(String poetTitle) {
    	ArrayList<ReviewVO> listView = new ArrayList<ReviewVO>();
    	try {
    		con = dataSource.getConnection();
            String query = "select * from reviewlist where poet=? order by writedate desc";
            preparedStatement = con.prepareStatement(query);
            resultSet = preparedStatement.executeQuery(query);
            while (resultSet.next()) {
            	ReviewVO vo=new ReviewVO();
            	vo.setId(resultSet.getString("id"));
				vo.setReview(resultSet.getString("review"));
				vo.setWriteDate(resultSet.getDate("writeDate"));
				listView.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("���� ��ȸ ����");
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    	return listView;
	}

	public void addList(String id, String review, String poitTitle) {
		try {
			con=dataSource.getConnection();
			String sql="insert into reviewlist(id,review,poet) value(?,?,?)";
			preparedStatement=con.prepareStatement(sql);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, review);
			preparedStatement.setString(3, poitTitle);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("���� �߰� ����");
		}finally {
			try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
		}
		
	}
    
}
