package com.shinhan.day02;

public class LAB3 {
	//public : 모든 Package에서 접근이 가능하다.
	//static : >java LAB3 실행하면 실행하기전에 LAB3 class의 byte코드가 method영역에 올라간다.
	//static붙은 method, variable들이 올라간다.
	//void return갑이 없다. 함수수행 후 돌아갈 때 값을 가지고 가지 않는다.

	public static void main(String[] args) {
		
		gcd(2,5);
		gcd(5,15);
		gcd(250,30);
//		double result = sum(1,100);
//		System.out.println(result);

	}

	private static void gcd(int i, int j) {
		int min = i>j?j:i;
		int result = 1;
		for(int r=min;r>=1;r--) {
			if(i%r==0 && j%r==0) {
				result = r;break;
			}
			System.out.println(result);
		}
	}

}
