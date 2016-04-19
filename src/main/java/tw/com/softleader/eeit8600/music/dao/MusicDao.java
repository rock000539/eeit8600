package tw.com.softleader.eeit8600.music.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.music.entity.MusicEntity;

public class MusicDao {

	public Connection getConnection() {
		Connection conn = null;
		try {
			String jdbcDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
			String dbUrl = "jdbc:sqlserver://softleader.com.tw:1433;database=EEIT86DB";
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(dbUrl, "EEIT86", "EEIT86");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public MusicEntity findById(int id) {
		
		MusicEntity music = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sqlCmd = "SELECT * FROM MUSIC WHERE ID="+id;
			System.out.println(sqlCmd);
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			if(rs.next()) {
				music = new MusicEntity();
				music.setId(rs.getInt("ID"));
				music.setMusicNo(rs.getString("MUSIC_NO"));
				music.setTitle(rs.getString("TITLE"));
				music.setAuthor(rs.getString("AUTHOR"));
				music.setPrice(rs.getInt("PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					rs = null;
				}
			}
			
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
		
		return music;
	}
	
	
	public List<MusicEntity> findAll() {
		
		List<MusicEntity> musics = new ArrayList<MusicEntity>();
		MusicEntity music = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sqlCmd = "SELECT * FROM MUSIC ";
			System.out.println(sqlCmd);
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			while(rs.next()) {
				music = new MusicEntity();
				music.setId(rs.getInt("ID"));
				music.setMusicNo(rs.getString("MUSIC_NO"));
				music.setTitle(rs.getString("TITLE"));
				music.setAuthor(rs.getString("AUTHOR"));
				music.setPrice(rs.getInt("PRICE"));
				
				musics.add(music);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					rs = null;
				}
			}
			
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
		
		return musics;
	}
	
	
	public int insert(MusicEntity music) {
		
		int result = 0;
		
		Connection conn = null;
		Statement stmt = null;

		try {
			String sqlCmd = "INSERT INTO MUSIC(ID, MUSIC_NO, TITLE, AUTHOR, PRICE)"
					+ " VALUES ("+music.getId()+",'"+music.getMusicNo()+"','"+music.getTitle()+"','"+music.getAuthor()+"',"+music.getPrice()+")";
			
			System.out.println(sqlCmd);
			
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
	
	
	public int update(MusicEntity music) {
		
		int result = 0;
		
		Connection conn = null;
		Statement stmt = null;

		try {
			String sqlCmd = "UPDATE MUSIC SET "
						+ "MUSIC_NO='"+music.getMusicNo()+"',"
						+ "TITLE='"+music.getTitle()+"',"
						+ "AUTHOR='"+music.getAuthor()+"',"
						+ "PRICE="+music.getPrice()+" "
						+ "WHERE ID="+music.getId();
			
			System.out.println(sqlCmd);
			
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
	
	public int delete(int id) {
		
		int result = 0;
		
		Connection conn = null;
		Statement stmt = null;

		try {
			String sqlCmd = "DELETE FROM MUSIC WHERE ID="+id;
			
			System.out.println(sqlCmd);
			
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
