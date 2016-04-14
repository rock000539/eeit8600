package tw.com.softleader.eeit8600.book.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.book.entity.Book;

public class BookDao {

	public Connection getConnection() {
		Connection conn = null;
		try {
			String jdbcDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
			String dbUrl = "jdbc:sqlserver://softleader.com.tw:1433;database=EEIT86DB";
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(dbUrl, "EEIT86", "EEIT86");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public Book findById(Long id) {
		
		Book book = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sqlCmd = "SELECT * FROM BOOK WHERE ID="+id;
			System.out.println(sqlCmd);
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			if(rs.next()) {
				book = new Book();
				book.setId(rs.getLong("ID"));
				book.setIsbnNo(rs.getString("ISBN_NO"));
				book.setName(rs.getString("NAME"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setPrice(rs.getInt("PRICE"));
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
		
		return book;
	}
	
	
	public List<Book> findAll() {
		
		List<Book> books = new ArrayList<Book>();
		Book book = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sqlCmd = "SELECT * FROM BOOK ";
			System.out.println(sqlCmd);
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			while(rs.next()) {
				book = new Book();
				book.setId(rs.getLong("ID"));
				book.setIsbnNo(rs.getString("ISBN_NO"));
				book.setName(rs.getString("NAME"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setPrice(rs.getInt("PRICE"));
				
				books.add(book);
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
		
		return books;
	}
	
	public int insert(Book book) {
		
		int result = 0;
		
		Connection conn = null;
		Statement stmt = null;

		try {
			String sqlCmd = "INSERT INTO BOOK(ID, ISBN_NO, NAME, AUTHOR, PRICE)"
					+ " VALUES ("+book.getId()+",'"+book.getIsbnNo()+"','"+book.getName()+"','"+book.getAuthor()+"',"+book.getPrice()+")";
			
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
	
	public int update(Book book) {
		
		int result = 0;
		
		Connection conn = null;
		Statement stmt = null;

		try {
			String sqlCmd = "UPDATE BOOK SET "
						+ "ISBN_NO='"+book.getIsbnNo()+"',"
						+ "NAME='"+book.getName()+"',"
						+ "AUTHOR='"+book.getAuthor()+"',"
						+ "PRICE="+book.getPrice()+" "
						+ "WHERE ID="+book.getId();
			
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
	
	public int delete(Long id) {
		
		int result = 0;
		
		Connection conn = null;
		Statement stmt = null;

		try {
			String sqlCmd = "DELETE FROM BOOk WHERE ID="+id;
			
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
