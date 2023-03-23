package aproject.vo2;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter @ToString
//JavaBeans 기술 : 변수 접근지정자는 private, setter/getter, 기본생성자
public class StoVO {
	
	 private String p_code;
	 private int num;
	 private Date storedate;
	 private int id;

}


