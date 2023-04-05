package DummyData;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RandomMembership {

	// 회원권
	public static List<String> name = Arrays.asList("1개월권", "3개월권", "6개월권", "12개월권");
	public static List<String> OneMonthprice = Arrays.asList("85000", "86000", "87000", "88000", "89000", "90000",
			"91000", "92000", "93000");
	public static List<String> threeMonthprice = Arrays.asList("145000", "146000", "147000", "148000", "149000",
			"150000", "151000");
	public static List<String> sixMonthprice = Arrays.asList("237000", "238000", "239000", "240000", "241000", "242000",
			"242000", "243000", "244000");
	public static List<String> twelveMonthprice = Arrays.asList("400000", "401000", "402000", "410000", "411000",
			"412000", "413000", "414000", "415000");

	public static ArrayList<Map<String, Object>> randomMembership() {

		ArrayList<Map<String, Object>> arry = new ArrayList<>();

		for (int i = 1; i <= 1152; i++) {

			Collections.shuffle(OneMonthprice);
			Collections.shuffle(threeMonthprice);
			Collections.shuffle(sixMonthprice);
			Collections.shuffle(twelveMonthprice);

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("OneMonthprice", OneMonthprice.get(0) );
			map.put("threeMonthprice", threeMonthprice.get(0) );
			map.put("sixMonthprice", sixMonthprice.get(0) );
			map.put("twelveMonthprice", twelveMonthprice.get(0) );

			arry.add(map);

		}

		return arry;
	}

	
//	  public static void main(String[] args) {
//	  
//	  ArrayList<Map<String, Object>> arry = randomMembership();
//	  
//	  Map<String, Object> map = arry.get( 0 );
//	  
//	  System.out.println( map.get("OneMonthprice") );
//	  
//	  }
}
