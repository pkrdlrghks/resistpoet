package poet.ex01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	Connection con = null;
	DataSource dataSource = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
    // 생성자에서 DB연결 설정
    public NoticeDAO() {
        try {
            Context init = new InitialContext();
            dataSource = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
            System.out.println("연결 성공");
        } catch (Exception e) {
            System.out.println("연결 실패");
            e.printStackTrace();
        }
    }
	public List<NoticeVO> list() {
		List<NoticeVO> volistt=new ArrayList<NoticeVO>();
		try {
			con = dataSource.getConnection();
            String query = "select * from notice order by noticeNum desc";
            preparedStatement = con.prepareStatement(query);
            resultSet = preparedStatement.executeQuery(query);
			while (resultSet.next()) {
				NoticeVO vo=new NoticeVO();
				vo.setNoticeNum(resultSet.getInt("noticeNum"));
				vo.setTitle(resultSet.getString("title"));
				vo.setUploadDate(resultSet.getDate("uploadDate"));
				volistt.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("공지사항 리스트 조회 실패");
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		return null;
	}
	//공지사항 뷰어
	public NoticeVO view(int noticeNum) {
		NoticeVO vo=new NoticeVO();
		try {
			con = dataSource.getConnection();
            String query = "select * from notice where noticeNum=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, noticeNum);
            resultSet = preparedStatement.executeQuery(query);
			resultSet.next();
			vo.setContent(resultSet.getString("content"));
			vo.setNoticeNum(resultSet.getInt("noticeNum"));
			vo.setTitle(resultSet.getString("title"));
			vo.setUploadDate(resultSet.getDate("uploaddate"));
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("공지사항 불러오기 실패");
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
	//공지사항 등록
	public void add(NoticeVO vo) {
		try {
			con = dataSource.getConnection();
            String query = "insert into notice(content, title) values(?,?,?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, vo.getContent());
            preparedStatement.setString(2, vo.getTitle());
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("공지사항 추가 실패");
        } finally {
            try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
	}
	//공지사항 수정
	public void update(NoticeVO vo) {
		try {
			con = dataSource.getConnection();
            String query = "update notice set title=?,content=? where noticeNum=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, vo.getTitle());
            preparedStatement.setString(2, vo.getContent());
            preparedStatement.setInt(3, vo.getNoticeNum());
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("공지사항 수정 실패");
        } finally {
            try {
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
	}
	public void delete(int noticeNum) {
		try {
			con = dataSource.getConnection();
            String query = "deletr notice where noticeNum=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, noticeNum);
            preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("공지사항 추가 실패");
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
            System.out.println("공지사항 쓰기 실패");
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
