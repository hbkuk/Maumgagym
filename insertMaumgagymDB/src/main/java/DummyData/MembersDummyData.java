package DummyData;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class MembersDummyData {
	
	// 생년월일 
	public static List<String> firstYear = Arrays.asList("19","20");
	public static List<String> secondYear = Arrays.asList("00","01","02","03");
	public static List<String> month = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
	public static List<String> day = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28" );
	
	// 이름
	public static ArrayList<String> randomName() {
		
	    List<String> LastName = Arrays.asList("김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안",
	        "송", "류", "전", "홍", "고", "문", "양", "손", "배", "조", "백", "허", "유", "남", "심", "노", "정", "하", "곽", "성", "차", "주",
	        "우", "구", "신", "임", "나", "전", "민", "유", "진", "지", "엄", "채", "원", "천", "방", "공", "강", "현", "함", "변", "염", "양",
	        "변", "여", "추", "노", "도", "소", "신", "석", "선", "설", "마", "길", "주", "연", "방", "위", "표", "명", "기", "반", "왕", "금",
	        "옥", "육", "인", "맹", "제", "모", "장", "남", "탁", "국", "여", "진", "어", "은", "편", "구", "용");
	    
	    List<String> FirstNames = Arrays.asList("가", "강", "건", "경", "고", "관", "광", "구", "규", "근", "기", "길", "나", "남", "노", "누", "다",
	        "단", "달", "담", "대", "덕", "도", "동", "두", "라", "래", "로", "루", "리", "마", "만", "명", "무", "문", "미", "민", "바", "박",
	        "백", "범", "별", "병", "보", "빛", "사", "산", "상", "새", "서", "석", "선", "설", "섭", "성", "세", "소", "솔", "수", "숙", "순",
	        "숭", "슬", "승", "시", "신", "아", "안", "애", "엄", "여", "연", "영", "예", "오", "옥", "완", "요", "용", "우", "원", "월", "위",
	        "유", "윤", "율", "으", "은", "의", "이", "익", "인", "일", "잎", "자", "잔", "장", "재", "전", "정", "제", "조", "종", "주", "준",
	        "중", "지", "진", "찬", "창", "채", "천", "철", "초", "춘", "충", "치", "탐", "태", "택", "판", "하", "한", "해", "혁", "현", "형",
	        "혜", "호", "홍", "화", "환", "회", "효", "훈", "휘", "희", "운", "모", "배", "부", "림", "봉", "혼", "황", "량", "린", "을", "비",
	        "솜", "공", "면", "탁", "온", "디", "항", "후", "려", "균", "묵", "송", "욱", "휴", "언", "령", "섬", "들", "견", "추", "걸", "삼",
	        "열", "웅", "분", "변", "양", "출", "타", "흥", "겸", "곤", "번", "식", "란", "더", "손", "술", "훔", "반", "빈", "실", "직", "흠",
	        "흔", "악", "람", "뜸", "권", "복", "심", "헌", "엽", "학", "개", "롱", "평", "늘", "늬", "랑", "얀", "향", "울", "련");
		    
			ArrayList<String> nameArry = new ArrayList<>();
			
			for( int j = 0; j < 500; j++ ) {
				String name = "";
				name += LastName.get( (int) ( Math.random() * LastName.size() ) );
				name += FirstNames.get( (int) ( Math.random() * FirstNames.size() ) );
				name += FirstNames.get( (int) ( Math.random() * FirstNames.size() ) ) + " ";
				nameArry.add(name);
			}
			return nameArry;
	  }
	
	// 아이디
	public static Set<String> randomID() {
		
		Set<String> idSet = new HashSet<>();
		
		for( int j = 0; j < 500; j++ ) {
			String text = "";
			String ran = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			
			for(int i = 0; i < 6; i++) {
				text += ran.charAt( (int) ( Math.random() * ran.length() ) );
			}
				text += (int)(Math.random() * 99)+1 +"";
				idSet.add(text);
		}
		return idSet;
	 }
	
	// 핸드폰
	public static Set<String> randomPhone() {
		
		Set<String> phoneSet = new HashSet<>();
		
		for( int j = 0; j < 500; j++ ) {
			String numberOne = "010-";
			numberOne += (int)(Math.random() * 8999) + 1000 + "-";
			numberOne += (int)(Math.random() * 8999) + 1000;
			phoneSet.add(numberOne);
		}
		
		return phoneSet;
	 }
	
	// 비밀번호
	public static ArrayList<String> randomPassword() {
		String password = "";
		String ranText = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		String symbol = "!@#$%^&";
		
		ArrayList<String> passwordArry = new ArrayList<>();
		
		for( int j = 0; j < 500; j++ ) {
			password = "";
			for(int i = 0; i < 8; i++) {
				password += ranText.charAt( (int) ( Math.random() * ranText.length() ) );
			}
				password += symbol.charAt( (int) ( Math.random() * symbol.length() ) );
				passwordArry.add(password);
		}
		return passwordArry;
	 }
	
	// 생년월일
	public static ArrayList<String> randomBirthDay() {
		
			ArrayList<String> birthDayArry = new ArrayList<>();
			for( int i = 0; i < 500; i++ ) {
				Collections.shuffle(firstYear);
				Collections.shuffle(month);
				Collections.shuffle(day);
				String birthDay = firstYear.get(1);
			if(birthDay.equals("19")) {
				
				birthDay += ( (int)(Math.random() * 49) + 50);
				
			} else if(birthDay.equals("20")) {
				
				Collections.shuffle(secondYear);
				birthDay += secondYear.get(1);
			}
				birthDayArry.add( birthDay+"-"+month.get(1)+"-"+day.get(1) );
		}
			return birthDayArry;
	}
	
	
	// 닉네임
	public static Set<String> randomNickname() {
		
		List<String> fisrtNickname = Arrays.asList("가냘픈", "가는", "가엾은", "가파른", "같은", "거센", "거친", "검은", "게으른", "고달픈", "고른", "고마운", "고운", "고픈", "곧은", "괜찮은", "구석진", "굳은", "굵은", "귀여운", "그런", "그른", "그리운", "기다란", "기쁜", "긴", "깊은", "깎아지른", "깨끗한", "나쁜", "나은", "난데없는", "날랜", "날카로운", "낮은", "너그러운", "너른", "널따란", "넓은", "네모난", "노란", "높은", "누런", "눅은", "느닷없는", "느린", "늦은", "다른", "더러운", "더운", "덜된", "동그란", "돼먹잖은", "된", "둥그런", "둥근", "뒤늦은", "드문", "딱한", "때늦은", "뛰어난", "뜨거운", "막다른", "많은", "매운", "먼", "멋진", "메마른", "메스꺼운", "모난", "못난", "못된", "못생긴", "무거운", "무딘", "무른", "무서운", "미끄러운", "미운", "바람직한", "반가운", "밝은", "밤늦은", "보드라운", "보람찬", "부드러운", "부른", "붉은", "비싼", "빠른", "빨간", "뻘건", "뼈저린", "뽀얀", "뿌연", "새로운", "서툰", "섣부른", "설운", "성가신", "센", "수줍은", "쉬운", "스스러운", "슬픈", "시원찮은", "싫은", "싼", "쌀쌀맞은", "쏜살같은", "쓰디쓴", "쓰린", "쓴", "아니꼬운", "아닌", "아름다운", "아쉬운", "아픈", "안된", "안쓰러운", "안타까운", "않은", "알맞은", "약빠른", "약은", "얇은", "얕은", "어두운", "어려운", "어린", "언짢은", "엄청난", "없는", "여문", "열띤", "예쁜", "올바른", "옳은", "외로운", "우스운", "의심스런", "이른", "익은", "있는", "작은", "잘난", "잘빠진", "잘생긴", "재미있는", "적은", "젊은", "점잖은", "조그만", "좁은", "좋은", "주제넘은", "줄기찬", "즐거운", "지나친", "지혜로운", "질긴", "짓궂은", "짙은", "짠", "짧은", "케케묵은", "큰", "탐스러운", "턱없는", "푸른", "한결같은", "흐린", "희망찬", "흰", "힘겨운", "기분나쁜","기분좋은","신바람나는","상쾌한","짜릿한","그리운","자유로운","서운한","울적한","비참한","위축되는","긴장되는","두려운","당당한","배부른","수줍은","창피한","멋있는",
				"열받은","심심한","잘생긴","이쁜","시끄러운");
		List<String> lastNickname = Arrays.asList("사자","코끼리","호랑이","곰","여우","늑대","너구리","침팬치","고릴라","참새","고슴도치","강아지","고양이","거북이","토끼","앵무새","하이에나","돼지","하마","원숭이","물소","얼룩말","치타",
				"악어","기린","수달","염소","다람쥐","판다");
		
		Set<String> nicknameSet = new HashSet<>();
		
		for( int i = 0; nicknameSet.size() != 500; i++ ) {
			String nickname = "";
			nickname += fisrtNickname.get( (int) ( Math.random() * fisrtNickname.size() ) ) + " ";
			nickname += lastNickname.get( (int) ( Math.random() * lastNickname.size() ) );
			nicknameSet.add(nickname);
		}
		return nicknameSet;
	}
	
	// 이메일
	public static Set<String> randomEmail() {
		String ranText = "abcdefghijklmnopqrstuvwxyz";
		List<String> domain = Arrays.asList( "naver.com", "nate.com", "gmail.com", "daum.net", "hanmail.net", "kakao.com", "yahoo.com" );
		
		Set<String> emailSet = new HashSet<>();
		
		for( int i = 0; emailSet.size() != 500; i++ ) {
			
			String email = "";
			
			for(int j = 0; j < 6; j++ ) {
				
				email += ranText.charAt( (int) ( Math.random() * ranText.length() ) );
				
			}
			
			for(int z = 0; z < 2; z++ ) {
				
				email += (int)(Math.random() * 8) + 1;
				
			}
			
			email += "@";
			
			email += domain.get( (int) ( Math.random() * domain.size() ) );
			
			emailSet.add( email );
			
		}
		return emailSet;
	 }
	
	// 우편번호
	public static Set<String> randomZipcode() {
		
		Set<String> zipcodeSet = new HashSet<>();
		
		for( int j = 0; zipcodeSet.size() != 500; j++ ) {
			String zipcode = "0";
			zipcode += (int)(Math.random() * 9);
			zipcode += (int)(Math.random() * 9);
			zipcode += (int)(Math.random() * 9);
			zipcode += (int)(Math.random() * 9);
			zipcode += (int)(Math.random() * 9);
			zipcodeSet.add(zipcode);
		}
		
		return zipcodeSet;
	 }
	
	// 지번주소
	public static ArrayList<String> randomAddress() {
		BufferedReader br = null;
		ArrayList<String> addressArry = new ArrayList<>();
		try {
			br = new BufferedReader( new FileReader("C:\\java2\\teamproject-workspace\\insertMaumgagymDB\\서울특별시 성동구_헬스장정보_20220818.csv") );
			String str = null;
			while( (str = br.readLine()) != null ) {
				String[] elements = str.replaceAll("\"", "").split(",");
				if( !elements[2].equals("지번주소") ) {
					addressArry.add( elements[2] );
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if( br != null ) try { br.close(); } catch( IOException e) {}
		}
		return addressArry;
	 }
	
	// 도로명주소
	public static ArrayList<String> randomFullAddress() {
		BufferedReader br = null;
		ArrayList<String> fullAddressArry = new ArrayList<>();
		try {
			br = new BufferedReader( new FileReader("C:\\java2\\teamproject-workspace\\insertMaumgagymDB\\서울특별시 성동구_헬스장정보_20220818.csv") );
			String str = null;
			while( (str = br.readLine()) != null ) {
				String[] elements = str.split(",");
				if( !elements[3].equals("도로명주소") ) {
					fullAddressArry.add( elements[3].replaceAll("\"", "") );
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if( br != null ) try { br.close(); } catch( IOException e) {}
		}
		return fullAddressArry;
	 }
	
	// referaddress
//	public static ArrayList<String> randomReferaddress() {
//		BufferedReader br = null;
//		ArrayList<String> fullAddressArry = new ArrayList<>();
//		try {
//			br = new BufferedReader( new FileReader("C:\\java2\\teamproject-workspace\\insertMaumgagymDB\\서울특별시 성동구_헬스장정보_20220818.csv") );
//			String str = null;
//			while( (str = br.readLine()) != null ) {
//				String[] elements = str.split(",");
//				if( !elements[3].equals("도로명주소") ) {
//					fullAddressArry.add( elements[3].replaceAll("\"", "") );
//				}
//			}
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			if( br != null ) try { br.close(); } catch( IOException e) {}
//		}
//		return fullAddressArry;
//	 }
	
	
	
	
	
//	public static void main(String[] args) {
//		/*
//		 * Set<String> emailSet = randomEmail();
//		 * 
//		 * Iterator<String> it = emailSet.iterator(); while( it.hasNext() ) {
//		 * System.out.println( it.next() ); }
//		 */
//		ArrayList<String> lotNumberSet = randomAddress();
//		for( String address : lotNumberSet ) {
//		System.out.println(address );
//	}
//		
//	}
		
//		System.out.println("*******set Name Data******");
//		
//		ArrayList<String> nameList = randomName();
//		Iterator<String> it = nameList.iterator();
//		while( it.hasNext() ) {
//			System.out.println( it.next() );
//		}
//		
//		System.out.println("*******set Name Data******");
//		
//		System.out.println("*******set ID Data******");
//		Set<String> idSet = randomID();
//		Iterator<String> it = idSet.iterator();
//		while( it.hasNext() ) {
//			System.out.println( it.next() );
//		}
//		System.out.println("*******set ID Data******");
//		
//		Set<String> phoneSet = randomPhone();
//		Iterator<String> it = phoneSet.iterator();
//		System.out.println("*******set password Data******");
//		while( it.hasNext() ) {
//			System.out.println( it.next() );
//		}
//		System.out.println("*******set password Data******");
//		
//		System.out.println( randomPassword().size() );
//		
//		ArrayList<String> birthDayArry = randomBirthDay();
//		
//		for( String brd : birthDayArry ) {
//			
//			System.out.println( brd );
//			
//		}
//		
		
//		ArrayList<String> nameArry = randomName();
//		idSet = randomID();
//		Set<String> phoneSet = randomPhone();
//		ArrayList<String> passwordArry = randomPassword();
//		ArrayList<String> birthDayArry = randomBirthDay();
//		Set<String> nicknameSet = randomNickname();
//		Set<String> emailSet = randomEmail();
//		Set<String> zipcodeSet = randomZipcode();
//		ArrayList<String> lotNumberSet = randomAddress();
//		ArrayList<String> roadSet = randomFullAddress();
//		
//		System.out.println( nameArry.size() );
//		System.out.println( idSet.size() );
//		System.out.println( phoneSet.size() );
//		System.out.println( passwordArry.size() );
//		System.out.println( birthDayArry.size() );
//		System.out.println( nicknameSet.size() );
//		System.out.println( emailSet.size() );
//		System.out.println( zipcodeSet.size() );
//		System.out.println( lotNumberSet.size() );
//		System.out.println( roadSet.size() );
		// roadSet 의 갯수만큼 type을 C로 지정하기
//		
//		for( String address : lotNumberSet ) {
//			System.out.println(address );
//		}
		
//		for( String address : roadSet ) {
//			System.out.println(address );
//		}
		
		
//		String id;
//		String password;
//		String name;
//		String birthday;
//		String phone;
//		String email;
//		String type;
//		String zipcode;
//		String address;
//		String fullAddress;
//		String referAddress;
		
		
//		MemberTO to = new MemberTO();
//		to.setNickname( nickname ); 
//		to.setId( id ); 
//		to.setPassword( password ); 
//		to.setName( name ); 
//		to.setEmail( email );
//		to.setType( type );
//		to.setBirthday( birthday );
//		to.setZipcode( zipcode );
//		to.setAddress( address );
//		to.setFullAddress( referAddress );
//		to.setReferAddress( fullAddress );
//	}
	
}
