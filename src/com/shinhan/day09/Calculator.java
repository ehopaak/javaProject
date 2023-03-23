package com.shinhan.day09;

import lombok.Getter;

@Getter
public class Calculator {
	
	int memory;

	public synchronized void setMemory(int memory) {
		this.memory = memory;
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(Thread.currentThread().getName() + "==> 메모리저장값:" + this.memory);
	}

}
