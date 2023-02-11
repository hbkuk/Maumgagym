<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String id = null;
	
	if( request.getParameter( "id" ) != null && !"null".equals( request.getParameter( "id" ) ) ) {
		id = request.getParameter( "id" );
	} 
	
%>       
    <!-- header navbar -->

	<nav class="navbar navbar-expand-lg navbar-light bg-white text-black">
	    <div class="container px-3 px-lg-5">
	        <a class="navbar-brand" href="./homePage.jsp"><img src="../resources/asset/images/logo_1.jpg" height="36"></a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	                <li class="nav-item px-4 "><a class="nav-link" href="./managerMainPage.jsp">홈</a></li>
	                <li class="nav-item px-4"><a class="nav-link" href="./managerFacilityBoardPage.jsp">운동시설관리</a></li>
	                <li class="nav-item px-4"><a class="nav-link" href="./managerBoardPage.jsp">게시물관리</a></li>
	                <li class="nav-item px-4"><a class="nav-link" href="./managerCommentPage.jsp">댓글관리</a></li>
	                <li class="nav-item px-4"><a class="nav-link" href="./managerMemberPage.jsp">회원관리</a></li>
	                <li class="nav-item px-4"><a class="nav-link" href="#!">접속통계</a></li>
	            </ul>
	         <%--    <%
	            	if( id == null ) {
	            %> --%>
	     <!--        <a class="navbar-brand ps-3 navbar_992_none" href="#">
	              <button type="button" class="btn btn-primary rounded-pill"><span style="font-size:smaller;">로그인</span></button>
	            </a>
	            <a class="navbar-brand ps-3 navbar_992_none" href="#">
	              <button type="button" class="btn btn-light rounded-pill"><span style="font-size:smaller;">회원가입</span></button>
	            </a> -->
       	     <%--    <%
	            	} else { 
            		 %> --%>
	     	            
	     	            <a class="navbar-brand ps-3 navbar_992_none" href="/home">
	     	          	<button type="button" class="btn btn-light rounded-pill" onclick="location.href='./member/Action/logout.jsp'"><span style="font-size:smaller;">로그아웃</span></button>
	     	            </a>
           	      <%--   <%
	            	}
	            %> --%>
	        </div>
	    </div>
	</nav>

	<!-- /header navbar -->