package tw.com.softleader.eeit8600.movie.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.movie.entity.Movie;

public class MovieDao {
	
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
	
	public Movie findById(int id) {
		String sqlcmd = "SELECT * FROM MOVIE WHERE id=?";
		Movie movie = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlcmd);
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				movie = new Movie();
				movie.setId(rs.getInt(1));
				movie.setName(rs.getString(2));
				movie.setActor(rs.getString(3));
				movie.setTypes(rs.getString(4));
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
		
		return movie;
	}//end of findById
	
	public List<Movie> findAll() {
		String sqlCmd = "SELECT * FROM MOVIE";
		List<Movie> movies = new ArrayList();
		Movie movie = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlCmd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				movie = new Movie();
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setActor(rs.getString("actor"));
				movie.setTypes(rs.getString("types"));
				movies.add(movie);
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
			if (conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
		}
		return movies;
	}//end of findAll
	
	public int insert(Movie movie) {
		String sqlCmd = "INSERT INTO MOVIE(id, NAME, ACTOR, TYPES)"
				+ " VALUES ("+movie.getId()+",'"+movie.getName()+"','"+movie.getActor()+"','"+movie.getTypes()+"')";
		System.out.println(sqlCmd);
		
		int rs = 0;
		Connection conn = null;
		Statement stmt = null;
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeUpdate(sqlCmd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
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
		
		return rs;
	}//end of insert
	
	public int update(Movie movie){
		String sqlCmd = "UPDATE MOVIE SET "
				+ "NAME='"+movie.getName()+"',"
				+ "ACTOR='"+movie.getActor()+"',"
				+ "TYPES='"+movie.getTypes()+"' "
				+ "WHERE ID="+movie.getId();
		
		System.out.println(sqlCmd);
		
		int rs = 0;
		
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeUpdate(sqlCmd);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
			if (conn !=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
		}
		
		return rs;
	}

	public int delete(int id) {
		String sqlCmd = "DELETE FROM MOVIE WHERE ID="+id;
		System.out.println(sqlCmd);
		int rs = 0;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeUpdate(sqlCmd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
			if (conn !=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
		}
		
		return rs;
	}//end of delete
	
}//end of class
