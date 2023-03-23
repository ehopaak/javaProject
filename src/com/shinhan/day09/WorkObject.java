package com.shinhan.day09;

//공유영역
public class WorkObject {
	
	public synchronized void methodA() {
		Thread t = Thread.currentThread();
		System.out.println(t.getName() + "작업실행A..."); 		//스레드이름
		notify();
		try {
			wait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public synchronized void methodB() {
		Thread t = Thread.currentThread();
		System.out.println(t.getName() + "작업실행B..."); 		//스레드이름
		notify();
		try {
			wait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
