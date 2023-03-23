package com.shinhan.day02;

public class Review {
	public static void main(String[] args) {
		System.out.println("main시작");
		f1();
		f2();
		System.out.println("main end");
	}

	private static void f2() {
		
	}

	private static void f1() {
		System.out.println("f1 function");
		//기본형 byte short char long  int float double boolean
		//형변환 
		byte v1 = 100;
		int v2;
		v2 = v1;
		//강제 형변환
		v1 = (byte) v2;
		
		//String은 기본형이 아니고 java.lang에 있는 String class
		String s = "100";
		int v3 = 0;
		Integer.parseInt(s);
		System.out.println(v3 + 300);
		
		
	}

}
