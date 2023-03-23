package aproject.model2;

import java.util.List;

import aproject.vo2.AdminVO;
import aproject.vo2.ProVO;
import aproject.vo2.RelVO;
import aproject.vo2.StoVO;



//Service : 업무로직 담당 
public class AdminService {

	AdminDAO admDao = new AdminDAO();
	
	//login
	public AdminVO getlogin(int adminid, String adminPwd) {
		return admDao.getlogin(adminid, adminPwd);
	}
	//상품조회
	public List<ProVO> selectAll() {
		return admDao.selectAll();
	}
	//입고내역 조회
	public List<StoVO> selectAll3() {
		return admDao.selectAll3();
	}
	
	//출고내역 조회
	public List<RelVO> selectAll2() {
		return admDao.selectAll2();
	}
	
	//사원ID 1개 선택
	public AdminVO selectById (int adminid) {
		return admDao.selectById(adminid);
	}
	
	//관리자등록
	public String admInsert(AdminVO adm) {
		int result = admDao.admInsert(adm);
		return result>0?"입력성공":"입력실패";
			
	}
	
	//관리자삭제
	public String admDelete(int adminid) {
		int result = admDao.admDelete(adminid);
		return result>0?"Delete 성공":"Delete 실패";
	}
	
	//입고
	public String proUpdate(ProVO pro, int adminid) {
		int result = admDao.proUpdate (pro, adminid);
		return result>0?"입력성공":"입력실패";
	}
			
	//출고
	public String ctmUpdate(RelVO ctm) {
		int result = admDao.ctmUpdate(ctm);
		return result>0?"입력성공":"입력실패";
					
	}		
}
