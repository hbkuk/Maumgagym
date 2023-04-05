package DummyData;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class RandomPayDummyData {
	
	
	public static ArrayList<Map<String, Object>> randomPay() {

		ArrayList<Map<String, Object>> arry = new ArrayList<>();
		
		int randomIndex = (int)(Math.random() * 5 );

		for (int i = 1; i <= 100; i++) {
			

			Map<String, Object> map = new HashMap<String, Object>();
			
			String merchatUid = "merchant_" + UUID.randomUUID().toString();
			
			int membershipSeq = 3;
			
			String impUid = "imp_139361" + i ;
			
			String payDate = "2022" + "-" + "06" + "13" + " " + "00:00:00";
			
			int memberSeq = (int)(Math.random() * 372 ) + 129;
			

			map.put("merchat_uid", merchatUid );
			
			arry.add(map);
		}
		return arry;
	}

	
}
