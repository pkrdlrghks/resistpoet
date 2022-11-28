package poet.ex01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null;
	DataSource dataSource = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
    // �����ڿ��� DB���� ����
    public MemberDAO() {
        try {
            Context init = new InitialContext();
            dataSource = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
            System.out.println("���� ����");
        } catch (Exception e) {
            System.out.println("���� ����");
            e.printStackTrace();
        }
    }
    //�α���
	public boolean login(MemberVO vo) {
		boolean check=false;
		String id=vo.getId();
		String pwd=vo.getPwd();
		try {
    		con = dataSource.getConnection();
            String query = "select * from member where id=? and pwd=?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, pwd);
            resultSet = preparedStatement.executeQuery();
            check=resultSet.next();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�α��� ��ȸ ����");
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		return check;
	}
	//ȸ������
	public void addMember(MemberVO vo) {
		try {
			con=dataSource.getConnection();
			String sql="insert into member values(?,?,?,?,?)";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, vo.getId());
			preparedStatement.setString(2, vo.getPwd());
			preparedStatement.setString(3, vo.getName());
			preparedStatement.setString(4, vo.getTel());
			preparedStatement.setString(5, vo.getEmail());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("ȸ�� �߰� ����");
		}finally {
			 try {
	                preparedStatement.close();
	                con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
		}
	}
	//���������� ����
	public MemberVO setMypage(String id) {
		MemberVO vo=new MemberVO();
		try {
			con=dataSource.getConnection();
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
            System.out.println("���������� ��ȸ ����");
		}finally {
			 try {
	                preparedStatement.close();
	                con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
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
			con=dataSource.getConnection();
			String sql="update member pwd=?,name=?,tel=?,email=? where id=?";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, pwd);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, tel);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, id);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� ���� ����");
		}finally {
			 try {
	                preparedStatement.close();
	                con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
		}
	}
	public boolean checkId(String chekingId) {
		boolean result=false;
		try {
			con=dataSource.getConnection();
			String sql="select id from member where id=?";
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1, chekingId);
			resultSet = preparedStatement.executeQuery();
			result=!resultSet.next();
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("�������� ���� ����");
		}finally {
			 try {
	                preparedStatement.close();
	                con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
		}
		return result;
		
	}
}
