package jdbcbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc_Example {
	public static void main(String[] args) {

		String url = "jdbc:mysql://127.0.0.1:3306/jdbc";
		String user = "root";
		String pass = "8328248036";

		try {
			Connection con = DriverManager.getConnection(url, user, pass);
			System.out.println("sql connected successfully");

			String select = "select * from teachers";

			String insert = "insert into teachers values (4,'yash',45)";

			String update = "update teachers set age=50 where name='yash'";

			Statement stm = con.createStatement();

			int x = stm.executeUpdate("row added: " + insert);
			System.out.println(x);

			int y = stm.executeUpdate(update);
			System.out.println(y);

			ResultSet rs = stm.executeQuery(select);
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				System.out.println(id + " " + name + " " + age);
			}
			con.close();
			System.out.println("connection closed!");

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
}
