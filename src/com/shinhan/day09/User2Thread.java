package com.shinhan.day09;

import lombok.Setter;

@Setter
public class User2Thread extends Thread{
	
	Calculator calculator;
	User2Thread(){
		setName("User2Thread!!!");
	}
	
	@Override
	public void run() {
		calculator.setMemory(50);
		System.out.println(getName() + "");
	}

	
}
