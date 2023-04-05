<%@page import="DummyData.RandomReviewDatetime"%>
<%@page import="DummyData.NotificationBoardDummyData"%>
<%@page import="DummyData.RandomDatetime"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="DummyData.FacilityBoardDummyData"%>
<%@page import="java.util.Iterator"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="DummyData.MembersDummyData"%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String[] reviews = {
			"시설이 깔끔해요",
			"친절해요",
			"선생님 실력이 좋아요",
			"기구가 다양해요",
			"자세를 꼼꼼히 봐주세요",
			"샤워실이 잘 되어있어요",
			"상담이 자세해요",
			"수업이 체계적이에요",
			"공간이 넓어요",
			"가격이 합리적이에요",
			};
	
	ArrayList<String> birthDayArry = RandomReviewDatetime.randomBirthDay();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into review values( 0, ?, ?, ?, ?, 1, ? )";
		
		pstmt = conn.prepareStatement(sql);
		
		for( int i = 0; i < 5000; i++ ) {
			
			String reviewContent = reviews[ (int) ( Math.random() * reviews.length ) ];
			
			pstmt.setString(1, reviewContent );
			pstmt.setString(2, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			// 일반회원 seq => 129 번 ~ 500번
			pstmt.setInt(3, (int)(Math.random() * 372 ) + 129 );
			pstmt.setInt(4, (int)(Math.random() * 5 ) + 1 );
			
			pstmt.setInt(5, (int)(Math.random() * 1152 ) + 1 );
			
			pstmt.executeUpdate();


		
	}
		
	} catch( NamingException e) {
		System.out.println( "[에러]" + e.getMessage());
	} catch( SQLException e) {
		System.out.println( "[에러]" + e.getMessage());
	} finally {
		if( pstmt != null) pstmt.close();
		if( conn != null) conn.close();
	}
%>
