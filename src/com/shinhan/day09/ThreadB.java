package com.shinhan.day09;

public class ThreadB extends Thread{
	
	WorkObject workObject;
	public ThreadB(WorkObject obj) {
		// TODO Auto-generated constructor stub
	}
	public void TheadB(WorkObject workObject) {
		setName("ThreadB");
		this.workObject = workObject;
		
	}
	@Override
	public void run() {
		for(int i =1;i<=10;i++) {
			workObject.methodB();
		}
	}

}
