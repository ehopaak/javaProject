package com.shinhan.day02;

public class StringUtill {
	public static void  hokeyGraphics(char cell, int size, boolean isRect) {
		
		
		if(isRect) {
			System.out.println("");
			for(int row=1;row<=size;row++) {
				for(int col=1;col<=size;col++) {
					System.out.print(cell);
				}
				System.out.println();
			}
			
		}else {
			for(int row=1;row<=size;row++) {
				for(int col=1;col<=row;col++) {
					System.out.print(cell);
				}
				System.out.println();
			}
			
		}
		
	}
	
	public static void main(String[] args) {
		hokeyGraphics('*', 3, true);
		
	}

}
