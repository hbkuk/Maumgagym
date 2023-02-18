<%@page import="DummyData.CommunityBoardDummyData"%>
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

	ArrayList<Map<String, Object>> resultArry = CommunityBoardDummyData.randomCommunityBoard();

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
		
		int i = 0;
		
		for ( Map<String, Object> map : resultArry ) {
			
			String fitnessTitle = (String) map.get("fitnessTitle");
			String fitnessContent = (String) map.get("fitnessContent");
			int fitnessCategory = 10;
			
			
			pstmt.setInt(1, fitnessCategory );
			pstmt.setString(2, fitnessTitle );
			pstmt.setString(3, fitnessContent );
			// 일반회원 seq => 129 번 ~ 500번
			pstmt.setInt(4, (int)(Math.random() * 372 ) + 129 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			String healthTitle = (String) map.get("healthTitle");
			String healthContent = (String) map.get("healthContent");
			int healthCategory = 11;
			
			
			pstmt.setInt(1, healthCategory );
			pstmt.setString(2, healthTitle );
			pstmt.setString(3, healthContent );
			// 일반회원 seq => 129 번 ~ 500번
			pstmt.setInt(4, (int)(Math.random() * 372 ) + 129 );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			
			String chatTitle = (String) map.get("chatTitle");
			String chatContent = (String) map.get("chatContent");
			int chatCategory = 12;
			
			
			pstmt.setInt(1, chatCategory );
			pstmt.setString(2, chatTitle );
			pstmt.setString(3, chatContent );
			// 일반회원 seq => 129 번 ~ 500번
			pstmt.setInt(4, (int)(Math.random() * 372 ) + 129 );
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