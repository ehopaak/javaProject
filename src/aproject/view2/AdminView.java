package aproject.view2;

import java.util.List;

import aproject.vo2.AdminVO;
import aproject.vo2.ProVO;
import aproject.vo2.RelVO;
import aproject.vo2.StoVO;

public class AdminView {
	
	public static void print(String message) {
			System.out.println("[알림]" + message);
	}

	public static AdminVO print(AdminVO getlogin) {
		System.out.println("================"+ getlogin.getId() +"님 로그인 되었습니다.=============");
		return getlogin;
		
	}
	
	public static void print(List<ProVO> prolist) {
		System.out.println("================상품정보=============");
		for(ProVO pro:prolist) {
			System.out.println(pro);
		}
	}
	
	public static void print2(List<RelVO> rellist) {
		System.out.println("================출고내역=============");
		for(RelVO rel:rellist) {
			System.out.println(rel);
		}
	}
	
	public static void print3(List<StoVO> stolist) {
		System.out.println("================입고내역=============");
		for(StoVO sto:stolist) {
			System.out.println(sto);
		}
	}
	

}
