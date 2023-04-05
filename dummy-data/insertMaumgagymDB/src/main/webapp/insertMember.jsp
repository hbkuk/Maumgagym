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
	ArrayList<String> nameArry = MembersDummyData.randomName();
	Set<String> idSet = MembersDummyData.randomID();
	Set<String> phoneSet = MembersDummyData.randomPhone();
	ArrayList<String> passwordArry = MembersDummyData.randomPassword();
	ArrayList<String> birthDayArry = MembersDummyData.randomBirthDay();
	Set<String> nicknameSet = MembersDummyData.randomNickname();
	Set<String> emailSet = MembersDummyData.randomEmail();
	Set<String> zipcodeSet = MembersDummyData.randomZipcode();
	ArrayList<String> lotNumberSet = MembersDummyData.randomAddress();
	ArrayList<String> roadSet = MembersDummyData.randomFullAddress();
	
	Iterator<String> itID = idSet.iterator();
	Iterator<String> itPhone = phoneSet.iterator();
	
	Iterator<String> itNickname = nicknameSet.iterator();
	Iterator<String> itEmail = emailSet.iterator();
	Iterator<String> itZipcode = zipcodeSet.iterator();
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into member values( 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '' )";
		
		pstmt = conn.prepareStatement(sql);
		
		while( itNickname.hasNext()  ) {
		
		for( int i = 0; i < 500; i++) {
			
			pstmt.setString(1, itNickname.next() );
			
			pstmt.setString(2, itID.next() );
			
			pstmt.setString(3, passwordArry.get(i) );
			
			pstmt.setString(4, nameArry.get(i) );
			
			pstmt.setString(5, birthDayArry.get(i) );
			
			pstmt.setString(6, itPhone.next() );
			
			pstmt.setString(7, itEmail.next() );
			
			if( i < 128 ) { pstmt.setString(8, "C" ); } else { pstmt.setString(8, "M" ); }
			
			pstmt.setString(9, itZipcode.next() );
			
			pstmt.setString(10, lotNumberSet.get(i) );
			
			pstmt.setString(11, roadSet.get(i) );
			
			pstmt.executeUpdate();
			
		}
		
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