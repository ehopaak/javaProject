package com.shinhan.day09;

import com.shinhan.day05.Account;

import lombok.AllArgsConstructor;

//공유자원으로 이용할 class
//2개의 계좌가 있다.
@AllArgsConstructor
public class ShareArea {
	
	Account sung;
	Account lee;
	
	
	
	void transfer() {
		synchronized (this) {
			//출금한다.
			int amount = lee.withdraw(100);
			System.out.println("lee계좌에서 " + amount + "출금");
			//입금한다.
			sung.deposit(amount);
			System.out.println("sung계좌에서 " + amount + "입금");
			}
	}
	synchronized void printBalance() {
		System.out.println("잔액:" + 
				(lee.getBalance() + sung.getBalance()));
	}

}
