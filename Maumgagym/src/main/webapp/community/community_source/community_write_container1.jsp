
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<hr/>
	<br/><br/><br/>
	<form action="./community/Action/write_ok_Action.jsp" method="post" name="wfrm">
	<div class="container px-3 px-lg-5">
			<!--게시판-->
			<div class="board_view">
				  <div class="col-md-12">
					<p class="h2" style="font-weight: bold;">커뮤니티 쓰기</p>
				 </div>
			<br/>
			 <table class="table text-start table-bordered">
			 	<tr>
					 <td colspan="3">
						 <select class="form-select" aria-label="Default select example">
						  <option selected>커뮤니티의 카테고리를 선택하세요.</option>
						  <option value="10">운동</option>
						  <option value="11">건강</option>
						  <option value="12">수다</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-bg-light p-3">글쓴이</th>
					<td class="top"><input type="text" name="writer" value="" class="form-control" /></td>
				</tr>
				<tr>
					<th width="15%" class="text-bg-light p-3">제목</th>
					<td><input type="text" name="subject" value="" class="form-control"/></td>
				</tr>
				<tr>
					<th width="15%" class="text-bg-light p-3">비밀번호</th>
					<td><input type="password" name="password" value="" class="form-control"/></td>
				</tr>
				<tr>
					<th width="15%" class="text-bg-light p-3" >내용</th>
					<td style="resize: none;"><textarea id="summernote" name="contents" class="form-control" style="resize: none;" ></textarea></td>
				</tr>
				<!--  <tr>
					<th width="15%" class="text-bg-light p-3">이메일</th>
					<td>
						<div class="input-group mb-3">
						  <input type="text" class="form-control" placeholder="이메일ID">
						  @
						  <input type="text" class="form-control" placeholder="메일주소">
						</div>
					</td>
				</tr> -->
				</table>
			</div>
			<div class="row">
				<div class="col-md-6">
					<input type="button" value="목록" class="btn btn-primary" style="cursor: pointer;" onclick="location.href='./communityPage.jsp'" />
				</div>
				<div class="col-md-6 text-end">
					<!-- <input type="button" value="수정" class="btn btn-outline-primary" style="cursor: pointer;" onclick="" />
					<input type="button" value="삭제" class="btn btn-outline-primary" style="cursor: pointer;" onclick="" />  -->
					<input type="button" id="wbtn" value="작성하기" class="btn btn-outline-dark" style="cursor: pointer;" onclick="location.href='./communityPage.jsp'" />
				</div> 
			</div>
			 </form>
			<!--//게시판-->
		
	
	<br/><br/><br/>
	</div>	
</div>
