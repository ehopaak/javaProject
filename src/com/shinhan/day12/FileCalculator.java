package com.shinhan.day12;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.Reader;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileCalculator {
	
	public static void main(String[] args) {
		try {
			new FileCalculator().addCalculateResult("data.txt");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	void addCalculateResult(String inputFileName) throws Exception{
		FileReader fi = new FileReader(inputFileName);
		//DataInputStream dis = new DataInputStream(fi);
		BufferedReader br = new BufferedReader(fi);

		String s;
		int sum =0;
		int multiply = 1;
		while((s=br.readLine()) !=null) {
			System.out.println(s);
			sum += Integer.parseInt(s);
			multiply *= Integer.parseInt(s);
			
		}
		
		
		br.close();
		fi.close();
		
		FileWriter fw = new FileWriter(inputFileName, true);
		BufferedWriter bw = new BufferedWriter(fw);
		
		bw.newLine();
		bw.write(sum + "");
		bw.newLine();
		bw.write(multiply + "");
		
		bw.close();
		fw.close();
		
	}

}
