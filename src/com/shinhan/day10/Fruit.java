package com.shinhan.day10;

import lombok.AllArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@ToString
public class Fruit implements Comparable<Fruit>{

	String name;
	int price;
	@Override
	public int compareTo(Fruit obj) {
		int result =  name.compareTo(obj.name);
		if(result==0) return price - obj.price;
		return result;
	}
	
}
