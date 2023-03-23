package com.shinhan.day09;

public class ThreadA extends Thread{
	
	WorkObject workObject;
	public ThreadA(WorkObject obj) {
		// TODO Auto-generated constructor stub
	}
	public void TheadA(WorkObject workObject) {
		setName("ThreadA");
		this.workObject = workObject;
		
	}
	@Override
	public void run() {
		for(int i =1;i<=10;i++) {
			workObject.methodA();
		}
	}

}
