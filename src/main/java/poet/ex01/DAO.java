package poet.ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	final String DBURL="jdbc:mysql://database-1.c38cyhhw9v6s.ap-northeast-2.rds.amazonaws.com/poet";
	final String DBID="admin";
	final String DBPWD="fGpB5KsUW72M9rxjqmZf";
	Connection con = null;
	DataSource dataSource = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
    // �����ڿ��� DB���� ����
    public DAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(DBURL,DBID,DBPWD);
            System.out.println("���� ����");
        } catch (Exception e) {
            System.out.println("���� ����");
            e.printStackTrace();
        }
    }
}

