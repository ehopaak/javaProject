package com.shinhan.day09;

//부모 class로 사용할 예정
public class Account extends Object{
	//1. field
	private String accNO;
	private String owner;
	private int balance;
	double a;
	
	//2.생성자
	public Account() {
		
	}

	public Account(String accNO, String owner, int balance) {
		this.accNO = accNO;
		this.owner = owner;
		this.balance = balance;
	}
	//매소드
	public void deposit(int amount) {
		balance += amount;
	}
	
	public int withdraw(int amount) {
		if (amount > balance) {
			System.out.println();
			return 0;
		}
		return amount;
	}

	public String getAccNO() {
		return accNO;
	}

	public void setAccNO(String accNO) {
		this.accNO = accNO;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	

}
