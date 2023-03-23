package com.shinhan.day03;

public class Person {
	//멤버변수: instance변수, static변수 (instance변수공유변수)
	static int numberOfPersons;
	int age;
	String name;
	
     Person() {
	    this(12, "Anonymous");					//생성자를 부를때는 첫번째줄부터 부를수잇음
    	age = 12;
	    name = "Anonymous";
	    numberOfPersons++;
	    
	}
	
	 Person(int age, String name) {
		
		this.age = age;
		this.name = name;
		numberOfPersons++;
		
	}
	
	 void selfIntroduce() {
		System.out.println("내 이름은" + name + "이며, 나이는" + age + "살 입니다.");
	}
	
     static int getPopulation() {
    	
    	return numberOfPersons;
    }
     

}
