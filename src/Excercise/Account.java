package Excercise;

class Account{

	  int amount=1000;

	  String accNO;

	  Account(String  accNO){  this.accNO = accNO;   }

	  public void save(int amount){

	     System.out.println(this.amount + amount);

	   }

	}
