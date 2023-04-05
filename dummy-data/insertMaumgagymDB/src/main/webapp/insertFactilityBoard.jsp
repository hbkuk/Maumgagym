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

	ArrayList<Map<String, Object>> resultArry = FacilityBoardDummyData.randomFacilityBoard();
	
	System.out.println( resultArry.size() );
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
			
			i++;

			String fitnessTitle = (String) map.get("fitnessTitle");
			String fitnessContent = (String) map.get("fitnessContent");
			int fitnessCategory = 1;
			
			pstmt.setInt(1, fitnessCategory );
			pstmt.setString(2, fitnessTitle );
			pstmt.setString(3, fitnessContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			
			pstmt.executeUpdate();
			
			
			String yogaTitle = (String) map.get("yogaTitle");
			String yogaContent = (String) map.get("yogaContent");
			int yogaCategory = 2;
			
			pstmt.setInt(1, yogaCategory );
			pstmt.setString(2, yogaTitle );
			pstmt.setString(3, yogaContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			String swimmingTitle = (String) map.get("swimmingTitle");
			String swimmingContent = (String) map.get("swimmingContent");
			int swimmingCategory = 3;
			
			pstmt.setInt(1, swimmingCategory );
			pstmt.setString(2, swimmingTitle );
			pstmt.setString(3, swimmingContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			
			String tennisTitle = (String) map.get("tennisTitle");
			String tennisContent = (String) map.get("tennisContent");
			int tennisCategory = 4;
			
			pstmt.setInt(1, tennisCategory );
			pstmt.setString(2, tennisTitle );
			pstmt.setString(3, tennisContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			String tabataTitle = (String) map.get("tabataTitle");
			String tabataContent = (String) map.get("tabataContent");
			int tabataCategory = 5;
			
			pstmt.setInt(1, tabataCategory );
			pstmt.setString(2, tabataTitle );
			pstmt.setString(3, tabataContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			
			String pilatesTitle = (String) map.get("pilatesTitle");
			String pilatesContent = (String) map.get("pilatesContent");
			int pilatesCategory = 6;
			
			pstmt.setInt(1, pilatesCategory );
			pstmt.setString(2, pilatesTitle );
			pstmt.setString(3, pilatesContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			
			String golfTitle = (String) map.get("golfTitle");
			String golfContent = (String) map.get("golfContent");
			int golfCategory = 7;
			
			pstmt.setInt(1, golfCategory );
			pstmt.setString(2, golfTitle );
			pstmt.setString(3, golfContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			
			String boxingTitle = (String) map.get("boxingTitle");
			String boxingContent = (String) map.get("boxingContent");
			int boxingCategory = 8;
			
			pstmt.setInt(1, boxingCategory );
			pstmt.setString(2, boxingTitle );
			pstmt.setString(3, boxingContent );
			pstmt.setInt(4, i );
			pstmt.setString(5, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.executeUpdate();
			
			
			
			String danceTitle = (String) map.get("danceTitle");
			String danceContent = (String) map.get("danceContent");
			int danceCategory = 9;
			
			pstmt.setInt(1, danceCategory );
			pstmt.setString(2, danceTitle );
			pstmt.setString(3, danceContent );
			pstmt.setInt(4, i );
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