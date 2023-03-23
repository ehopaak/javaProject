package exam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

public class Prob5 {
	public static void main(String[] args) {
		int[] answer = { 1, 4, 4, 3, 1, 4, 4, 2, 1, 3, 2 };
		int[] counter = new int[4];

		for(int i=0; i<answer.length; i++) {
			counter[answer[i]-1]++;
			}
		
		for(int i=0; i<counter.length; i++) {
			System.out.print((i+1)+"의 갯수는"+counter[i]+"개 입니다.");
		for(int j=0; j<counter[i]; j++)
			System.out.print("");
			System.out.println();
		}

	}
}

