package com.shinhan.day03;

import java.util.Arrays;
import java.util.Scanner;

public class chapter05 {

	public static void main(String[] args) {
		//ch05_1();					//정답: 4
		//ch05_2();					//정답: 3
		//ch05_3();					//정답: 2
		//ch05_4();					//정답:2
		//ch05_5();					//정답:3
		//ch05_6();					//정답:3,5
		//ch05_7();					//정답:
		//ch05_8();					//정답:
		ch05_9();					//정답:
		
				//ch05_1();					//정답: 3
				//ch05_2();					//정답: 4
				//ch05_3();					//정답: 4
				//ch05_4();					//정답:3
				//ch05_5();					//정답:1
//				ch05_6();					//정답:1
//				ch05_7();					//정답:
//				ch05_8();					//정답:2
//				ch05_9();					//정답:
//				ch05_10();					//정답:
//				ch05_9();					//정답:
		

	}

	private static void ch05_9() {
		boolean run = true;
		Scanner scanner = new Scanner(System.in);
		int input = 0;
		int studentNum =0;
		int[] scores = null;
		
		
		while(run) {
			System.out.println("--------------------------------------------");
			System.out.println("1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료");
			System.out.println("--------------------------------------------");
			System.out.print("선택>");
			input = scanner.nextInt();
			
	   if(input == 1) {
				System.out.print("학생수>");
				studentNum += scanner.nextInt();
		} if(input == 2) {
			
		} if(input == 3) {
			
		} if(input == 4) {
		
		} if(input == 5) {
			break;
		}
		
	}
		System.out.print("프로그램종료");
		
	}

	private static void ch05_8() {
		int sum = 0;
		int students = 0;
		
		int[][] array = {
				{95, 86},
				{83, 92, 96},
				{78, 83, 93, 87, 88}
		};
		
		for(int i=0;i<array.length;i++) {
			students += array[i].length;
			for(int j=0;j<array[i].length;j++) {
				sum += array[i][j];
			}
		}
		double avg = (double) sum/students;
		System.out.println("총합: " + sum);
		System.out.println("평균: " + avg);
	}

	private static void ch05_7() {
		int[] array = {1,5,3,8,2};
		int max = 0;
		
		for(int i=0;i<5;i++) {
			for(int j=0;j<array[i];j++) {
				if(array[i] > max) {
					max = array[i];
				}
			}
			
		}
		System.out.println("최대값: " + max);
	}

	private static void ch05_6() {
		int[][] array = {
				{95, 86},
				{83, 92, 96},
				{78, 83, 93, 87, 88}
		};
		System.out.println(array.length);
		System.out.println(array[2].length);
		
	}

}
