<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link href="/resources/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<nav>
			<a href="/">Board</a>
			<div>
				<c:choose>
					<c:when test="${ses.id ne null}">
						<div class="navLoginBox">
							<a href="/user/modify">회원정보수정</a>
							<a href="/user/logout">로그아웃</a>
						</div>
					</c:when>
					<c:otherwise>
						<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</a>						
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
		<main>
			<div class="list-container">
				<h1>게시판</h1>
				
				<!-- search line -->
				<%-- jsp 주석 --%>
				<%-- ${ == eq | != ne} 비교표현식 --%>
				<%-- 동기식 GET 방식으로 데이터 전송 => 구분 / 검색어 / 페이지 / qty --%>
				<div>
					<form action="/brd/list" method="get">
						<div class="searchBox">
							<div class="row search-inner">
								<select name="type" class="form-select col-sm-3">
									<option ${ph.pgvo.type eq null ? 'selected': '' } value="">선택</option>
									<option ${ph.pgvo.type eq 't' ? 'selected': '' } value="t">제목</option>
									<option ${ph.pgvo.type eq 'w' ? 'selected': '' } value="w">작성자</option>
									<option ${ph.pgvo.type eq 'c' ? 'selected': '' } value="c">내용</option>
								</select>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="keyword" placeholder="검색어" value="${ph.pgvo.keyword }">
								</div>
								<input type="hidden" name="pageNo" value="1">
								<input type="hidden" name="qty" value="${ph.pgvo.qty }">
								<button type="submit" class="btn btn-primary col-sm-2">검색</button>
								<c:if test="${not empty ph.pgvo.type}">
									<span>검색결과 : ${ph.totalCount }건</span>				
								</c:if>
							</div>
						</div>
					</form>
				</div>
				<br/>
				
				<table class="table listTable">
					<thead>
						<tr>
							<th class="col-sm-1">No.</th>
							<th class="col-sm-7">제목</th>
							<th class="col-sm-2">작성자</th>
							<th class="col-sm-2">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="b">
							<tr>
								<td><a href="/brd/detail?bno=${b.bno }">${b.bno }</a></td>
								<td>
									<a href="/brd/detail?bno=${b.bno }" class="listABox">
										<!-- 썸네일 이미지 추가 -->
										${b.title }
										<span class="imgSpan">
											<img alt="" src="/_fileUpload/th_${b.imageFile }">
										</span>
									</a>
								</td>
								<td>${b.writer }</td>
								<td>${b.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 가져온 ph 정보를 이용하여 하단 forEach를 구성 -->
				<div class="pagenationBox">
					<!-- 이전 -->
					<c:if test="${ph.prev }">
						<a href="/brd/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> < </a>
					</c:if>
					<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
						<c:choose>
							<c:when test="${i==ph.pgvo.pageNo }">
								<a href="/brd/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" class="active">${i }</a>
							</c:when>
							<c:otherwise>
								<a href="/brd/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${ph.next }">
						<a href="/brd/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> > </a>
					</c:if>
				</div>
				<div class="registerBtnBox">
					<a href="/brd/register" class="btn btn-primary">게시판 글쓰기</a>
				</div>
			</div>
		</main>
	</div>
	<div class="modal fade" id="exampleModal" style="display: none;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			<div>
				<form action="/user/login" method="post">
					<div class="loginInputBox">
						<div class="input-group">
							<input type="text" name="id" class="form-control" placeholder="ID">
						</div>
						<div class="input-group">
							<input type="password" name="pwd" class="form-control" placeholder="PW">
						</div>
						<button type="submit" class="btn btn-primary mb-3">로그인</button>
					</div>
				</form>
			</div>
	        <div><a href="/user/register" class="registerLink">회원가입</a></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</html>