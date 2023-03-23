package com.shinhan.day09;

public class WorkThread extends Thread{
	public boolean work = true;
	
	public WorkThread(String name) {
		//super(name);
		setName(name);
	}

	@Override
	public void run() {
		while(true) {
			if(work) {
				System.out.println(getName() + "...작업처리");
			} else {
				Thread.yield();			//나의 쓰레드가 잠시멈추고 다른쓰레드에 양보..다른쓰레드 후 진행
			}
		}
	}

}
