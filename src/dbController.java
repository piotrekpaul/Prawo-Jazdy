import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class dbController {

	public static String userName, password, host, dbname;
	static Connection conn = null;
	static Statement query = null;

	public dbController() {

		/*
		 * Dane konfiguracyjne bazy danych MySQL
		 */

		userName = "root";
		password = "";
		host = "jdbc:mysql://localhost:3306/";
		dbname = "naukajazdy";

		if (this.connect() != null) {

			try {
				
				query = conn.createStatement();
			} 
			
			catch (SQLException e) {
				
				System.out.println("Napotkano blad podczas tworzenia zapytania: "+ e.getMessage());
			}
		}

	}

	private Connection connect() {

		/*
		 * üˆczenie z bazˆ danych.
		 */

		try {
			
			conn = DriverManager.getConnection(host + dbname, userName,password);
			return conn;
		}

		catch (SQLException e) {
			
			System.out.println("Napotkano blad podczas ustanawiania polaczenia z baza danych: "+ e.getMessage());
			return null;
		}
	}

	public ResultSet getData (String what, String fromWhere) throws SQLException {
		ResultSet result = query.executeQuery("SELECT " + what + " from " + fromWhere);
		return result;
	}

	public static void main(String[] args) throws SQLException {
	
		dbController db = new dbController();
		
		while(db.getData("*", "users").next()) {
			System.out.println("Znaleziono rekord!");
		}
		
		
	}
}
