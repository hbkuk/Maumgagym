<%@page import="DummyData.RandomMembership"%>
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

	ArrayList<Map<String, Object>> arry = RandomMembership.randomMembership();
	
 	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into membership values( 0, ?, ?, ?, ?, ? )";
		
		pstmt = conn.prepareStatement(sql);
		
		int boardSeq = 0;
		int memberSeq = 1;
		
		for ( int i = 0; i <= 1151; i++ ) {
			
			Map<String, Object> map = arry.get( i );
			
			if( (i > 1) && (i % 9 == 0)) {
				memberSeq++;
			}
			
			String name = "1개월권";
			String price =  String.valueOf( map.get("OneMonthprice") );
			int period = 1;
			boardSeq++;
			
			pstmt.setInt( 1, memberSeq );
			pstmt.setString( 2, name );
			pstmt.setString( 3, price );
			pstmt.setInt( 4, period );
			pstmt.setInt( 5, boardSeq );
			
			pstmt.executeUpdate();
			
			
			name = "3개월권";
			price = String.valueOf( map.get("threeMonthprice") );
			period = 3;
			
			pstmt.setInt( 1, memberSeq );
			pstmt.setString( 2, name );
			pstmt.setString( 3, price );
			pstmt.setInt( 4, period );
			pstmt.setInt( 5, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			name = "6개월권";
			price = String.valueOf( map.get("sixMonthprice") );
			period = 6;
			
			pstmt.setInt( 1, memberSeq );
			pstmt.setString( 2, name );
			pstmt.setString( 3, price );
			pstmt.setInt( 4, period );
			pstmt.setInt( 5, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			
			name = "12개월권";
			price = String.valueOf( map.get("twelveMonthprice") );
			period = 12;
			
			pstmt.setInt( 1, memberSeq );
			pstmt.setString( 2, name );
			pstmt.setString( 3, price );
			pstmt.setInt( 4, period );
			pstmt.setInt( 5, boardSeq );
			
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