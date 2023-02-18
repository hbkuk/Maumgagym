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

	String[] comments = {
			"좋은 정보 감사해요",
			"잘 읽었습니다.",
			"감사합니다."
			};
	
	ArrayList<String> birthDayArry = RandomReviewDatetime.randomBirthDay();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into comment values( 0, ?, ?, ?, 1, ? )";
		
		pstmt = conn.prepareStatement(sql);
		
		for( int i = 0; i < 5000; i++ ) {
			
			String commentContent = comments[ (int) ( Math.random() * comments.length ) ];
			
			pstmt.setString(1, commentContent );
			// 일반회원 seq => 129 번 ~ 500번
			pstmt.setInt(2, (int)(Math.random() * 372 ) + 129 );
			pstmt.setString(3, birthDayArry.get( (int) ( Math.random() * birthDayArry.size() ) ) );
			pstmt.setInt(4, (int)(Math.random() * 450 ) + 7297 );
			
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
