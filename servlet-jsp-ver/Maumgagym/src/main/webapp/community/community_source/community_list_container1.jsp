
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.to.board.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.to.board.CommunityDAO"%>

<%
	
	CommunityDAO dao = new CommunityDAO();
	ArrayList<BoardTO> boardLists = dao.boardList();
	
	int totalRecord = boardLists.size(); //총데이터갯수
	
	StringBuilder sbHtml = new StringBuilder();
			 
			 for( BoardTO to : boardLists){
				int seq = to.getSeq();
				String topic = to.getTopic();
				String nickname = to.getNickname();
				int write_seq = to.getWrite_seq();
				String title = to.getTitle();
				String date = to.getWrite_date();
				int like_count = to.getLike_count();
				String status = to.getStatus();
				 
				sbHtml.append("<tr>");
				sbHtml.append("<td>&nbsp;</td>");
				sbHtml.append("<td scope='row'>" + seq + "</td>");
				sbHtml.append("<td class='text-muted'>" + topic + "</td>");
				sbHtml.append("<td>" + nickname + "</td>");
				if(status.equals("3")){
					sbHtml.append("<td class='text-muted'>삭제된 게시물 입니다.</td>&nbsp;"); 
				}
				else {
					sbHtml.append("<td class='text-start fw-bold'>");
					sbHtml.append("<a href='community_viewPage.jsp?seq=" + seq + "'>" + title + "</a>&nbsp;"); 
					sbHtml.append("</td>");
				}
				sbHtml.append("<td>" + date + "</td>");
				sbHtml.append("<td>" + like_count + "</td>");
				sbHtml.append("<td>&nbsp;</td>");
				sbHtml.append("</tr>");
			 }
%>    
      
<hr/><br/><br/>

<main>
  <div class="container px-3 px-lg-5">
  <br/>
 <p class="h2" style="font-weight: bold;">커뮤니티</p><br/><br/>
    <div class="row align-items-md-stretch">
      <div class="col-md-6">
        <div class="h-100 p-5 text-bg-primary rounded-3">
          <h1>[건강] HOT 여기주목!</h1>
          <p class="h3">2023년 계묘년 뜨는 food! 입맛과 건강을 동시에 챙기고싶으신 부운~</p>
          <button class="btn btn-outline-light" type="button">보러가기</button>
        </div>
      </div>
      <div class="col-md-6">
        <div class="h-100 p-5 bg-info border rounded-3">
          <h1>[운동] HOT 여기주목!</h1>
          <p class="h3">2023년, 가장 주목받고 있는 운동은?!</p><br/>
          <button class="btn btn-outline-light" type="button">보러가기</button>
        </div>
      </div>
    </div>
  </div>
</main>

<div class="container px-3 px-lg-5">
		<br/><br/>
		<form class="row domain-search bg-pblue">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <p class="h5">실시간 전체글 <span class="count"><%= totalRecord%></span>개</p>
                </div>
		        <div class="col-md-4">
		            <div class="input-group">
		                <input type="text" id="search" class="form-control" placeholder="키워드로 검색해보세요." >
		                <button class="btn btn-outline-primary" type="button" id="btn_search">찾기</button>
		            </div>
		        </div>
            </div>
        </div>
       </form>
		
	    <br/>		
		<table class="table table-hover text-center">
		 <thead class="table-primary">
		<tr>
			<th scope="col">&nbsp;</th>
			<th scope="col">번호</th>
			<th scope="col">분류</th>
			<th scope="col">글쓴이</th>
			<th scope="col">제목</th>
			<th scope="col">등록일</th>
			<th scope="col">좋아요</th>
			<th scope="col">&nbsp;</th>
		</tr>
		</thead>	
		
		<%= sbHtml.toString() %> <!-- 절대 디자인이 깨지면 안된다.  -->
	</table>
			<div class="text-end">
				   <input type="button" value="쓰기" class="btn btn-primary" style="cursor: pointer;" onclick="location.href='./community_write.jsp'"/>
			</div>
	
	<br/><br/><br/>
		<ul class="pagination justify-content-center">
		  <li class="page-item"><a class="page-link" href="#"><</a></li>
		  <li class="page-item active"><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">></a></li>
		</ul>
	</div>	
</div>
