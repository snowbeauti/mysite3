<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.javaex.vo.UserVo"%>

<%
	UserVo authuser = (UserVo) session.getAttribute("authUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mysite3/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="/mysite3/assets/css/guestbook.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

		<div id="aside">
			<h2>방명록</h2>
			<ul>
				<li><a href="./gb?action=addlist">일반방명록</a></li>
				<li>ajax방명록</li>
			</ul>
		</div>
		<!-- //aside -->

		<div id="content">
			
			<div id="content-head">
            	<h3>일반방명록</h3>
            	<div id="location">
            		<ul>
            			<li>홈</li>
            			<li>방명록</li>
            			<li class="last">일반방명록</li>
            		</ul>
            	</div>
                <div class="clear"></div>
            </div>
            <!-- //content-head -->

			<div id="guestbook">
			<h4>잘못된 비밀번호입니다.</h4>
				<form action="/mysite2/gb" method="get">
					<table id="guestDelete">
						<colgroup>
							<col style="width: 50%;">
							<col style="width: 50%;">
						</colgroup>
						<tr>
							<td><a href="./gb?action=dform&no=${requestScope.no}">비밀번호 재시도</a></td>
							<td><a href="./gb?action=addlist">방명록으로 가기</a></td>
						</tr>
					</table>
				</form>
				
			</div>
			<!-- //guestbook -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>
		
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	</div>
	<!-- //wrap -->

</body>

</html>

