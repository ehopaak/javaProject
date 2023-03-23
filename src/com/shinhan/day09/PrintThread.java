package com.shinhan.day09;

//이체하는 기능

public class PrintThread extends Thread{
	ShareArea share;
	public PrintThread(ShareArea share) {
		this.share = share;
	}
	
	@Override
	public void run() {
		for(int i=1;i<3;i++) {
			synchronized (share) {
				//잔액출력
				share.printBalance();
			}
			
		}
		
	}

}
