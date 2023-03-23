package com.shinhan.day01;

public class StringTest {

	public static void main(String[] args) {
		f8();

	}

	private static void f8() {
		int a = 10;
		float b = 20.12345f;
		System.out.println("!!a = " + a + ", !!b = " + b);
		System.out.println("---------------");
		//%-5d : -는 왼쪽정렬, d : decimal
		//%3.1f : 전체자리수.소수아래자리수 float
		System.out.printf("!a = %d, !!b = 3.1%f", a, b);
		
		
	}

	private static void f7() {
		int a = 100;
		{
			int b = 200;					//b라는 변수는 {}내에서 선언되었기 때문에 밖에서는 쓸수없음.
			System.out.println(a+b);
		}
		//block 벗어나서 변수사용 x
		//System.out.println(a+b);
	}

	private static void f6() {
		//자바기본타입 : data저장, 연산, 비교
		//byte, short, char, int, long, float, double, boolean
		//wrapper Class : 자바기본타입 + 기능(함수)
		//Byte, Short, Character, Integer, Long, Float, Double, Boolean
		String score = "90";
		int i = 100;
		Integer i2 = 100;
		String str = String.valueOf(i);
		String str2 = i + "";
		System.out.println(Integer.parseInt(score) + 10); 					//wrapper Class 
		
	}

	private static void f5() {
		byte v1 = 100;
		byte v2 = 100;
		//사칙연산식에서 byte가 자동으로 int
		byte v3 = (byte) (v1 + v2);
		int v4 = v1 + v2;
		System.out.println(v3);
		System.out.println(v4);
	}

	private static void f4() {
		//강제 형변환...data 손실가능성
		//작은방 = (작은방타입)큰값
		byte v1;
		int v3 = 130;
		v1 = (byte)v3;
		
		System.out.println(v1);
	}

	private static void f3() {
		//자동 형변환
		//큰방 = 작은값 
		//byte(1) < short(2) < int(4) < long(8) < float(4) < double(8)
		//          char(2)
		//boolea
		byte v1 = 127;
		short v2 = v1;
		int v3 = v1;
		long v4 = v1;
		float v5 = v1;
		double v6 = v1;
		
		System.out.println(v2);
		System.out.println(v3);
		System.out.println(v4);
		System.out.println(v5);
		System.out.println(v6);
		
		v3 = 10000;
		v4 = v3;
		v5 = v3;
		v6 = v3;
		
	}

	private static void f2() {
		String str1 = "자바 '프로그램' 완성";
		String str2 = "자바 \"프로그램\" 완성";
		String str3 = "{\"name\": \"홍\", \"age\": 20}";					//json 자바스크립트형태의 문자열
		String str4 = """
				{"name" : "홍", "age" :20 }
				""";
		
		System.out.println(str1);
		System.out.println(str2);
		System.out.println(str3);
		System.out.println(str4);
		
		
	}

	private static void f1() {
		//java.base모듈 java.lang패키지 String class
		//기본형이 아님
		//String : 고정문자열
		String s1 = "자바";					//컴파일시점에 .class의 상수pool
		String s2 = "자바";					
		String s3 = new String ("자바");		//실행시점에 만들어짐
		String s4 = new String ("자바");		
		
		System.out.println(System.identityHashCode(s1));
		System.out.println(System.identityHashCode(s2));
		System.out.println(s1 == s2);
		System.out.println(System.identityHashCode(s3));
		System.out.println(System.identityHashCode(s4));
		System.out.println(s3 == s4);
		
		s1 = s1 + "프로그램";
		s2 = s2 + "프로그램";
		
		System.out.println(System.identityHashCode(s1));
		System.out.println(System.identityHashCode(s2));
		System.out.println(s1 == s2);
		
		//dangling -> garbage collector 빈값을 자동으로 삭제해줌
		
		
		
		
	}

}
