package com.shinhan.day02;

public class OperatorTest {

	public static void main(String[] args) {
		method7();

	}

	private static void method7() {
		int a = 70;
		int b = 20;
		if(a>=70) {
			System.out.println("합격");
		}else {
			System.out.println("불합격");
		}
		
		System.out.println(a>=70?"합격":"불합격");			//삼항연산자 if else 부분을 한줄로 생략할 수 있음
		
		System.out.println(a+20>10 && ++a<=20);
		
	}

	private static void method6() {
		int a = 10;
		a++;
		++a;
		a += 1;
		System.out.println(a);
		
		
		int b = 20;
		System.out.println(b);
		
	}

	private static void method5() {
		
		int a = 10;
		int b = 20;
		System.out.println(a==b);
		System.out.println(a!=b);
		System.out.println(!(a==b));
		
	}

	private static void method4() {
		
		int a = 10;
		int b = 20;
		
		//|| (단축) : 앞의 결과가 참이면 뒷부분 수행안함
        //| : 무조건 끝까지 수행한다.
		boolean result1 = a>10 || ++b==20;
		boolean result2 = a>10 | ++b==20;
		
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(b);
		
	}

	private static void method3() {
		int a = 10;
		int b = 20;
		
		//&& (단축) : 앞의 결과가 거짓이면 뒷부분 수행안함
        //& : 무조건 끝까지 수행한다.
		boolean result1 = a>10 && ++b==20;
		boolean result2 = a>10 & ++b==20;
		
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(b);
		
		
		
	}

	private static void method2() {
		
		int a = 10;
		int b = 0;					//정수는 0으로 나눌수없다. RunTimeException -> 컴피알시에는 오류가 없으나 실행시에 오류(ArithmeticException)가 남
		double d = 0.0;
		
		System.out.println(a%d);
		if(Double.isNaN(a/d)) {
			System.out.println("계산불가");
		} else {
			System.out.println(a/d);
		}
		
		System.out.println(Double.isInfinite(a/d));
		if(Double.isInfinite(a/d)) {
			System.out.println("계산불가");
		} else {
			System.out.println(a/d);
		}
		
		System.out.println("method end");
		
	}

	private static void method1() {
		
		int a = 10;
		int b = 20;
		a++;										//11
		++a;										//12
		System.out.println(++a);					//증가 후 사용 13		
		System.out.println(a++);					//사용 후 증가 13 출력 후 14갑 저장	
		
		System.out.println(a);						//14
		System.out.println("더하기: " + (a+b));		//문자+슛자 일 떄 (더하기는 연결)
		System.out.println("뺴기: " + (a-b));			//문자는 빼기 없움
		System.out.println("곱하기: " + a*b);
		System.out.println("나누기: " + a/b);
		System.out.println("나머지" + a%b);
		
	}

}
