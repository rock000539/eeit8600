package tw.com.softleader.eeit8600.drama.dao;

import java.sql.*;
import java.util.*;

import tw.com.softleader.eeit8600.drama.entity.Drama;

public class DramaDao {

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

	// findById
	public Drama findById(int id) {
		Drama drama = null;
		String sqlCmd = "SELECT * FROM DRAMA WHERE ID="+id;
		System.out.println(sqlCmd);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlCmd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				drama = new Drama();
				drama.setId(rs.getInt(1));
				drama.setName(rs.getString(2));
				drama.setEpisode(rs.getInt(3));
				drama.setActor(rs.getString(4));
				drama.setChannel(rs.getInt(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					rs= null;
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					pstmt=null;
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
		return drama;
	}

	// findAll
	public List<Drama> findAll() {
		List<Drama> dramas = new ArrayList<Drama>();
		Drama drama = null;
		String sqlCmd = "SELECT * FROM DRAMA";
		System.out.println(sqlCmd);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlCmd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				drama = new Drama();
				drama.setId(rs.getInt(1));
				drama.setName(rs.getString(2));
				drama.setEpisode(rs.getInt(3));
				drama.setActor(rs.getString(4));
				drama.setChannel(rs.getInt(5));
				dramas.add(drama);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					rs = null;
				}
			}
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
		return dramas;
	}

	// insert
	public int insert(Drama drama) {
		int result = 0;
		String sqlCmd = "INSERT INTO DRAMA (ID,NAME,EPISODE,ACTOR,CHANNEL) " + "VALUES (" + drama.getId() + ",'"
				+ drama.getName() + "'," + drama.getEpisode() + ",'" + drama.getActor() + "'," + drama.getChannel()
				+ ")";
		System.out.println(sqlCmd);
		Connection conn = null;
		Statement stmt = null;

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

	// update
	public int update(Drama drama) {
		int result = 0;
		String sqlCmd = "UPDATE DRAMA SET" + " NAME='" + drama.getName() + "', EPISODE=" + drama.getEpisode()
				+ ", ACTOR='" + drama.getActor() + "', CHANNEL=" + drama.getChannel() + " WHERE ID=" + drama.getId();
		System.out.println(sqlCmd);
		Connection conn = null;
		Statement stmt = null;
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
	
	//delete
	public int delete(int id){
		
		int result=0;
		String sqlCmd = "DELETE FROM DRAMA WHERE ID="+id;
		System.out.println(sqlCmd);
		Connection conn = null;
		Statement stmt = null;
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
	

}
