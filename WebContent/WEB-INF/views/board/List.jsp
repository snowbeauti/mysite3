<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mysite3/assets/css/mysite.css" rel="stylesheet"
	type="text/css">
<link href="/mysite3/assets/css/board.css" rel="stylesheet"
	type="text/css">

</head>


<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>


		<div id="aside">
			<h2>게시판</h2>
			<ul>
				<li><a href="./board?action=list">일반게시판</a></li>
				<li><a href="">댓글게시판</a></li>
			</ul>
		</div>
		<!-- //aside -->

		<div id="content">

			<div id="content-head">
				<h3>게시판</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>게시판</li>
						<li class="last">일반게시판</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="board">
				<div id="list">
					<form action="/mysite3/board" method="get">
						<div class="form-group text-right">
							<input type="text">
							<button type="submit" id=btn_search>검색</button>
						</div>
					</form>

					<form action="board" method="get">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>조회수</th>
									<th>작성일</th>
									<th>관리</th>
								</tr>
							</thead>

							<c:forEach items="${boardList}" var="BList" varStatus="status">
								<tbody>
									<tr>
										<td>${status.count}<input type="hidden" name="no"
											value="${BList.no}"></td>
											
										<td class="text-left"><a href="./board?action=read&no=${BList.no}">${BList.title}</a></td>
										<td>${BList.name}</td>
										<td>${BList.hit}</td>
										<td>${BList.reg_date}</td>
										
										<td><c:if test="${authUser.no == BList.user_no}"><a href="./board?action=delete&no=${BList.no}">[삭제]</a></c:if></td>
										
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</form>

					<div id="paging">
						<ul>
							<li><a href="">◀</a></li>
							<li><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li class="active"><a href="">5</a></li>
							<li><a href="">6</a></li>
							<li><a href="">7</a></li>
							<li><a href="">8</a></li>
							<li><a href="">9</a></li>
							<li><a href="">10</a></li>
							<li><a href="">▶</a></li>
						</ul>


						<div class="clear"></div>
					</div>
					<c:if test="${authUser.no != null}">
					<a id="btn_write" href="./board?action=writeform">글쓰기</a>
					</c:if>

				</div>
				<!-- //list -->
			</div>
			<!-- //board -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
	<!-- //wrap -->

</body>

</html>