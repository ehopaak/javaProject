package exam;

import java.util.Arrays;
import java.util.OptionalInt;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.IntStream;

public class Prob1 {
	public static void main(String[] args) {
		String[] array={"황남기85점","조성호89점","한인성88점","독고정진77점"};
		printMaxScore(array);
	}	
	
	private static void printMaxScore(String[] array){
		int maxScore = -1;
		String maxName="";
		for(String str:array) {
			String regExp = "([가-힣]+)([0-9]+)점";
			Pattern pat = Pattern.compile(regExp);
			Matcher mat =  pat.matcher(str);
			if(mat.find()) {
				String name = mat.group(1);
				String score = mat.group(2);
				int iscore = Integer.parseInt(score);
				if(iscore>maxScore) {
					maxScore = iscore;
					maxName = name;
				}
			}
		}
		
		
//		// 구현하세요.
//		
//		int maxScore = -1;
//		String maxName = "";
//		
//		for(String str:array) {
//			System.out.println(str);
//			char[] charrArr = str.toCharArray();
//			
//			String name = "";
//			String score = "";
//			for(int i=0;i<charrArr.length;i++) {
//				if(Character.isDigit(charrArr[i])) {
//					
//				}else {
//					name += charrArr[i];
//				}
//				
//			}
//			int s = Integer.parseInt(score);
//			if(Integer.parseInt(score)>maxScore) {
//				maxScore = s;
//				maxName = name;
//				
//			}
//			//System.out.println(name + "---" + score);
//		}
//		System.out.println();
		
	}	
}
