package com.to.board;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.to.member.MemberTO;

public class CommunityDAO {
	
	private DataSource dataSource;
		
		public CommunityDAO() {
			
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
				this.dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" ); //항상 이부분 this로 들어가도록 주의
				
				System.out.println("db연결성공");
			} catch (NamingException e) {
				System.out.println( "[에러] " + e.getMessage() ); 
			}
		}
		
		
		public int boardWriteOK(MemberTO to1, BoardTO to) throws NamingException {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int flag = 1; //비정상

			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
				DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb1" );
				
				System.out.println("db연결성공");
			
				conn = this.dataSource.getConnection();
				
				String sql = "select seq from member where nickname = ?"; //닉네임에 따른 seq 값 받아온다.
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, to1.getNickname());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					to.setWrite_seq(rs.getInt("seq")); //BoardTO 안에 setWrite_seq 로 넣어준다.
				}
				
				 sql = "insert into board values(0, ?, ?, ?, ?, now(), 1) "; // 1 : 정상 //prepared문을 만들어서 board테이블에 insert 한다.
					 pstmt = conn.prepareStatement(sql);
					 pstmt.setInt(1, to.getCategory_seq());
					 pstmt.setString(2, to.getTitle());
					 pstmt.setString(3, to.getContent());
					 pstmt.setInt(4, to.getWrite_seq());
					 
					 if(pstmt.executeUpdate() == 1 ) {
						 flag = 0; //정상
					 }			 
					 
				} catch (SQLException e){
					System.out.println( "[에러] " +  e.getMessage());
				} finally {
					if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
					if(conn != null) try {conn.close();} catch(SQLException e) {}
					if(rs != null) try {rs.close();} catch(SQLException e) {}
				}
			return flag;
		}
		
		public ArrayList<BoardTO> boardList(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			
			ArrayList<BoardTO> boardLists = new ArrayList<>();
			
			try {
				
			conn = this.dataSource.getConnection();
			
			String sql =  "select b.seq, c.seq, b.title, b.content, m.seq , b.write_date, r.like_count from board b left join category c on( b.category_seq = c.seq) left join member m on( m.seq = b.write_seq ) left join reaction r on( b.seq = r.board_seq) where 9  < c.seq and c.seq < 13 order by r.like_count desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
					BoardTO to = new BoardTO();
					to.setSeq(rs.getInt("b.seq"));
					to.setCategory_seq(rs.getInt("c.seq"));
					to.setTitle(rs.getString("b.title"));
					to.setContent(rs.getString("b.content"));
					to.setWrite_seq(rs.getInt("m.seq"));
					to.setWrite_date(rs.getString("b.write_date"));
					to.setLike_count(rs.getInt("r.like_count"));
					
					boardLists.add(to);
				}
			}catch(SQLException e) {
				System.out.println( "[에러] " +  e.getMessage());
			} finally {
				if(conn != null) try {conn.close();} catch(SQLException e) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
				if(rs != null) try {rs.close();} catch(SQLException e) {}
			}
			return boardLists;
		
		}
		
		public BoardTO boardView(BoardTO to) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			
			try{
				conn = this.dataSource.getConnection();
				
				String sql = "select b.title, b.write_date, m.name, b.content from board b left join member m on (b.write_seq = m.seq) where b.seq = ? ";
				pstmt = conn.prepareStatement( sql );
				pstmt.setInt( 1, to.getSeq() );
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					to.setTitle(rs.getString("b.title"));
					to.setWrite_date(rs.getString("b.write_date"));
					to.setWriter(rs.getString("m.name"));
					to.setContent(rs.getString("b.content"));
				}
				
			} catch (SQLException e){
				System.out.println( "[에러] " +  e.getMessage());
				
			} finally {
				if(rs != null) try{rs.close();} catch(SQLException e) {}
				if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
				if(conn != null) try{conn.close();} catch(SQLException e) {}
			}
			return to;
		}
		
		public BoardTO boardModify(BoardTO to) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = this.dataSource.getConnection();
				
				 String sql = "select b.title, b.write_date, m.name, b.content from board b left join member m on (b.write_seq = m.seq) where b.seq = ? ";
			     pstmt = conn.prepareStatement(sql);
			     pstmt.setInt(1, to.getSeq());
			      
			     rs = pstmt.executeQuery();
			      
			      if( rs.next() ){
			    	  to.setTitle(rs.getString("b.title"));
					  to.setWrite_date(rs.getString("b.write_date"));
					  to.setWriter(rs.getString("m.name"));
					  to.setContent(rs.getString("b.content"));
			       }
			       
			    } catch( SQLException e ){
			       System.out.println( "[에러]" +e.getMessage() );
			    } finally {
			       if( rs != null ) try {rs.close();} catch(SQLException e) {}
			       if( pstmt != null ) try {pstmt.close();} catch(SQLException e) {}
			       if( conn != null ) try {conn.close();} catch(SQLException e) {}
			    }
				
				return to;
			}
		
		public int boardModifyOK(MemberTO to1, BoardTO to) {
			
				 Connection conn = null;
				 PreparedStatement pstmt = null;
				 
				 int flag = 2;
				 
				   try{
				      conn = this.dataSource.getConnection();
				      
				      String sql = "insert into board_modify values (0 , now() , ?) ";
				      pstmt = conn.prepareStatement(sql);
				      pstmt.setInt(1, to.getSeq());
				      pstmt.executeUpdate();
				      
				      // 수정할 경우 status = 2 로 고정 값 ( 2 = 수정 )
				      sql = "update board b left join member m on (b.write_seq = m.seq) set b.title = ? , b.content=?, b.status = 2 where b.seq =? and m.password =? ";
				      pstmt = conn.prepareStatement(sql);
				      pstmt.setString( 1, to.getTitle() );
				      pstmt.setString( 2, to.getContent() );
				      pstmt.setInt( 3, to.getSeq() );
				      pstmt.setString( 4, to1.getPassword() );
				      
				      int result = pstmt.executeUpdate(); //수정된애들을 result 에 던진다.
				      if( result ==0 ) {
				         flag = 1;
				      } else if( result ==1 ) {
				         // 정상 동작
				         flag = 0;
				      }
				      
				   } catch( SQLException e ){
				      System.out.println( "[에러]" +e.getMessage() );
				   } finally {
					   if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
					   if(conn != null) try{conn.close();} catch(SQLException e) {}
				      
				   }
				return flag;
		}
		
		public BoardTO boardDelete(BoardTO to) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			try {
				conn = this.dataSource.getConnection();
				
				String sql = "select m.name , b.title, m.password from board b left join member m on  (b.write_seq = m.seq) where b.seq = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, to.getSeq());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					to.setWriter(rs.getString("m.name"));
					to.setTitle(rs.getString("b.title"));
				}
			} catch (SQLException e){
				System.out.println( "[에러] " +  e.getMessage());
				
			} finally {
				if(rs != null) try {rs.close();} catch(SQLException e) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
				if(conn != null) try {conn.close();} catch(SQLException e) {}
			}
			return to;
			
		}
		
		public int boardDeleteOK(MemberTO to1, BoardTO to) {
			
			 Connection conn = null;
			 PreparedStatement pstmt = null;
			 
			 int flag = 2;
			 
			   try{
			      conn = this.dataSource.getConnection();
			      
			      String sql = "insert into board_delete values (0 , now() , ?) ";
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setInt(1, to.getSeq());
			      pstmt.executeUpdate();
			      
			      //삭제시 board 테이블에 기존데이터 그대로 두고 status만 3으로 변경 ( 3 = 삭제 )
			      sql = "update board b left join member m on (b.write_seq = m.seq) set b.status = 3 where b.seq =? and m.password =? ";
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setInt( 1, to.getSeq() );
			      pstmt.setString( 2, to1.getPassword() );
			      
			      int result = pstmt.executeUpdate(); //수정된애들을 result 에 던진다.
			      if( result ==0 ) {
			         flag = 1;
			      } else if( result ==1 ) {
			         // 정상 동작
			         flag = 0;
			      }
			      
			   } catch( SQLException e ){
			      System.out.println( "[에러]" +e.getMessage() );
			   } finally {
				   if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
				   if(conn != null) try{conn.close();} catch(SQLException e) {}
			      
			   }
			return flag;
	}
		
}
