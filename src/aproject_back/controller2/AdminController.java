package aproject.controller2;

import java.sql.Date;
import java.util.List;
import java.util.Scanner;

import aproject.controller.DateUtil;
import aproject.model2.AdminService;
import aproject.view2.AdminView;
import aproject.vo2.AdminVO;
import aproject.vo2.ProVO;
import aproject.vo2.RelVO;


public class AdminController {
	static AdminVO admin;
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		AdminService aService = new AdminService();
		AdminVO tmp =null;
		while(true) {
			System.out.println("=================입출고관리시스템=================");
			System.out.println("1.관리자로그인");
			System.out.println("2.직원등록");
			System.out.println("3.구매(출고)");
			System.out.println("4.탈퇴");
			System.out.println("exit 종료");
			System.out.print("====작업선택>>");
			
			String job = sc.next();
			if(job.equals("exit")) break;
			switch (job) {
			case "1":
				System.out.print("ID 입력 >>");
				int adminid = sc.nextInt();
				
				System.out.print("password 입력 >>");
				String adminPwd = sc.next();
				admin=aService.getlogin(adminid, adminPwd);
				tmp = AdminView.print(admin);
				
				if(tmp != null ) {
					while(true) {
						System.out.println("1.상품입고");
						System.out.println("2.상품조회");
						System.out.println("3.입고내역조회");
						System.out.println("4.출고내역조회");
						System.out.println("logout ");
						System.out.print("====작업선택>>");
						
						String job2 = sc.next();
						if(job2.equals("logout")) break;
						switch (job2) {
						case "1":
							//상품입고
							AdminView.print(aService.selectAll());
							ProVO pro = makepro(sc);
							AdminView.print(aService.proUpdate(pro, admin.getId()));
							break;
						case "2":
							//전체물품조회
							AdminView.print(aService.selectAll());
							break;
						case "3":
							//입고내역조회
							AdminView.print3(aService.selectAll3());
							break;
						case "4":
							//출고내역조회
							AdminView.print2(aService.selectAll2());
							break;
							
						default:
							break;
						}
						
					}
					
				}else {
					//사용자 정보가 없습니다. 
					System.out.println("사용자 정보가 없습니다.");
				}
				break;	
				
			case "2":{
				AdminVO adm = makeadm(sc);
				AdminView.print(aService.admInsert(adm));
				break;
			}
			
			case "3":{
				AdminView.print(aService.selectAll());
				RelVO ctm = ctmrelease(sc);
				AdminView.print(aService.ctmUpdate(ctm));
				break; 
			}
			
			case "4":{
				System.out.print("==삭제할 관리자ID>>");
				int adminid_in = sc.nextInt();
				AdminView.print(aService.selectById(adminid_in));
				System.out.println("삭제를 계속진행(Y/N)");
				String yn = sc.next();
				if(yn.equals("Y")) {
					AdminView.print(aService.admDelete(adminid_in)); 
				}  
			} 
			
			default:
				break;
			}
		}
		System.out.println("수고하셨습니다.....");
	}

	private static ProVO makepro(Scanner sc) {
		System.out.print("1.입고할 상품의 상품코드 P_CODE>>");
		String ProCode = sc.next();
		System.out.print("2.입고할 상품의 개수 NUM>>");
		int ProNum = sc.nextInt();	
		System.out.print("3.입고할 상품의 가격 PRICE>>");
		int ProPrice = sc.nextInt();	
		
		ProVO pro = new ProVO();
		pro.setP_code(ProCode);
		pro.setNum(ProNum);
		pro.setPrice(ProPrice);	
		
		return pro;
	}
	
	//관리자생성
	private static AdminVO makeadm(Scanner sc) {
		System.out.print("1.생성할 관리자 사번 id>>");
		int AdmID = sc.nextInt();
		System.out.print("2.비밀번호 설정 password>>");
		String AdmPwd = sc.next();	
		System.out.print("3.관리자 핸드폰 번호 phone_number 010-xxxx-xxxx>>");
		String AdmPhnum = sc.next();
		System.out.print("4.관리자 입사일 hire_date yyyy/mm/dd>> ");
		String sdate = sc.next();
		Date AdmDate = DateUtil.convertToDate(sdate);
		
		
		AdminVO adm = new AdminVO();
		adm.setId(AdmID);
		adm.setPassword(AdmPwd);
		adm.setPhone_number(AdmPhnum);	
		adm.setHire_date(AdmDate);	
		
		return adm;
	}
	//출고
	private static RelVO ctmrelease(Scanner sc) {
		System.out.print("출고할 상품코드 P_CODE>>");
		String relcode = sc.next();
		System.out.print("1.출고할 상품 개수>>");
		int relnum = sc.nextInt();
		
		RelVO rel = new RelVO();
		rel.setP_code(relcode);
		rel.setNum(relnum);
		
		return rel;
	}

}