package tw.com.softleader.eeit8600.notebook.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.notebook.entity.Notebook;


public interface NotebookDao extends JpaRepository<Notebook,Long>{
	
	//public List<Notebook> findBypriceLessThan(Integer price);
	
}
/*
public class NotebookDao {
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
	
	public Notebook findById(int id) {
		String sqlcmd = "SELECT * FROM Notebook WHERE id=?";
		Notebook notebook = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlcmd);
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				notebook = new Notebook();
				notebook.setId(rs.getInt(1));
				notebook.setBrand(rs.getString(2));
				notebook.setName(rs.getString(3));
				notebook.setCpu(rs.getString(4));
				notebook.setPrice(rs.getInt(5));
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
		
		return notebook;
	}//end of findById
	
	
	public List<Notebook> findAll() {
		String sqlCmd = "SELECT * FROM Notebook";
		List<Notebook> notebooks = new ArrayList();
		Notebook notebook = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlCmd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				notebook = new Notebook();
				notebook.setId(rs.getInt(1));
				notebook.setBrand(rs.getString(2));
				notebook.setName(rs.getString(3));
				notebook.setCpu(rs.getString(4));
				notebook.setPrice(rs.getInt(5));
				notebooks.add(notebook);
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
		return notebooks;
	}//end of findAll
	
	public int insert(Notebook notebook) {
		String sqlCmd = "INSERT INTO Notebook(ID, BRAND, NAME, CPU, PRICE)"
				+ " VALUES ("+notebook.getId()+",'"+notebook.getBrand()+"','"+notebook.getName()+"','"+notebook.getCpu()+"','"+notebook.getPrice()+"')";
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
	
	public int update(Notebook notebook){
		String sqlCmd = "UPDATE Notebook SET "
				+ "BRAND='"+notebook.getBrand()+"',"
				+ "NAME='"+notebook.getName()+"',"
				+ "CPU='"+notebook.getCpu()+"',"
				+ "PRICE="+notebook.getPrice()+" "
				+ "WHERE ID="+notebook.getId();
		
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
		
		String sqlCmd = "DELETE FROM Notebook WHERE ID="+id;
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

*/	



