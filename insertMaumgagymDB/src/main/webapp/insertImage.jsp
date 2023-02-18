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
		
		String sql = "insert into image values( 0, ?, 500, ? )";
		
		pstmt = conn.prepareStatement(sql);
		
		for ( int i = 1; i <= 128; i++ ) {
			
			// 피트니스, 1 ~ 32번 이미지
			int imageSeq =  (int)(Math.random() * 32 ) + 1;
			String imageName = "image" + imageSeq + ".jpg";
			int boardSeq = i + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			// 요가, 33 ~ 63번 이미지
			imageSeq =  (int)(Math.random() * 31 ) + 33;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 1) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			// 수영, 64 ~ 94번 이미지
			imageSeq =  (int)(Math.random() * 31 ) + 64;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 2) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			// 테니스, 95 ~ 128번 이미지
			imageSeq =  (int)(Math.random() * 34 ) + 95;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 3) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			// 타바타 254 ~ 292 이미지
			imageSeq =  (int)(Math.random() * 39 ) + 254;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 4) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			// 필라테스, 129번 ~ 159번 이미지
			imageSeq =  (int)(Math.random() * 31 ) + 129;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 5) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			// 골프, 160번 ~ 189번 이미지
			imageSeq =  (int)(Math.random() * 30 ) + 160;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 6) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			// 복싱, 190번 ~ 223번 이미지
			imageSeq =  (int)(Math.random() * 34 ) + 190;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 7) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
			pstmt.executeUpdate();
			
			
			
			// 댄스, 224번 ~ 253번 이미지
			imageSeq =  (int)(Math.random() * 29 ) + 224;
			imageName = "image" + imageSeq + ".jpg";
			boardSeq = (i + 8) + ( i - 1 ) * 8;
			pstmt.setString(1, imageName );
			pstmt.setInt(2, boardSeq );
			
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