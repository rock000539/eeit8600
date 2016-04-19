package tw.com.softleader.eeit8600.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.app.entity.App;

public class AppDao {

	public Connection getConnection() {

		Connection conn = null;
		String jdbcDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
		String dbUrl = "jdbc:sqlserver://softleader.com.tw:1433;database=EEIT86DB";

		try {
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(dbUrl, "EEIT86", "EEIT86");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public App select(Integer id) {

		App app = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlCmd = "SELECT * FROM APP WHERE ID=" + id.intValue();
		System.out.println(sqlCmd);

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			if (rs.next()) {
				app = new App();
				app.setId(rs.getInt("ID"));
				app.setName(rs.getString("NAME"));
				app.setEvaluation(rs.getInt("EVALUATION"));
				app.setDownload(rs.getInt("DOWNLOAD"));
				app.setUrl(rs.getString("URL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return app;
	}

	public List<App> select() {

		List<App> apps = new ArrayList<App>();
		App app = new App();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlCmd = "SELECT * FROM APP";
		System.out.println(sqlCmd);

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			while (rs.next()) {
				app = new App();
				app.setId(rs.getInt("ID"));
				app.setName(rs.getString("NAME"));
				app.setEvaluation(rs.getInt("EVALUATION"));
				app.setDownload(rs.getInt("DOWNLOAD"));
				app.setUrl(rs.getString("URL"));
				apps.add(app);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return apps;
	}

	public int insert(App app) {
		int result = 0;
		Connection conn = null;
		Statement stmt = null;
		String sqlCmd = "INSERT INTO APP(ID, NAME, EVALUATION, DOWNLOAD, URL) VALUES (" 
		+ app.getId().intValue() + ", '"+ app.getName() + "', " 
		+ app.getEvaluation().intValue() + ", " + app.getDownload().intValue()
		+ ", '" + app.getUrl() + "')";
		System.out.println(sqlCmd);

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sqlCmd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					stmt = null;
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					conn = null;
				}
			}
		}
		return result;
	}

	public int update(App app) {
		
		int result = 0;
		Connection conn = null;
		Statement stmt = null;
		String sqlCmd = "UPDATE APP SET " 
				+ "NAME='" + app.getName() 
				+ "', EVALUATION=" + app.getEvaluation().intValue() 
				+ ", DOWNLOAD=" + app.getDownload().intValue() 
				+ ", URL='" + app.getUrl() 
				+ "' WHERE ID=" + app.getId().intValue();
		System.out.println(sqlCmd);
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sqlCmd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					stmt = null;
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					conn = null;
				}
			}
		}
		return result;
	}
	
	public int delete(Integer id){
		
		int result = 0;
		Connection conn = null;
		Statement stmt = null;
		String sqlCmd = "DELETE FROM APP WHERE ID="+id.intValue();
		System.out.println(sqlCmd);
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sqlCmd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					stmt = null;
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					conn = null;
				}
			}
		}
		return result;
	}
}
