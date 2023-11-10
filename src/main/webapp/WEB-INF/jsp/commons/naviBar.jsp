<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NaviBar</title>
<!-- <script src="https://code.jquery.com/jquery-3.7.1.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<link rel="stylesheet" href="/css/commons/naviBar.css">
</head>
<body>
	<div class="naviBar">
		<c:if test="${naviBtn != '' }">
			<div class="naviBtn">
				<i class="fa-solid fa-plus naviBtn__icon"></i>
				<div class="naviBtn__text">${naviBtn }</div>
				<input type="hidden" id="location" value="${naviBtnLocation }" />
			</div>
		</c:if>
		<c:forEach var="i" begin="0" end="${naviMenuLength - 1 }">
			<div class="naviConp">
				<div class="naviConp__icon">
					<i class="fa-solid ${naviIcon[i] }"></i>
				</div>
				<div class="naviConp__title">${naviMenu[i] }</div>
				<input type="hidden" class="naviLocation" value="${naviMenuLocation[i] }"/>
			</div>
		</c:forEach>
	</div>
</body>

<script>
	$(".naviBtn").on("click", function() {
		location.href = "/mail/" + $("#location").val();
	})
	
	$(document).on("click", ".naviConp", function() {
		let location = $(this).children(".naviLocation").val();
		window.location.href = "/mail/" + location;
	})
	
	$(document).ready(function() {
		 $(".naviConp__title").each(function() {
	        if ($(this).text() == `${currentMenu}`) {
	            $(this).parent().css("background-color", "#DCEDD4");
	        }
	    });
	})
</script>
</html>