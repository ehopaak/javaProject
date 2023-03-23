package com.shinhan.day12;

import java.util.Arrays;
import java.util.function.ToIntFunction;

public class Example {
	static Student[] studentList = {
			new Student("김1",10, 20),
			new Student("김2",10, 20),
			new Student("김3",10, 20),
			new Student("김4",10, 20),
			new Student("김6",10, 20)
	};
	
	public static void main(String[] args) {
		double engAvg = avg2(s->s.getEngScore());
		double mathAvg = avg2(s->s.getMathScore());
		System.out.println(engAvg);
		System.out.println(mathAvg);
		
		engAvg = avg2(s->s.getEngScore());
		mathAvg = avg2(s->s.getMathScore());
		
		System.out.println(engAvg);
		System.out.println(mathAvg);
	}
	private static double avg2(ToIntFunction<Student> f) {
		
		return Arrays.stream(studentList)
				.mapToInt(f).average().orElse(0);
	}

	private static double avg(Function<Student> f) {
		double result = 0;
		for(Student st:studentList) {
			double d = f.apply(st);
			result += d;
			
		}
		return result/studentList.length;
	}
}
