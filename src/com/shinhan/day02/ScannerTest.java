package com.shinhan.day02;

import java.io.IOException;
//java.lang 패키지에있는 class는 import없이쓰지만 그외는 improt를 써야함
import java.io.InputStream;
import java.util.Scanner;

public class ScannerTest {

	public static void main(String[] args) throws IOException {
		f2();

	}

	private static void f2() {
		System.out.println("f2 function");
		
		
		Scanner sc = new Scanner(System.in);
		System.out.print("점수입력 >>");
		int score = sc.nextInt();					//nextInt는 숫자를 받음
		System.out.print("이름입력 >>");
		String name = sc.next();					//next는 문자를 받음
		System.out.print("메모 >>");
		sc.nextLine();
		String memo = sc.nextLine();
		System.out.println(memo);
		
		System.out.println(name + "==>" + score);
		
	}

	private static void f1() throws IOException {
		//사용자입력을 받고싶음
		System.out.println("f1 function");
		System.out.print("점수입력 >>");
		
		InputStream is = System.in;
		int i;
		while((i = is.read()) != 13) {
			System.out.print((char) i);
			
		}
		
	}

}
