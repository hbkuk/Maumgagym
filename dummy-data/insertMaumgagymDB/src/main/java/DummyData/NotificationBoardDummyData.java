package DummyData;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NotificationBoardDummyData {
	
	public static ArrayList<Map<String, Object>> randomNotificationBoard() {
		
		List<String> notificationTitleList = Arrays.asList("코로나19 사회적 거리두기로 인한 고객센터 운영 안내", "3차 코로나19 관련 홀딩 추가 공지", "포인트 사용 정책 변경 안내", "트레이너 서비스 베타 런칭", "문자서비스 정상화 안내", "통합회원권 일시정지 기능 안내", "즐거운 연휴와 함께 찾아온 업데이트", "출석 시 포인트 지급 안내" );
		
		List<String> eventTitleList = Arrays.asList("리뷰 작성하면 3,000P", "1타3만 신청 그 두번째", "첫 구매라면 5,000원 할인 받고 다짐하세요!", "2024년까지! 건강검진도", "[운동 추천] 운동, 뭘 해야 좋을지 고민인 당신에게", "뭘 드려야 운동하러 오실 건가요?", "원데이 클래스 운영! 궁금했던 종목을  체험해보세요!", "집 앞에서 헬스하고, 회사 앞에서 또 하고싶다면?", "마음가짐 회원들에게만 최대 45% 역대급 할인!", "우주최저가 프로모션 진행중" );

		
		ArrayList<Map<String, Object>> resultArry = new ArrayList<>();
		
		for( int j = 1; j <= 1024; j++ ) {
			
			Map<String, Object> map = new HashMap();
			
			Collections.shuffle( notificationTitleList );
			Collections.shuffle( eventTitleList );
			
			String notificationTitle = notificationTitleList.get( 0 );
			String eventTitle = eventTitleList.get( 0 );
			map.put( "notificationTitle1",notificationTitle );
			map.put( "eventTitle1",eventTitle );
			
			notificationTitle = notificationTitleList.get( 1 );
			eventTitle = eventTitleList.get( 1 );
			map.put( "notificationTitle2",notificationTitle );
			map.put( "eventTitle2",eventTitle );
			
			notificationTitle = notificationTitleList.get( 2 );
			eventTitle = eventTitleList.get( 2 );
			map.put( "notificationTitle3",notificationTitle );
			map.put( "eventTitle3",eventTitle );
			
			resultArry.add(map);
			
		}
		
		return resultArry;
	}
}
