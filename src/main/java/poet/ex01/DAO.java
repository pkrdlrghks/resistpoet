package poet.ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	final String DBURL="jdbc:mysql://localhost:3306/poet";
	final String DBID="root";
	final String DBPWD="123456789";
	Connection con = null;
	DataSource dataSource = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
    // �����ڿ��� DB���� ����
    public DAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(DBURL,DBID,DBPWD);
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }
}

