package tw.com.softleader.eeit8600.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.app.entity.AppEntity;

public class AppDao {

	private static final String URL = "jdbc:sqlserver://softleader.com.tw:1433;database=EEIT86DB";
	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String USER = "EEIT86";
	private static final String PWD = "EEIT86";

	private static final String SELECT_ALL = "SELECT * FROM APP";
	private static final String SELECT_BY_ID = "SELECT * FROM APP WHERE ID=?";
	private static final String INSERT = "INSERT INTO APP VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE APP SET NAME=?, EVALUATION=?, DOWNLOAD=?, URL=? WHERE ID=?";
	private static final String DELETE = "DELETE FROM APP WHERE ID=?";

	public Connection getConnection() {

		Connection conn = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public List<AppEntity> select() {

		List<AppEntity> result = null;
		AppEntity app = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			result = new ArrayList<AppEntity>();
			conn = getConnection();
			pstmt = conn.prepareStatement(SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				app = new AppEntity();
				app.setId(rs.getInt("ID"));
				app.setName(rs.getString("NAME"));
				app.setEvaluation(rs.getInt("EVALUATION"));
				app.setDownload(rs.getInt("DOWNLOAD"));
				app.setUrl(rs.getString("URL"));
				result.add(app);
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
			if (pstmt != null) {
				try {
					pstmt.close();
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
		return result;
	}

	public AppEntity select(Integer id) {

		AppEntity result = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SELECT_BY_ID);
			pstmt.setInt(1, id.intValue());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new AppEntity();
				result.setId(rs.getInt("ID"));
				result.setName(rs.getString("NAME"));
				result.setEvaluation(rs.getInt("EVALUATION"));
				result.setDownload(rs.getInt("DOWNLOAD"));
				result.setUrl(rs.getString("URL"));
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
			if (pstmt != null) {
				try {
					pstmt.close();
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
		return result;
	}

	public AppEntity insert(AppEntity app) {

		AppEntity result = null;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setInt(1, app.getId().intValue());
			pstmt.setString(2, app.getName());
			pstmt.setInt(3, app.getEvaluation().intValue());
			pstmt.setInt(4, app.getDownload());
			pstmt.setString(5, app.getUrl());
			if (pstmt.executeUpdate() == 1)
				result = select(app.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					pstmt = null;
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

	public AppEntity update(String name, int evaluation, int download, String url, int id) {

		AppEntity result = null;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setString(1, name);
			pstmt.setInt(2, evaluation);
			pstmt.setInt(3, download);
			pstmt.setString(4, url);
			pstmt.setInt(5, id);
			if (pstmt.executeUpdate() == 1)
				result = select(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					pstmt = null;
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

	public boolean delete(Integer id) {

		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, id.intValue());
			if (pstmt.executeUpdate() == 1)
				result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					pstmt = null;
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
}
