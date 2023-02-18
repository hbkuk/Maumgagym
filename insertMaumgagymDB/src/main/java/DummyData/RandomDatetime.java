package DummyData;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class RandomDatetime {
	
	public static List<String> firstYear = Arrays.asList("20");
	public static List<String> secondYear = Arrays.asList("21", "22" );
	public static List<String> month = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
	public static List<String> day = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28" );
	
	
	public static ArrayList<String> randomBirthDay() {
		
			ArrayList<String> birthDayArry = new ArrayList<>();
			for( int i = 0; i < 500; i++ ) {
				Collections.shuffle(firstYear);
				Collections.shuffle(month);
				Collections.shuffle(day);
				String birthDay = firstYear.get(0);
				
				Collections.shuffle(secondYear);
				birthDay += secondYear.get(0);
				
				birthDayArry.add( birthDay+"-"+month.get(0)+"-"+day.get(0)+ " " + "00:00:00" );
		}
			return birthDayArry;
	}
}
