package com.shinhan.day03;

public class Account {
	private String accNo;
	private int balance;
	
	Account(String accNo, int balance){
		this.accNo = accNo;
		this.balance = balance;
	}
	
    void deposit(int amount) {
    	balance += amount;
    	print("계좌에" + amount + "원이 입금되었습니다." );
		
	}
    void withdraw(int amount) {
    	balance += amount;
    	print("계좌에" + amount + "원이 출금되었습니다." );
		
	}
    
    //getter
    public int getBalance() {
    	
    	return balance;
	}
    public String getAccNo() {
    	return accNo;
	}
    
    private void print(String message) {
    	System.out.println(accNo + message);
    	System.out.println(accNo + "계좌의 잔고는 " + balance + "원 입니다.");
    }

	@Override
	public String toString() {
		return "Account [accNo=" + accNo + ", balance=" + balance + "]";
	}
	

}
