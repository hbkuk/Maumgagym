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
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into reaction values( 0, ?, ?, ? )";
		
		pstmt = conn.prepareStatement(sql);
		
		for( int i = 1; i <= 7746; i++ ) {
			
			pstmt.setInt(1, (int)(Math.random() * 100 ) + 1 );
			pstmt.setInt(2, (int)(Math.random() * 5 ) + 1 );
			
			pstmt.setInt(3, i );
			
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
