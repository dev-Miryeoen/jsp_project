<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="registerBox">
				<h1>글작성</h1>
				<!-- enctype="multipart/form-data" : 첨부파일 보낼 때 사용. -->
				<form action="/brd/insert" method="post" enctype="multipart/form-data">
					<div class="row mb-2">
						<label for="title" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" id="title" name="title" class="form-control">
						</div>
					</div>
					<div class="row mb-2">
						<label for="writer" class="col-sm-2 col-form-label">작성자</label>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${ses.id != null}">
									<input type="text" id="writer" name="writer" value="${ses.id }" class="form-control" readonly="readonly"><br/>
								</c:when>
								<c:otherwise>
									<input type="text" id="writer" name="writer" class="form-control"><br/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="row mb-2">
						<label for="content" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<textarea rows="10" cols="30" id="content" name="content" class="form-control"></textarea>
						</div>
					</div>
					<div class="row mb-3">
						<label for="imageFile" class="col-sm-2 col-form-label">첨부파일</label>
						<div class="col-sm-10">
							<input type="file" id="imageFile" name="imageFile" class="form-control">
						</div>
					</div>
					<div class="row">
						<button type="submit" class="btn btn-primary">등록</button>					
					</div>
				</form>
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