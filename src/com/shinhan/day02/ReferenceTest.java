package com.shinhan.day02;

import java.util.Arrays;

public class ReferenceTest {

	public static void main(String[] args) {
		f5();

	}

	private static void f5() {
		int pencils = 534;
		int students = 30;
		
		int pencilsPerStudents = pencils/students;
		System.out.println(pencilsPerStudents);
		
		int pencilsleft = pencils%students;
		System.out.println(pencilsleft);
		
		int value = 356;
		System.out.println(value - 56);
		
				
	}

	private static void f4() {
		String subjects = "자바,DB#HTML, CSS,JavaScript,React,Spring";
		String[] arr = subjects.split(",|#| ");
		System.out.println(Arrays.toString(arr));
		System.out.println(arr[4]);
		for(String s:arr) {
			System.out.println(s);
			
		}
		
	}

	private static void f3() {
		//String은 고정문자열
		String subject = "이것이 자바다";
		for(int i=0;i<subject.length();i++) {
			
			System.out.println(subject.charAt(i));
			System.out.println(subject.substring(i, i+1));
			
		}
		System.out.println(subject.replace("이", "AA"));
		System.out.println(subject);
		System.out.println(subject.replace("이", "BB"));		//대체
		System.out.println(subject);
		System.out.println(subject.indexOf("바다"));			//indexOf는 위치
		
	}

	private static void f2() {
		String name = null;					//null은 힙에 생성된 객체는 없다.
		System.out.println(name);
		System.out.println(name.length());	//nullpointerException
	}

	private static void f1() {
		int a =10;
		String s1 = "자바";					//compile시에 class의 상수pool, load시에 method영역에 
		String s2 = "자바";
		String s3 = new String("자바");
		String s4 = new String("자바");
		 
		System.out.println(s1==s2); 		//주소같다
		System.out.println(s3==s4); 		//주소다름
		s1 = s1 + "aa";
		s2 = s2 + "aa";
		System.out.println(s1==s2); 		//주소같다
		System.out.println(s1.equals(s2));  //내용이같다.
		System.out.println(s3.equals(s4));  //내용이같다.
		
	}

}
