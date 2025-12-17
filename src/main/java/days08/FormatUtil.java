package days08;

import java.text.DecimalFormat;

public class FormatUtil {
	//1. static 메서드
	public static String staticNumber(long price, String pattern) {
	      DecimalFormat df = new DecimalFormat(pattern);
	      return df.format(price);
	   }
	//2. 인스턴스 메서드
	public String number(long price, String pattern) {
	      DecimalFormat df = new DecimalFormat(pattern);
	      return df.format(price);
	   }
}
