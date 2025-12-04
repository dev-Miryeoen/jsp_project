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
			<div class="detail-container">
				<div class="detail-left">
					<form action="/brd/update" method="post" enctype="multipart/form-data">
						<input type="hidden" name="bno" value="${b.bno }">
						<h1>
							<span><span class="detail-span-no">No.${b.bno }</span><span class="detail-span-title"><input type="text" name="title" value="${b.title }" class="form-control"></span></span>
							<span><span class="detail-span-writer">작성자 : ${b.writer }</span><span class="detail-span-regdate">작성일 : ${b.regdate }</span></span>
						</h1>
						<textarea rows="10" col="30" name="content" class="form-control">${b.content }</textarea>
						<img alt="" src="/_fileUpload/${b.imageFile }">
						<input type="file" name="newFile" class="form-control">
						<div class="detailBtnBox">
							<a href="/brd/list"><button type="button" class="btn btn-dark">목록으로</button></a>
							<a href="/brd/modify?bno=${b.bno }"><button type="submit" class="btn btn-primary">수정</button></a>
							<a href="/brd/delete?bno=${b.bno }"><button type="reset" class="btn btn-danger">삭제</button></a>
						</div>
					</form>
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
<script type="text/javascript">
	const loginUser = `<c:out value="${ses.id }"></c:out>`;
	console.log(loginUser);
	if(loginUser != b.writer){
		alert("잘못된 경로입니다!");
		window.history.back();
	}
</script>
</html>