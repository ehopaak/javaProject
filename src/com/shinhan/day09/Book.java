package com.shinhan.day09;

import java.util.Arrays;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


//@NoArgsConstructor			//생성자 대신
//@AllArgsConstructor			//생성자 대신
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = {"title","price"})			//동등비교 (기본: 주소 -> 재정의: 내용)
public class Book<T> extends Object implements Comparable<Book>{
	
	private T title;
	private int price;
	private String publisher;
	private String[] author;
	private static int count;
	private static final String COMPANY = "신한출판사";
	
	public Book() {}
	
	
	public static <T> Book<T> makeBook(T title, int price) {
		return new Book<>(title, price, "홍대출판사", new String[] {"김경윤", "양유진"});
		
	}

//@NoArgsConstructor
	public Book(T title, int price, String publisher, String[] author) {
		super();
		this.title = title;
		this.price = price;
		this.publisher = publisher;
		this.author = author;
		count++;
	}
	
//@AllArgsConstructor
//static이 없는 애들은 new로 객체 생성후 쓸수있음.
	
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public int getPrice() {
//		return price;
//	}
//	public void setPrice(int price) {
//		this.price = price;
//	}
//	public String getPublisher() {
//		return publisher;
//	}
//	public void setPublisher(String publisher) {
//		this.publisher = publisher;
//	}
//	public String[] getAuthor() {
//		return author;
//	}
//	public void setAuthor(String[] author) {
//		this.author = author;
//	}
//	
//	
	public static int getCount() {
		return count;
	}
//	public static void setCount(int count) {
//		Book.count = count;
//	}
//	public static String getCompany() {
//		return COMPANY;
//	}
	
//	@Override
//	public String toString() {
//		return "Book [title=" + title + ", price=" + price + ", publisher=" + publisher + ", author="
//				+ Arrays.toString(author) + "]";
//	}
	
//	@Override
//	public int hashCode() {
//		return Objects.hash(price, title);
//	}
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Book other = (Book) obj;
//		return price == other.price && Objects.equals(title, other.title);
//	}
	
//<> generics사용	
	@Override
	public int compareTo(Book obj) {
		// TODO Auto-generated method stub
		return price - obj.price;
	}

	
	
	

}
