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

	ArrayList<Map<String, Object>> resultArry = NotificationBoardDummyData.randomNotificationBoard();

	ArrayList<String> birthDayArry = RandomDatetime.randomBirthDay();
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into board values( 0, ?, ?, ?, ?, ?, 1 )";
		
		pstmt = conn.prepareStatement(sql);
		
		int i = 1;
		
		for ( Map<String, Object> map : resultArry ) {
			
			
			String notificationTitle = (String) map.get("notificationTitle1");
			int notificationCategory = 13;
			
			pstmt.setInt(1, notificationCategory );
			pstmt.setString(2, notificationTitle );
			pstmt.setString(3, "" );
			
			// 업체회원 seq => 1 번 ~ 128 번
			pstmt.setInt(4, (int)(Math.random() * 128 ) + 1 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			
			String eventTitle = (String) map.get("eventTitle1");
			int eventCategory = 14;
			
			pstmt.setInt(1, eventCategory );
			pstmt.setString(2, eventTitle );
			pstmt.setString(3, "" );
			
			// 업체회원 seq => 1 번 ~ 128 번
			pstmt.setInt(4, (int)(Math.random() * 128 ) + 1 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			
			
			notificationTitle = (String) map.get("notificationTitle2");
			notificationCategory = 13;
			
			pstmt.setInt(1, notificationCategory );
			pstmt.setString(2, notificationTitle );
			pstmt.setString(3, "" );
			
			// 업체회원 seq => 1 번 ~ 128 번
			pstmt.setInt(4, (int)(Math.random() * 128 ) + 1 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			
			eventTitle = (String) map.get("eventTitle2");
			eventCategory = 14;
			
			pstmt.setInt(1, eventCategory );
			pstmt.setString(2, eventTitle );
			pstmt.setString(3, "" );
			
			// 업체회원 seq => 1 번 ~ 128 번
			pstmt.setInt(4, (int)(Math.random() * 128 ) + 1 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			
			
			
			
			notificationTitle = (String) map.get("notificationTitle3");
			notificationCategory = 13;
			
			pstmt.setInt(1, notificationCategory );
			pstmt.setString(2, notificationTitle );
			pstmt.setString(3, "" );
			
			// 업체회원 seq => 1 번 ~ 128 번
			pstmt.setInt(4, (int)(Math.random() * 128 ) + 1 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			
			eventTitle = (String) map.get("eventTitle3");
			eventCategory = 14;
			
			pstmt.setInt(1, eventCategory );
			pstmt.setString(2, eventTitle );
			pstmt.setString(3, "" );
			
			// 업체회원 seq => 1 번 ~ 128 번
			pstmt.setInt(4, (int)(Math.random() * 128 ) + 1 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
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