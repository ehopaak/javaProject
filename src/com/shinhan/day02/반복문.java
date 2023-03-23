package com.shinhan.day02;

public class 반복문 {

	public static void main(String[] args) {
		forTest4();
		

	}
	private static void forTest4() {
		int i = 0;
		int sum = 0;
		for(;i<=10;++i) {
			if(i%2 != 0) continue; {
				sum += i;
				System.out.print(i);
				System.out.print(i==10? "":"+");
			}
			
		}
		System.out.println("=" + sum);
		
	}
	private static void whileTes3() {
		int i = 100;
		//do는 일단 한번 타고 조건비교 실행한다.
		do {
			if(i>10) break;
			System.out.println(i);
			i++;
		} while(i<=10);
		System.out.println("method end... " + i);
		
	}

	private static void whileTes2() {
		int i = 0;
		while(i<=10) {
			if(i>10) break;
			System.out.println(i);
			i++;
		}
		System.out.println("method end... " + i);
		
	}

	private static void whileTest() {
		int i = 0;
		while(true) {
			if(i>10) break;
			System.out.println(i);
			i++;
		}
		System.out.println("method end... " + i);
	}		
	

	private static void forTest2() {
		int i = 0;
		for(;;) {
			if(i>10) break;
			System.out.println(i);
			i++;
		}
		System.out.println("method end... " + i);
	}
		
	

	private static void forTest1() {
		int i = 0;
		for(i=1;i<=10;i++) {
			System.out.println(i);
		}
		System.out.println("method end... " + i);
	}

}
