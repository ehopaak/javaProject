package com.shinhan.day02;

import java.util.Scanner;

public class LAB1 {

	public static void main(String[] args) {
		
		method4();
		
		
		
		
		}

	private static void method4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("직각 역삼각형을 출력할 줄 수 : ");
		int rowCount = sc.nextInt();
		for(int row=1;row<=rowCount;row++) {
			for(int col=1;col<=rowCount+1-row;col++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		
	}

	private static void method3() {
		int end, total = 0;
		Scanner sc = new Scanner(System.in);
		end = sc.nextInt();
		int start = end%2 == 0?2:1;
		
		System.out.println("숫자를 입력하세요. : ");
		
		for(int i=start;i<=end;i+=2) {
			total =+ i;
			System.out.printf("결과 값 : %d", total);
		}
		
		
	}

	private static void method2() {
		
		int i = 0;
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열을 입력하세요. : ");
		String inputString = sc.nextLine();
		inputString = inputString.toUpperCase();
		
		for(i=1;i<=inputString.length();i++) {
			System.out.println(inputString.substring(0, i));
			
		}
		
	}

	private static void method1() {
		int start, end, inc, total = 0;
		Scanner sc = new Scanner(System.in);
		System.out.println("초기값을 정수로 입력하세요.:");
		start = sc.nextInt();
		System.out.println("마지막값을 정수로 입력하세요.:");
		end = sc.nextInt();
		System.out.println("증가분을 정수로 입력하세요.:");
		inc = sc.nextInt();
		System.out.println("총합은 " + total + " 입니다. ");
		
	}

	}


