package tw.com.softleader.eeit8600.coffee.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public class CoffeeDao  {
	private static final String URL = "jdbc:sqlserver://softleader.com.tw:1433;database=EEIT86DB";
	private static final String USERNAME = "EEIT86";
	private static final String PASSWORD = "EEIT86";

	private static final String SELECT_BY_ID = "select * from coffee where id=?";

	public Coffee select(Long id) {
		// SELECT_BY_ID ="select * from product where id=?";
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Coffee bean = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(SELECT_BY_ID);
			pstm.setLong(1, id);
			rs = pstm.executeQuery();

			if (rs.next()) {
				bean = new Coffee();
				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setLocal(rs.getString(3));
				bean.setTesting(rs.getString(4));
				bean.setPrice(rs.getInt(5));			
			}
			System.out.println(bean);
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstm != null) {
			try {
				pstm.close();
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

		return bean;
	}

	private static final String SELECT_ALL = "select * from coffee";

	public List<Coffee> select() {

		List<Coffee> result = new ArrayList<Coffee>();
		Connection conn = null;
		PreparedStatement pstm = null;
		Coffee bean = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(SELECT_ALL);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				bean = new Coffee();// ---------------------
				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setLocal(rs.getString(3));
				bean.setTesting(rs.getString(4));
				bean.setPrice(rs.getInt(5));		
				result.add(bean);
			}
			for(int i=0;i<result.size();i++){
				System.out.println(result.get(i));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstm != null) {
				pstm.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String INSERT = "insert into coffee (id, name, local, testing, price) values (?, ?, ?, ?, ?)";

	public Coffee insert(Coffee bean) {
		Coffee result = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(INSERT);
			
			pstm.setInt(1,bean.getId());
			pstm.setString(2,bean.getName());
			pstm.setString(3,bean.getLocal());
			pstm.setString(4,bean.getTesting());
			pstm.setInt(5,bean.getPrice());		
			
			int rs=pstm.executeUpdate();
			System.out.printf("Succese to insert %d data/n",rs);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstm != null) {
				pstm.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update coffee set NAME=?, LOCAL=?, TESTING=?, PRICE=? where id=?";
	public Coffee update(String name,String local,String testing,int price, int id) {
		Coffee bean = null;
		Connection conn=null;
		PreparedStatement pstm = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(UPDATE);
			pstm.setString(1,name);
			pstm.setString(2, local);		
			pstm.setString(3, testing);
			pstm.setInt(4,price);
			pstm.setInt(5,id);
			int rs=pstm.executeUpdate();
			System.out.printf("Succese to Update %d data/n",rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if (pstm!=null) {
					pstm.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bean;
	}
	public Coffee update(Coffee bean) {
		Coffee result = null;
		Connection conn=null;
		PreparedStatement pstm = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(UPDATE);
			pstm.setString(1,bean.getName());
			pstm.setString(2, bean.getLocal());		
			pstm.setString(3, bean.getTesting());
			pstm.setInt(4,bean.getPrice());
			pstm.setInt(5,bean.getId());
			int rs=pstm.executeUpdate();
			System.out.printf("Succese to Update %d data/n",rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if (pstm!=null) {
					pstm.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	private static final String DELETE = "delete from coffee where id=?";
	public boolean delete(int id) {
		Connection conn=null;
		PreparedStatement pstm = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(DELETE);
			pstm.setInt(1,id);
			int rs=pstm.executeUpdate();
			System.out.printf("Succese to DELETE %d data/n",rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if (pstm!=null) {
					pstm.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}

