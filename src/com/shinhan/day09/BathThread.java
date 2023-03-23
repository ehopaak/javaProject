package com.shinhan.day09;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class BathThread extends Thread{
	
	BathRoom room;
	String userName;
	
	@Override
	public void run() {
		for(int i =1;i<=3;i++) {
			room.use(userName);
		}
	}
	
	

}
