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

public class NoticeDAO {
	final String DBURL="jdbc:mysql://database-1.c38cyhhw9v6s.ap-northeast-2.rds.amazonaws.com/poet";
	final String DBID="admin";
	final String DBPWD="fGpB5KsUW72M9rxjqmZf";
	Connection con = null;
	DataSource dataSource = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
    // �����ڿ��� DB���� ����
	public NoticeDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(DBURL,DBID,DBPWD);
            System.out.println("���� ����");
        } catch (Exception e) {
            System.out.println("���� ����");
            e.printStackTrace();
        }
    }
	public List<NoticeVO> list() {
		List<NoticeVO> volistt=new ArrayList<NoticeVO>();
		try {
            String query = "select * from notice order by noticeNum desc";
            preparedStatement = con.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				NoticeVO vo=new NoticeVO();
				vo.setNoticeNum(resultSet.getInt("noticeNum"));
				vo.setTitle(resultSet.getString("title"));
				vo.setUploadDate(resultSet.getDate("uploadDate"));
				volistt.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� ����Ʈ ��ȸ ����");
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		return volistt;
	}
	//�������� ���
	public NoticeVO view(int noticeNum) {
		NoticeVO vo=new NoticeVO();
		try {
            String query = "select * from notice where noticeNum=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, noticeNum);
            resultSet = preparedStatement.executeQuery();
			resultSet.next();
			vo.setContent(resultSet.getString("content"));
			vo.setNoticeNum(resultSet.getInt("noticeNum"));
			vo.setTitle(resultSet.getString("title"));
			vo.setUploadDate(resultSet.getDate("uploaddate"));
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� �ҷ����� ����");
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		return vo;
	}
	//�������� ���
	public void add(NoticeVO vo) {
		try {
            String query = "insert into notice(content, title) values(?,?,?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, vo.getContent());
            preparedStatement.setString(2, vo.getTitle());
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� �߰� ����");
        } finally {
            try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
	}
	//�������� ����
	public void update(NoticeVO vo) {
		try {
            String query = "update notice set title=?,content=? where noticeNum=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, vo.getTitle());
            preparedStatement.setString(2, vo.getContent());
            preparedStatement.setInt(3, vo.getNoticeNum());
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� ���� ����");
        } finally {
            try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
	}
	public void delete(NoticeVO vo) {
		try {
            String query = "deletr notice where noticeNum=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, vo.getNoticeNum());
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� �߰� ����");
        } finally {
            try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
	}
	public void write(NoticeVO vo) {
		try {
			con = dataSource.getConnection();
            String query = "insert into notice title=?, content=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, vo.getTitle());
            preparedStatement.setString(2, vo.getContent());
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� ���� ����");
        } finally {
            try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
	}
}
