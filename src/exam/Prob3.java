package exam;

class Prob3 {
	public static void main(String args[]){
		PhoneCharge skt = new PhoneCharge("김현우", 100, 50, 1);
		PhoneCharge ktf = new PhoneCharge("신희만", 200, 100, 2);
		PhoneCharge lgt = new PhoneCharge("조유성", 150, 500, 10);
		skt.printCharge();
		ktf.printCharge();
		lgt.printCharge();
	}
}

class PhoneCharge{	
	//
	private String user;
	private int call;
	private int sms;
	private int data;
	private int total;
	
		public PhoneCharge(String user, int call, int sms, int data) {
			//같은 이름의 멤버변수 값으로 초기화하는 문장을 정의.
			this.user = user;
			this.call = call;
			this.sms = sms;
			this.data = data;
		}
		
		public int calcCharge() {
			return 0;
		}
		public int callFee() {
			return 0;
		}
		public int smsFee() {
			return 0;
		}
		public int dataFee() {
			return 0;
		}
		
		
	
	
		
}
 