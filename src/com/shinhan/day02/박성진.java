package com.shinhan.day02;

import java.util.Scanner;
public class 박성진 {

	public static void main(String[] args) {
		
		//chap03
//		ch3_1();					//정답 : 11+ 20 = 31
//		ch3_2();  				    //정답 : 가
//		ch3_3();					//정답 : (pencils/students) , (pencils%students)
//		ch3_4();					//정답 : value - 56
//		ch3_5();					//정답 : 1,2,3
//		ch3_6();					//정답 : True, False
//		ch3_7();					//정답 : Double.isNaN(z)
//	     
//	    //chap04
//		ch4_1();					//정답 : 2 (switch 문에서는 정수타입만 사용가능)
//	  	ch4_2();					//(switch Expression) -> 교재 122p 예제 참고
//	  	ch4_3();					//(for문 중첩 3의 배수)
//	  	ch4_4();					//(주사위 합 경우의 수 출력)
//	  	ch4_5();					//(4x + 6y = 60의 해)
//	  	ch4_6();					//(*증가 출력)
//	  	ch4_7();					//(예금 출금 조회)

	}

	private static void ch4_7() {
		//while 문 Scanner nextLine 메소드 이용 예금 출금 조회 종료 출력
		int input, money = 0;
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("-----------------------------");
			System.out.println("1.예금 | 2.출금 | 3.잔고 | 4. 종료");
			System.out.println("-----------------------------");
			System.out.print("선택> ");
			input = sc.nextInt();
			
			if (input == 1) {
				System.out.print("예금액>");
				money += sc.nextInt();
			} 
			else if (input == 2) {
				System.out.print("출금액>");
				money -= sc.nextInt();
			}
			else if(input == 3) {
				System.out.println("잔고>" + money);
			}
			else if(input == 4) {
				break;
			} else {
				System.out.println("1,2,3,4 중 하나를 입력해주세요.");
				continue;
			}
			
		}
		System.out.print("프로그램 종료");
	}

	private static void ch4_6() {
		//*개수 증가 출력
		int i, j = 0;
		for(i=1;i<=5;i++) {
			for(j=1;j<=i;j++) {
				System.out.print("*");
				if(i == j) {
					System.out.println();
				}
			}
			
		}
		
	}

	private static void ch4_5() {
		//중첩 for문을 이용한 4x+5y = 60 방정식의 해 출력
		int x, y = 0;
		for(x=0;x<=10;x++) {
			for(y=0;y<=10;y++) {
				if((4*x + 5*y) == 60) {
					System.out.println("(" + x + "," + y + ")");
					
				}
				
			}
			
		}
		
	}

	private static void ch4_4() {
		//Math.random을 이용한 주사위 합 경우의 수 출력
		while(true) {
			int sum = 0;
			int score1 = (int)(Math.random()*6) + 1;			//Math.random은 0부터 but 주사위는 1부터6까지 있기 때문
			int score2 = (int)(Math.random()*6) + 1;
			sum = score1 + score2;
			System.out.println("(" + score1 + "," + score2 + ")");
			if(sum == 5) {
				System.out.println("주사위의 합이 5 프로그램 종료" + sum);
				break;
			}
		}
		
		
	}

	private static void ch4_3() {
		int i, sum = 0;
		for(i=1;i<=100;i++) {
			if(i%3 == 0) {
				sum += i;
			}
		}
		System.out.print(sum);
	}

	private static void ch4_2() {
		
		String grade = "B";
		int score1 = 0;
		
		switch (grade) {
		case "A" -> {
			score1 = 100;
		}
			
		case "B" -> {
			int result = 100 - 20;
			score1 = result;
		}
		default -> {
			score1 = 60;
		}
		
		}
		
	}

	private static void ch3_7() {
		double x = 5.0;
		double y = 0.0;
		double z = 5%y;
		
		if (Double.isNaN(z)) {
			System.out.println("0.0으로 나눌 수 없습니다.");
		}else {
			double result = z + 10;
			System.out.println("결과: " + result);
		}
		
	}

	private static void f3_6() {
		int x = 10;
		int y = 5;
		
		System.out.println((x>7) && (y<=5));			//True
		System.out.println((x%3 == 2) && (y%2 != 1));	//False
		
	}

	private static void ch3_5() {
		//사다리꼴 넓이를 소수점으로 나타내기
		int lengthTop = 5;
		int lengthBottom = 10;
		int height = 7;
		//double area = (lengthTop+lengthBottom)*height/2.0; 		//1번
		double area = (double)(lengthTop+lengthBottom)*height/2;	//3번
		System.out.println(area);
		
		
		
		
	}
	
	private static void ch3_4() {
		int value = 356;
		System.out.println(value - 56);
		
	}

	private static void ch3_1() {
		int pencils = 534;
		int students = 30;
		
		int pencilsPerStudents = (pencils/students);
		System.out.println(pencilsPerStudents);
		
		int pencilsleft = (pencils%students);
		System.out.println(pencilsleft);
	}

}