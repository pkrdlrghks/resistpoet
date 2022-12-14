package poet.ex01;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ReviewDAO {
	final String DBURL="jdbc:mysql://database-1.c38cyhhw9v6s.ap-northeast-2.rds.amazonaws.com/poet";
	final String DBID="admin";
	final String DBPWD="fGpB5KsUW72M9rxjqmZf";
	Connection con = null;
	DataSource dataSource = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
    // 생성자에서 DB연결 설정
    public ReviewDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(DBURL,DBID,DBPWD);
            System.out.println("연결 성공");
        } catch (Exception e) {
            System.out.println("연결 실패");
            e.printStackTrace();
        }
    }
	
    //리스트 출력
    public ArrayList<ReviewVO> listView(String poetTitle) {
    	ArrayList<ReviewVO> listView = new ArrayList<ReviewVO>();
    	try {
            String query = "select * from reviewlist where poetTitle=? ORDER BY 5 DESC";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, poetTitle);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	ReviewVO vo=new ReviewVO();
            	vo.setId(resultSet.getString("id"));
				vo.setReview(resultSet.getString("review"));
				vo.setWriteDate(resultSet.getDate("writeDate"));
				listView.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("리뷰 조회 실패");
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
  //리뷰 추가
	public void addList(ReviewVO vo) {
		int index=1;
		try {
			String sql="select max(_index) as reviewNum from reviewlist";
			preparedStatement=con.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			index+=resultSet.getInt("reviewNum");
			System.out.println(index);
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("키 설정 실패");
		}
		try {
			String sql="insert into reviewlist(id,review,poetTitle,_index) value(?,?,?,?)";
			preparedStatement=con.prepareStatement(sql);
			preparedStatement.setString(1, vo.getId());
			preparedStatement.setString(2, vo.getReview());
			preparedStatement.setString(3, vo.getPoetTitle());
			preparedStatement.setInt(4, index);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("리뷰 추가 실패");
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
