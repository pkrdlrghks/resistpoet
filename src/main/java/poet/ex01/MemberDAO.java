package poet.ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO extends DAO{
	
    //로그인
	public boolean login(MemberVO vo) {
		boolean check=false;
		String id=vo.getId();
		String pwd=vo.getPwd();
		try {
            String query = "select * from member where id=? and pwd=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, pwd);
            resultSet = preparedStatement.executeQuery();
            check=resultSet.next();
		} catch (Exception e) {
			e.printStackTrace();
        } finally {
            closeAll();
        }
		return check;
	}
	//회원가입
	public boolean addMember(MemberVO vo) {
		boolean clear=false;
		try {
			
			String sql="insert into member values(?,?,?,?,?)";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, vo.getId());
			preparedStatement.setString(2, vo.getPwd());
			preparedStatement.setString(3, vo.getName());
			preparedStatement.setString(4, vo.getTel());
			preparedStatement.setString(5, vo.getEmail());
			preparedStatement.executeUpdate();
			clear=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return clear;
	}
	//마이페이지 세팅
	public MemberVO setMypage(String id) {
		MemberVO vo=new MemberVO();
		try {
			
			String sql="select * from member where id=?";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet=preparedStatement.executeQuery();
			resultSet.next();
			String pwd=resultSet.getString("pwd");
			String name=resultSet.getString("name");
			String tel=resultSet.getString("tel");
			String email=resultSet.getString("email");			
			vo.setId(id);
			vo.setName(name);
			vo.setTel(tel);
			vo.setEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return vo;
	}
	public void updateMy(MemberVO vo) {
		String id=vo.getId();
		String pwd=vo.getPwd();
		String name=vo.getName();
		String tel=vo.getTel();
		String email=vo.getEmail();
		try {
			
			String sql="update member set pwd=?,name=?,tel=?,email=? where id=?";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, pwd);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, tel);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, id);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	public boolean checkId(String chekingId) {
		boolean result=false;
		try {
			
			String sql="select id from member where id=?";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, chekingId);
			resultSet = preparedStatement.executeQuery();
			result=!resultSet.next();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return result;
		
	}
}
