package aproject.model2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shinhan.dbutil.OracleUtil;
import com.shinhan.dbutil.OracleUtil2;

import aproject.vo2.AdminVO;
import aproject.vo2.ProVO;
import aproject.vo2.RelVO;
import aproject.vo2.StoVO;

//DAO(Data Access Object):DB업무 ..CRUD..Insert,Select,Update,Delete 
public class AdminDAO {
	Connection conn;
	Statement st;
	PreparedStatement pst;// ?지원
	java.sql.CallableStatement cst;//SP지원
	ResultSet rs;
	int resultCount;// insert, update, delete건수
	
	//login
	public AdminVO getlogin(int adminid, String adminPwd) {
		
		AdminVO adm = null;
		
		String sql = "select * from admin where id = " + adminid +" and password = '"+ adminPwd+"'"  ;
		conn = OracleUtil2.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				adm = makeAdm(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil2.dbDisconnect(rs, st, conn);
		}
		return adm;
	}
	
	//상품조회
	public List<ProVO> selectAll() {
		String sql = "select * from product ";
		List<ProVO> prolist = new ArrayList<>();
		conn = OracleUtil2.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				ProVO pro = makepro(rs);
				prolist.add(pro);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			OracleUtil2.dbDisconnect(rs, st, conn);
		}
		return prolist;
	}
	
	//출고내역조회
	public List<RelVO> selectAll2() {
		String sql = "select * from release ";
		List<RelVO> rellist = new ArrayList<>();
		conn = OracleUtil2.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				RelVO rel = makepro2(rs);
				rellist.add(rel);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			OracleUtil2.dbDisconnect(rs, st, conn);
		}
		return rellist;
	}
	
	//입고내역조회
	public List<StoVO> selectAll3() {
		String sql = "select * from store ";
		List<StoVO> stolist = new ArrayList<>();
		conn = OracleUtil2.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				StoVO sto = makepro3(rs);
				stolist.add(sto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			OracleUtil2.dbDisconnect(rs, st, conn);
		}
		return stolist;
	}
	
	//로그인
	private AdminVO makeAdm(ResultSet rs) throws SQLException {
		AdminVO adm = new AdminVO();
		adm.setId(rs.getInt("id"));
		adm.setPassword(rs.getString("password"));
		adm.setHire_date(rs.getDate("hiredate"));
		adm.setPhone_number(rs.getString("Phonenumber"));

		return adm;
	}
	//상품입고
	
	public int proUpdate(ProVO pro, int adminid) {
		
		String sqlInsert = "insert into store( p_code, storedate, num, id ) values( ?,sysdate,?, ? ) ";
		String sqlSelect = "select count(*) from product where p_code = ?";
		String sqlUpdate  = """
				update product set num = num+?
				where p_code = ?
				""";
		String sqlInsert2  = """
				insert into  product values(?,?,?)
				""";
		
		conn = OracleUtil2.getConnection();
		try {
			conn.setAutoCommit(false);
			
			PreparedStatement pst2 = conn.prepareStatement(sqlSelect);
			pst2.setString(1, pro.getP_code() );
			ResultSet rs2 = pst2.executeQuery();
			rs2.next();
			if(rs2 !=null && rs2.getInt(1)==1)
			{
				PreparedStatement pst3 = conn.prepareStatement(sqlUpdate);
				pst3.setString(2, pro.getP_code() );
				pst3.setInt(1, pro.getNum() );
				pst3.executeUpdate();
				
			}else {
				PreparedStatement pst4 = conn.prepareStatement(sqlInsert2);
				pst4.setString(1, pro.getP_code() );
				pst4.setInt(2, pro.getPrice() );
				pst4.setInt(3, pro.getNum() );
				pst4.executeUpdate();
				
			}
			pst = conn.prepareStatement(sqlInsert);
			pst.setString(1, pro.getP_code() );
			pst.setInt(2, pro.getNum() );
			pst.setInt(3, adminid);
			pst.executeUpdate();
			conn.commit();
			resultCount=1;
		} catch (SQLException e) {
			resultCount=-1;
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			 OracleUtil2.dbDisconnect(null, pst, conn);
		}
		 
		return resultCount;
	}
	
	
	//직원등록
	public int admInsert(AdminVO adm) {
		String sql = """
				insert into admin
				values(?,?,?,?)
				""";
		conn = OracleUtil2.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, adm.getId() );
			pst.setString(2, adm.getPassword() );
			pst.setString(3, adm.getPhone_number() );
			pst.setDate(4, adm.getHire_date() );
			
			resultCount = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			 OracleUtil2.dbDisconnect(null, pst, conn);
		}
		return resultCount;
	}
	
	//한건의 직원을 삭제하기
	public int admDelete(int adminid) {
		String sql = """
				delete from admin
				where id = ?
				""";
		conn = OracleUtil2.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, adminid);

			resultCount = pst.executeUpdate();//DML문장실행한다.영향받은건수가 return 
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			resultCount = -1;
			e.printStackTrace();
		} finally {
			 OracleUtil.dbDisconnect(null, pst, conn);
		}
		System.out.println("delete결과:" + resultCount);
		return resultCount;
			
	}
	//한건조회
	public AdminVO selectById (int adminid) {
		AdminVO adm = null;
		String sql = "select * from admin where id = " + adminid;
		conn = OracleUtil2.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				adm = makeAdm(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil2.dbDisconnect(rs, st, conn);
		}
		return adm;
		
	}
	
	//출고
	public int ctmUpdate(RelVO ctm) {
		String sqlInsert = "insert into release( p_code, releasedate, num  ) values( ?,sysdate,? ) ";
		String sqlUpdate = """
				update product set num=num-?
				where p_code = ?
				
				""";
		conn = OracleUtil2.getConnection();
		try {
			conn.setAutoCommit(false);
			pst = conn.prepareStatement(sqlInsert);
			pst.setString(1, ctm.getP_code() );
			pst.setInt(2, ctm.getNum() );
			int resultCount1 = pst.executeUpdate();
			
			PreparedStatement pst2 = conn.prepareStatement(sqlUpdate);
			pst2.setString(2, ctm.getP_code() );
			pst2.setInt(1, ctm.getNum() );

			int resultCount2 = pst2.executeUpdate();//DML문장실행한다.영향받은건수가 return 
			
			
			resultCount= resultCount1+resultCount2;
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			 OracleUtil2.dbDisconnect(null, pst, conn);
		}
		System.out.println("update결과:" + resultCount);
		return resultCount;
		
	}

	
	
	private ProVO makepro(ResultSet rs) throws SQLException {
		ProVO pro = new ProVO();
		pro.setP_code(rs.getString("P_code"));
		pro.setPrice(rs.getInt("Price"));
		pro.setNum(rs.getInt("Num"));

		return pro;
	}
	private RelVO makepro2(ResultSet rs) throws SQLException {
		RelVO rel = new RelVO();
		rel.setP_code(rs.getString("P_code"));
		rel.setReleasedate(rs.getDate("releasedate"));
		rel.setNum(rs.getInt("Num"));

		return rel;
	}
	
	private StoVO makepro3(ResultSet rs) throws SQLException {
		StoVO sto = new StoVO();
		sto.setP_code(rs.getString("P_code"));
		sto.setStoredate(rs.getDate("storedate"));
		sto.setNum(rs.getInt("Num"));

		return sto;
	}
	
}