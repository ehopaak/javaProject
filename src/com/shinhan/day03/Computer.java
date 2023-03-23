package com.shinhan.day03;

//javabeans기술 규격서 : field는 private(정보은닉)
public class Computer {
	private String model;
	private String os;
	private int price;
	static int count;			//변수 : instance변수, staic변수(class변수, object공유변수 )
	
	//Overloading : 생성자이름은 같고 매개변수 사양이 다르다.
	//하나의 생성자가 다른모양의 생성자를 호출할 수 있다.
	public Computer(){
		this("AA", "Mac", 500);
		
		
//		System.out.println("default 생성자로 생성");
//		this.model = "AA모델";
//		this.os = "Mac";
//		this.price = 500;
	}
	
	public Computer(String model){
		
		this("AA", null, 0);
		
//		System.out.println("arg1 default 생성자로 생성");
//		this.model = model;
	}
	public Computer(String os, int price){
		
		this(null, os, price);
		
//		System.out.println("arg2 default 생성자로 생성");
//		this.os = os;
//		this.price = price;
	}
	public Computer(String model, String os, int price){
		System.out.println("arg3 default 생성자로 생성");
		this.os = os;
		this.price = price;
		this.model = model;
		count++;
	}
	
	//일반메소드
	public void computerInfo() {
		System.out.println("model:" + model);
		System.out.println("os:" + os);
		System.out.println("price:" + price);
	}
	public String getModel() {
		
		return model;
	}
	public String getos() {
		return os;
		
	}
	public int getprice() {
		return price;
	}


}
