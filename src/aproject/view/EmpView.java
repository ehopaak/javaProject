package aproject.view;

import java.util.List;

import aproject.vo.EmpVO;

public class EmpView {
	
	public static void print(List<EmpVO> emplist) {
		System.out.println("================직원정보=============");
		for(EmpVO emp:emplist) {
			System.out.println(emp);
		}
	}
	
	public static void print(EmpVO emp) {
		System.out.println("================직원상세보기=============");
		if(emp==null) {
			System.out.println("직원이 존재하지 않습니다.");
		} else {
			System.out.println(emp);
		}
			
	}
	
	public static void print(String message) {
			System.out.println("[알림]" + message);
	}

}
