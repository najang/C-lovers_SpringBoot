<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C-lovers</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<!-- css, js -->
<link rel="stylesheet" href="/css/home.css">
<script src="/js/home.js"></script>
</head>
<body>
	<%@ include file="./commons/header.jsp"%>

	<div class="container">
		<!-- MainNavi -->
		<div class="mainNavi">
			<div class="mainNavi__naviItems">
				
				<div class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-regular fa-envelope"></i>
						</div>
					</div>
					<div class="naviItem__title">메일</div>
				</div>
				<div class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-regular fa-clipboard"></i>
						</div>
					</div>
					<div class="naviItem__title">게시판</div>
				</div>
				<div class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-regular fa-calendar"></i>
						</div>
					</div>
					<div class="naviItem__title">일정</div>
				</div>
				<div class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-regular fa-address-book"></i>
						</div>
					</div>
					<div class="naviItem__title">주소록</div>
				</div>
				<div class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-regular fa-clock"></i>
						</div>
					</div>
					<div class="naviItem__title">예약</div>
				</div>
				<div class="naviItems__naviItem" id="humanresources">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-solid fa-sitemap"></i>
						</div>
					</div>
					<div class="naviItem__title">인사</div>
				</div>
				<div class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-regular fa-file-lines"></i>
						</div>
					</div>
					<div class="naviItem__title">전자결재</div>
				</div>
				<div id="officeController" class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-solid fa-gear"></i>
						</div>
					</div>
					<div class="naviItem__title">오피스 관리</div>
				</div>
				<div id="accountingController" class="naviItems__naviItem">
					<div class="naviItem__itemCurcle">
						<div class="itemCurcle__Icon">
							<i class="fa-solid fa-hand-holding-dollar"></i>
						</div>
					</div>
					<div class="naviItem__title">회계지원</div>
				</div>
			</div>
		</div>

		<!-- MainContents  -->
		<div class="mainContents">
			<div class="mainContents__left">

				<!-- WorkCheck -->
				<div class="workCheck">
					<div class="mainContents__title">근무체크</div>
					<div class="mainContents__contentBox">
						<div class="contentBox__date"></div>
						<div class="contentBox__timeline">
							<div class="timeline__time">15:03:48</div>
							<div class="timeline__status">출근전</div>
						</div>
						<div class="contentBox__commute">
							<div class="commute__work" id="attendBtn">
								<div class="work__text">출근하기</div>
								<div class="work__time" id="attendTime">00:00:00</div>
							</div>
							<div class="mainContents__line"></div>
							<div class="commute__work" id="leaveBtn">
								<div class="work__text">퇴근하기</div>
								<div class="work__time" id="leaveTime">00:00:00</div>
							</div>
						</div>
						<div class="contentBox__btns" id="workConditionBtns">
							<div class="btns__line">
								<button id="working">업무</button>
								<button id="goingOut">외출</button>
							</div>
							<div class="btns__line">
								<button id="conference">회의</button>
								<button id="outside">외근</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Approval -->
				<div class="approval">
					<div class="mainContents__title">전자결재</div>
					<div class="mainContents__contentBox">
						<div class="contentBox__btns">
							<div class="btns__line">
								<button>대기</button>
								<button>확인</button>
							</div>
							<div class="btns__line">
								<button>예정</button>
								<button>진행</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Mail -->
				<div class="mail">
					<div class="mainContents__title">메일함 바로가기</div>
					<div class="mainContents__contentBox">
						<div class="contentBox__mailTitle">받은 메일함</div>
						<div class="contentBox__mailTitle">예약 메일함</div>
						<hr></hr>
						<div class="contentBox__mailTitle">오늘 온 메일함</div>
						<div class="contentBox__mailTitle">중요 메일함</div>
					</div>
				</div>

			</div>
			<div class="mainContents__right">

				<!-- Schedule -->
				<div class="schedule">
					<div class="mainContents__title">일정</div>
					<div class="mainContents__contentBox">
						<div class="contentBox__calendar"></div>
						<hr></hr>
						<div class="contentBox__scheduleList">
							<c:forEach var="test" begin="1" end="3" step="1">
								<div class="scheduleList__scheduleItem">
									<div class="scheduleItem__date">
										<div class="date__dayNum">${test }</div>
										<div class="date__dayText">${test }</div>
									</div>
									<div class="mainContents__line"></div>
									<div class="scheduleItem__plan">
										<div class="plan__title">${test }</div>
										<div class="plan__time">${test }</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>