import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbController {

	public static String userName, password, host, dbname;
	public static Connection conn = null;

	public dbController() {
		
		/*
		 * Dane konfiguracyjne bazy danych MySQL
		 */

		userName = "root";
		password = "";
		host = "jdbc:mysql://localhost:3306/";
		dbname = "naukajazdy";
		
		dbController.connect();
				
	}
	
	public static Connection connect() {
		

		/*
		 * üˆczenie z bazˆ danych.
		 */

		try {
			conn = DriverManager.getConnection(host + dbname, userName, password);
			return conn;
		}

		catch (SQLException e) {
			System.out
					.println("Napotkano b¸ˆd podczas ustanawiania po¸ˆczenia z bazˆ danych: "
							+ e.getMessage());
			return null;
		}
	}
}
