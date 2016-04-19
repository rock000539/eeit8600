package tw.com.softleader.eeit8600.coffee.entity;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoffeeDAO  {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=java";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";

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
				result.setPrice(rs.getInt(3));
				//-------------
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
				pb.setPrice(rs.getInt(3));
				java.util.Date date=new java.util.Date(rs.getDate(4).getTime());
				pb.setMake(date);
				pb.setExpire(rs.getInt(5));
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

	private static final String INSERT = "insert into product (id, name, price, make, expire) values (?, ?, ?, ?, ?)";

	public CoffeeByParker insert(CoffeeByParker bean) {
		CoffeeByParker result = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(INSERT);
			pstm.setInt(1,bean.getId());
			pstm.setString(2, bean.getName());
			pstm.setFloat(3, bean.getPrice());
			java.sql.Date date=new java.sql.Date(bean.getMake().getTime());
			pstm.setDate(4,date);
			pstm.setInt(5,bean.getExpire());
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

	private static final String UPDATE = "update product set name=?, price=?, make=?, expire=? where id=?";
	public CoffeeByParker update(String name, double price, java.util.Date make, int expire, int id) {
		CoffeeByParker result = null;
		Connection conn=null;
		PreparedStatement pstm = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = conn.prepareStatement(UPDATE);
			pstm.setString(1,name);
			pstm.setDouble(2, price);
			java.sql.Date date=new java.sql.Date(make.getTime());
			pstm.setDate(3, date);
			pstm.setInt(4,expire);
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

