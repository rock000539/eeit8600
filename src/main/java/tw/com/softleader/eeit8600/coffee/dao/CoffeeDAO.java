package tw.com.softleader.eeit8600.coffee.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.coffee.entity.CoffeeByParker;

public class CoffeeDAO  {
	private static final String URL = "softleader.com.tw";
	private static final String USERNAME = "EEIT86";
	private static final String PASSWORD = "EEIT86";

	private static final String SELECT_BY_ID = "select * from product where id=?";

	public CoffeeByParker select(int id) {
		// SELECT_BY_ID ="select * from product where id=?";
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		CoffeeByParker result = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(SELECT_BY_ID);
			pstm.setInt(1, id);
			rs = pstm.executeQuery();

			if (rs.next()) {
				result = new CoffeeByParker();
				result.setId(rs.getInt(1));
				result.setName(rs.getString(2));
				result.setLocal(rs.getString(3));
				result.setTesting(rs.getString(4));
				result.setPrice(rs.getInt(5));			
			}

			return result;
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

		return result;
	}

	private static final String SELECT_ALL = "select * from product";

	public List<CoffeeByParker> select() {

		List<CoffeeByParker> result = new ArrayList<CoffeeByParker>();
		Connection conn = null;
		PreparedStatement pstm = null;
		CoffeeByParker pb = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(SELECT_ALL);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				pb = new CoffeeByParker();// ---------------------
				pb.setId(rs.getInt(1));
				pb.setName(rs.getString(2));
				pb.setLocal(rs.getString(3));
				pb.setTesting(rs.getString(4));
				pb.setPrice(rs.getInt(5));		
				result.add(pb);
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

	private static final String INSERT = "insert into product (id, name, local, testing, price) values (?, ?, ?, ?, ?)";

	public CoffeeByParker insert(CoffeeByParker bean) {
		CoffeeByParker result = null;
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

	private static final String UPDATE = "update product set NAME=?, LOCAL=?, TESTING=?, PRICE=? where id=?";
	public CoffeeByParker update(String name,String local,String testing,int price, int id) {
		CoffeeByParker result = null;
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
		return result;
	}

	private static final String DELETE = "delete from product where id=?";
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

