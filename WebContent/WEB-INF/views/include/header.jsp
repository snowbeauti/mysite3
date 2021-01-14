<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.javaex.vo.UserVo"%>

<%
	UserVo authuser = (UserVo) session.getAttribute("authUser");
%>



<div id="header">
	<h1>
		<a href="/mysite3/main">MySite</a>
	</h1>
	<c:choose>
		<c:when test="${authUser == null}">
			<ul>
				<!-- 로그인 전 -->
				<li><a href="/mysite3/user?action=loginform">로그인</a></li>
				<li><a href="/mysite3/user?action=joinform">회원가입</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<!-- 로그인 후 -->
				<li>${authUser.name}님 안녕하세요^^</li>
				<li><a href="">로그아웃</a></li>
				<li><a href="/mysite3/user?action=modifyform">회원정보수정</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
<!-- //header -->

<div id="nav">
	<ul>
		<li><a href="/mysite3/gb?action=addlist">방명록</a></li>
		<li><a href="">갤러리</a></li>
		<li><a href="">게시판</a></li>
		<li><a href="">입사지원서</a></li>
	</ul>
	<div class="clear"></div>
</div>
<!-- //nav -->