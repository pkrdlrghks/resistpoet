package poet.ex01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	 Connection con = null;
	 DataSource dataSource = null;
     PreparedStatement preparedStatement = null;
     ResultSet resultSet = null;
    // �����ڿ��� DB���� ����
    public DAO() {
        try {
            Context init = new InitialContext();
            dataSource = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
            System.out.println("���� ����");
        } catch (Exception e) {
            System.out.println("���� ����");
            e.printStackTrace();
        }
    }
}
