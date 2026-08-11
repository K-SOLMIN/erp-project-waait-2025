<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var ="emp" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="-1">
    <title>Email Application - Mazer Admin Dashboard</title>
    
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
    

  <link rel="stylesheet" href="${path }/resources/assets/compiled/css/application-email.css">
  <link rel="stylesheet" href="${path }/resources/assets/compiled/css/app.css">
  <link rel="stylesheet" href="${path }/resources/assets/compiled/css/app-dark.css">
  <link rel="stylesheet" href="${path }/resources/css/common/layout.css">
  <!-- 메일작성 폼(writemail_form.jsp)을 이 화면 안에서 띄우기 위한 스타일 -->
  <link rel="stylesheet" href="${path }/resources/assets/extensions/summernote/summernote-lite.css">
  <link rel="stylesheet" href="${path }/resources/assets/compiled/css/form-editor-summernote.css">
  <link rel="stylesheet" href="${path }/resources/assets/extensions/filepond/filepond.css">
  <link rel="stylesheet" href="${path }/resources/waait/mail/writemail_css.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
</head>

<body>
    <script src="${path }/resources/assets/static/js/initTheme.js"></script>
	<div id="app">
		<div id="main" style="margin-left: 0px; padding-top: 0px;">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> 
					<i class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading email-application overflow-hidden">
				<div class="page-title">
					<div class="row">
						<!-- <div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Email Application</h3>
							<p class="text-subtitle text-muted">A full inbox-ui for you
								to implement messaging.</p>
						</div> -->
						<div class="logo" style="height: 100; ">
			                <a href="${path }/"><img src="/resources/images/logo.png" alt="Logo" srcset="" width="150px" style="height:90px"></a>
			            </div>
						<!-- <div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Email
										Application</li>
								</ol>
							</nav>
						</div> -->
					</div>
				</div>
				<section class="section content-area-wrapper">
					<div class="sidebar-left">
						<div class="sidebar">
							<div class="sidebar-content email-app-sidebar d-flex">
								<!-- sidebar close icon -->
								<span class="sidebar-close-icon"> <i class="bi bi-x"></i>
								</span>
								<!-- sidebar close icon -->
								<div class="email-app-menu">
									<div class="form-group form-group-compose">
										<!-- compose button  -->
										<button type="button" class="btn btn-primary btn-block my-4 compose-btn"
												onclick="openComposeMail()">메일작성</button>
									</div>
									
									<!-- 사이드바 메뉴 시작 -->
									<div class="sidebar-menu-list" id="sideBarMenu">
										<!-- sidebar menu  -->
										<div class="list-group list-group-messages">
											<a href="javascript:receiveMailList()" class="list-group-item pt-0 active" name="menu" id="받은메일함" onclick="selectMenu(event); saveSelectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#envelope" />
                                        			</svg>
												</div> 받은메일함
												<span class="badge bg-light-primary badge-pill badge-round float-right mt-50">${notReadCount }</span>
											</a> 
											<a href="javascript:sendingMailList()" class="list-group-item" name="menu" id="보낸메일함" onclick="selectMenu(event); saveSelectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#archive" />
                                        			</svg>
												</div> 보낸 메일함
											</a> 
											<a href="javascript:temporarySaveMailBoxView()" class="list-group-item" name="menu" id="임시저장함" onclick="selectMenu(event); saveSelectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#pencil" />
                                        			</svg>
												</div> 임시저장함
											</a> 
											<a href="javascript:changeView('/mail/myfavoritemailbox.do')" class="list-group-item" name="menu" id="즐겨찾기" onclick="selectMenu(event); saveSelectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#star" />
                                        			</svg>
												</div> 즐겨찾기
											</a> 
											<a href="javascript:spamMailBoxView()" class="list-group-item" name="menu" id="스팸메일함" onclick="selectMenu(event); saveSelectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#info-circle" />
                                        			</svg>
												</div> 스팸메일함 <span class="badge bg-light-danger badge-pill badge-round float-right mt-50">${spamMailCount }</span>
											</a> 
											<a href="javascript:trashMailBoxView()" class="list-group-item" name="menu" id="휴지통" onclick="selectMenu(event); saveSelectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#trash" />
                                        			</svg>
												</div> 휴지통
											</a>
											<a href="javascript:mailSettingView()" class="list-group-item" name="menu" id="환경설정" onclick="selectMenu(event);">
												<div class="fonticon-wrap d-inline me-3">
													<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#gear" />
                                        			</svg>
												</div> 환경설정
											</a>
										</div>
										<!-- sidebar menu  end-->

										<!-- sidebar label start -->
										<div class="myMailBoxContainer">
											<div class="myMailBoxContainerTopRow">
												<label class="sidebar-label">MyMailBox</label>
												<button class="addMyMailBoxButton" onclick="addMyMailBox(event)" hidden="true">+</button>
											</div>
											<input type="text" class="mailBoxNameInput" name="myMailBoxName" placeholder="내 메일함 이름 입력" hidden="true">
										</div>
										<script>
											const saveSelectMenu = (event) => {
												const selectMenuName = event.target.id;
												
												fetch(${path} + "/mail/saveselectmenu.do", {
													method : "POST",
													header : {
														"Content-Type" : "application/x-www-form-urlencoded;charset=utf-8"
													},
													body : "menuName=" + selectMenuName
												})
												.then(response => response.text)
												.then(result => {
													
												});
											};
											
											document.querySelector(".myMailBoxContainerTopRow").addEventListener("mouseenter", e => {
												console.log(e.target.lastElementChild);
												e.target.lastElementChild.hidden = false;
											});
											
											document.querySelector(".myMailBoxContainerTopRow").addEventListener("mouseleave", e => {
												e.target.lastElementChild.hidden = true;
											});
											
											const addMyMailBox = (e) => {
												document.querySelector("input[name='myMailBoxName']").hidden = false;
											}
											
											document.querySelector("input[name='myMailBoxName']").addEventListener("blur", e => {
												const mailBoxName = e.target.value;
												if(mailBoxName.length > 0) {
													let userChoice = confirm(mailBoxName + "를 추가하시겠습니까?");
													console.log("result : " + userChoice);
													if(userChoice == true) {
														fetch("${path }/mail/enrollmymailbox.do?wantBoxName=" + mailBoxName)
														.then(response => response.json())
														.then(data => {
															console.log(data);
															//document.getElementById("myMailBoxListContainer").innerHTML += data;
															if(data.errorMsg == "메일함 이름은 중복될 수 없습니다") {
																alert(data.errorMsg);
															} else {
																document.getElementById("myMailBoxListContainer").innerHTML
																	+= "<div style='display:flex;'>"
																		+ "<a href='javascript:changeView(\"${path }/mail/joinmymailbox.do?myMailBoxNo=" + data.myMailBoxNo + "\")' class='list-group-item' name='myMailBox" + data.myMailBoxNo + "' id='" + data.myMailBoxNo + "' onclick='selectMenu(event)'>"
																			+ "<div class='fonticon-wrap d-inline me-3'>"
																				+ "<svg class='bi' width='1.5em' height='1.5em' fill='currentColor'>"
																					+ "<use xlink:href='${path }/resources/assets/static/images/bootstrap-icons.svg#envelope' />"
																				+ "</svg>"
																			+ "</div> " + data.myBoxName
																		+ "</a>"
																		+ "<input type='text' name='myMailBoxName' value='" + data.myBoxName + "' hidden='true' disabled>"
																		+ "<button class='deleteMyMailBoxButton' id='" + data.myMailBoxNo + "' onclick='deleteMyMailBox(event)'>삭제</button>"
																	+ "</div>";
																e.target.value = "";
																e.target.hidden = true;
																
																fetch("${path }/mail/refreshmymailboxmodal.do")
																.then(response => response.text())
																.then(data => {
																	document.getElementById("mymailbox-modalmain").innerHTML = data;
																})
															}
														});
													} else {
														e.target.hidden = true;
													}
												} else {
													e.target.hidden = true;
												}
											});
											
											const showMyMailBoxModal = (function() {
												let resultOpenModal = false;
												const showMyMailBoxModal = () => {
													if(resultOpenModal) {
														document.querySelector(".outer-mymailbox-modal").style.display = "none";
														resultOpenModal = false;
													} else {
														document.querySelector(".outer-mymailbox-modal").style.display = "inline-block";
														resultOpenModal = true;
													}
												}
												return showMyMailBoxModal;
											})();
											
											const moveMailToMyMailBox = (event) => {
												const mailCheckBox = document.querySelectorAll("input[name='checkMail']");
												let checkedMailCount = 0;
												let mailNoStr = "";
												let count = 1;
												const myMailBoxNo = event.currentTarget.id;
												
												mailCheckBox.forEach(e => {
													if(e.checked) checkedMailCount++;
												});
												
												if(checkedMailCount > 0) {
													mailCheckBox.forEach(e => {
														if(e.checked) {
															if(checkedMailCount == count) {
																mailNoStr += e.id;
															} else {
																mailNoStr += e.id + ",";
															}
														}
														count++;
													});
													
													console.log("mailNoStr : " + mailNoStr);
													console.log("myMailBoxNo : " + myMailBoxNo);
													
													fetch("${path }/mail/addmailmymailbox.do", {
														method : "POST",
														headers : {
															"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
														},
														body : "mailNoStr=" + mailNoStr + "&myMailBoxNo=" + myMailBoxNo
													});
													
													alert(event.currentTarget.innerText + "로 이동시켰습니다");
													document.querySelector(".outer-mymailbox-modal").style.display = "none";
												} else {
													alert("이동시킬 메일이 없습니다. 메일을 먼저 체크해주세요");
												}
											}
										</script>
											<div class="list-group list-group-labels" id="myMailBoxListContainer">
											<c:if test="${not empty myMailBoxes }">
												<c:forEach var="myBox" items="${myMailBoxes }">
													<div style="display:flex">
														<a href="javascript:myMailBoxView(${myBox.myMailBoxNo })" class="list-group-item mymailbox-list" name="menu" id="myMailBox${myBox.myMailBoxNo }" onclick="selectMenu(event)">
															<div class="fonticon-wrap d-inline me-3">
																<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
			                                            			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#envelope" />
			                                        			</svg>
															</div>
															<c:if test="${myBox.myMailBoxName.length() <= 7 }">
																<span class="mymailbox-span">${myBox.myMailBoxName }</span>
															</c:if>
															<c:if test="${myBox.myMailBoxName.length() > 7 }">
																<span class="mymailbox-span">${myBox.myMailBoxName.substring(0, 7) }...</span>
															</c:if>
														</a>
														<button class="deleteMyMailBoxButton" id="${myBox.myMailBoxNo }" onclick="deleteMyMailBox(event)">삭제</button>
														<input type="text" name="myMailBoxName" value="${myBox.myMailBoxName }" hidden="true" disabled>
													</div>
												<!-- <a href="#"
													class="list-group-item d-flex justify-content-between align-items-center">
													Work <span class="" style="color:red;">삭제</span>
												</a> 
												<a href="#"
													class="list-group-item d-flex justify-content-between align-items-center">
													Misc <span class="bullet bullet-warning bullet-sm">misc</span>
												</a> 
												<a href="#"
													class="list-group-item d-flex justify-content-between align-items-center">
													Family <span class="bullet bullet-danger bullet-sm">family</span>
												</a> 
												<a href="#"
													class="list-group-item d-flex justify-content-between align-items-center">
													Design <span class="bullet bullet-info bullet-sm">design</span>
	s											</a> -->
											 	</c:forEach>
											</c:if>
										</div>
										<script>
											//내 메일함 이름 ...으로 축약되어있으면 마우스 올려놓을시 풀 네임 보여주고 떠나면 다시 축약된 이름을 보이게함.
											document.querySelectorAll("a[class='list-group-item mymailbox-list']").forEach(e => {
												//mailboxName이 요약된 내 메일함 이름
												let mailboxName = e.lastElementChild.innerText;
												
												if(mailboxName.trim().endsWith("...")) {
													const myMailBoxFullName = e.nextElementSibling.nextElementSibling.value;

													e.addEventListener("mouseenter", e => {
														e.target.nextElementSibling.remove();
														e.target.lastElementChild.innerText = myMailBoxFullName;
													});
													
													e.addEventListener("mouseleave", e => {
														let myMailBoxId = e.target.id;
														let myMailBoxNo = myMailBoxId.substring(9, myMailBoxId.length);
														
														const delButton = document.createElement("button");
														delButton.className = "deleteMyMailBoxButton";
														delButton.id = myMailBoxNo;
														delButton.onclick = deleteMyMailBox;
														delButton.innerText = "삭제";
														
														e.target.after(delButton);
														
														e.target.lastElementChild.innerText = mailboxName;
														
													});
												}
											});
										</script>
										<!-- sidebar label end -->
										<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
											<div class="ps__thumb-x" tabindex="0"
												style="left: 0px; width: 0px;"></div>
										</div>
										<div class="ps__rail-y" style="top: 0px; right: 0px;">
											<div class="ps__thumb-y" tabindex="0"
												style="top: 0px; height: 0px;"></div>
										</div>
									</div>
								</div>
							</div>
							<!-- User new mail right area -->
							<div class="compose-new-mail-sidebar ps">
								<div class="card shadow-none quill-wrapper p-0">
									<div class="card-header">
										<h3 class="card-title" id="emailCompose">New Message</h3>
										<button type="button"
											class="close close-icon email-compose-new-close-btn">
											<i class="bi bi-x"></i>
										</button>
									</div>
									<!-- form start -->
									<form action="#" id="compose-form">
										<div class="card-content">
											<div class="card-body pt-0">
												<div class="form-group pb-50">
													<label for="emailfrom">from</label> <input type="text"
														id="emailfrom" class="form-control"
														placeholder="user@example.com" disabled="">
												</div>
												<div class="form-label-group">
													<input type="email" id="emailTo" class="form-control"
														placeholder="To" required=""> <label for="emailTo">To</label>
												</div>
												<div class="form-label-group">
													<input type="text" id="emailSubject" class="form-control"
														placeholder="Subject"> <label for="emailSubject">Subject</label>
												</div>
												<div class="form-label-group">
													<input type="text" id="emailCC" class="form-control"
														placeholder="CC"> <label for="emailCC">CC</label>
												</div>
												<div class="form-label-group">
													<input type="text" id="emailBCC" class="form-control"
														placeholder="BCC"> <label for="emailBCC">BCC</label>
												</div>
												<!-- Compose mail Quill editor -->
												<div class="snow-container border rounded p-50">
													<div class="compose-editor mx-75 ql-container ql-snow">
														<div class="ql-editor ql-blank" data-gramm="false"
															data-placeholder="Type something....."
															contenteditable="true">
															<p>
																<br>
															</p>
														</div>
														<div class="ql-clipboard" tabindex="-1"
															contenteditable="true"></div>
														<div class="ql-tooltip ql-hidden">
															<a class="ql-preview" target="_blank" href="about:blank"></a><input
																type="text" data-formula="e=mc^2"
																data-link="https://quilljs.com" data-video="Embed URL"><a
																class="ql-action"></a><a class="ql-remove"></a>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<div class="compose-quill-toolbar pb-0 ql-toolbar ql-snow">
															<span class="ql-formats me-0">
																<button class="ql-bold" type="button">
																	<svg viewBox="0 0 18 18">
                                                            <path
																			class="ql-stroke"
																			d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z">
                                                            </path>
                                                            <path
																			class="ql-stroke"
																			d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z">
                                                            </path>
                                                        </svg>
																</button>
																<button class="ql-italic" type="button">
																	<svg viewBox="0 0 18 18">
                                                            <line
																			class="ql-stroke" x1="7" x2="13" y1="4" y2="4"></line>
                                                            <line
																			class="ql-stroke" x1="5" x2="11" y1="14" y2="14">
                                                            </line>
                                                            <line
																			class="ql-stroke" x1="8" x2="10" y1="14" y2="4">
                                                            </line>
                                                        </svg>
																</button>
																<button class="ql-underline" type="button">
																	<svg viewBox="0 0 18 18">
                                                            <path
																			class="ql-stroke"
																			d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3">
                                                            </path>
                                                            <rect
																			class="ql-fill" height="1" rx="0.5" ry="0.5"
																			width="12" x="3" y="15"></rect>
                                                        </svg>
																</button>
																<button class="ql-link" type="button">
																	<svg viewBox="0 0 18 18">
                                                            <line
																			class="ql-stroke" x1="7" x2="11" y1="7" y2="11">
                                                            </line>
                                                            <path
																			class="ql-even ql-stroke"
																			d="M8.9,4.577a3.476,3.476,0,0,1,.36,4.679A3.476,3.476,0,0,1,4.577,8.9C3.185,7.5,2.035,6.4,4.217,4.217S7.5,3.185,8.9,4.577Z">
                                                            </path>
                                                            <path
																			class="ql-even ql-stroke"
																			d="M13.423,9.1a3.476,3.476,0,0,0-4.679-.36,3.476,3.476,0,0,0,.36,4.679c1.392,1.392,2.5,2.542,4.679.36S14.815,10.5,13.423,9.1Z">
                                                            </path>
                                                        </svg>
																</button>
																<button class="ql-image" type="button">
																	<svg viewBox="0 0 18 18">
                                                            <rect
																			class="ql-stroke" height="10" width="12" x="3" y="4">
                                                            </rect>
                                                            <circle
																			class="ql-fill" cx="6" cy="7" r="1"></circle>
                                                            <polyline
																			class="ql-even ql-fill"
																			points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12">
                                                            </polyline>
                                                        </svg>
																</button>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group mt-2">
													<div class="custom-file">
														<input type="file" class="custom-file-input"
															id="emailAttach"> <label
															class="custom-file-label" for="emailAttach">Attach
															File</label>
													</div>
												</div>
											</div>
										</div>
										<div class="card-footer d-flex justify-content-end pt-0">
											<button type="reset"
												class="btn btn-light-secondary cancel-btn me-1">
												<i class="bi bi-x me-3"></i> <span
													class="d-sm-inline d-none">Cancel</span>
											</button>
											<button type="submit" class="btn-send btn btn-primary">
												<i class="bi bi-send me-3"></i> <span
													class="d-sm-inline d-none">Send</span>
											</button>
										</div>
									</form>
									<!-- form start end-->
								</div>
								<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
									<div class="ps__thumb-x" tabindex="0"
										style="left: 0px; width: 0px;"></div>
								</div>
								<div class="ps__rail-y" style="top: 0px; right: 0px;">
									<div class="ps__thumb-y" tabindex="0"
										style="top: 0px; height: 0px;"></div>
								</div>
							</div>
							<!--/ User Chat profile right area -->
						</div>
					</div>
					<div class="content-right">
						<div class="content-overlay"></div>
						<div class="content-wrapper">
							<div class="content-header row"></div>
							<div class="content-body">
								<!-- email app overlay -->
								<div class="app-content-overlay"></div>
								<div class="email-app-area">
									<!-- Email list Area -->
									<div class="email-app-list-wrapper">
										<div class="email-app-list">
											<div class="email-action">
												<!-- action left start here -->
												<div class="action-left d-flex align-items-center">
													<!-- select All checkbox -->
													<div
														class="checkbox checkbox-shadow checkbox-sm selectAll me-3">
														<!-- 전체 체크하는 체크박스 -->
														<input type="checkbox" name="checkAllMail" class='form-check-input' onclick="checkAllMail()"> 
														<label for="checkboxsmall"></label>
													</div>
													<!-- delete unread dropdown -->
													<ul class="list-inline m-0 d-flex">
														<li class="list-inline-item mail-delete">
															<!-- 삭제버튼 -->
															<button type="button" class="btn btn-icon action-icon" data-toggle="tooltip" id="deleteMailButton">
																<span class="fonticon-wrap"> <svg class="bi"
																		width="1.5em" height="1.5em" fill="currentColor">
                                                            <use
																			xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#trash" />
                                                        </svg>
																</span>
															</button>
														</li>
														
														<!-- 내 메일함으로 이동 -->
														<li class="list-inline-item">
															<div class="dropdown">
																<button type="button" class="dropdown-toggle btn btn-icon action-icon" onclick="showMyMailBoxModal()"
																	id="folder" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="fonticon-wrap"> 
																		<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                                			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#folder" />
                                                            			</svg>
																	</span>
																</button>
															</div>
														</li>
														<li class="list-inline-item">
															<div class="dropdown">
																<button type="button" class="btn btn-icon dropdown-toggle action-icon"
																	id="deleteCompletelyButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="fonticon-wrap">완전삭제</span>
																</button>
															</div>
														</li>
														<li class="list-inline-item" id="restoreMailOption" style="display:none">
															<div class="dropdown">
																<button type="button" class="btn btn-icon dropdown-toggle action-icon"
																	id="restoreMailButton" onclick="restoreMail()" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="fonticon-wrap">메일복구</span>
																</button>
															</div>
														</li>
														<li class="list-inline-item mail-unread deleteMyMailBoxMail" style="display:none;">
															<button type="button" class="btn btn-icon action-icon" onclick="deleteMyMailBoxMail()">
																내 메일함에서 삭제
															</button>
														</li>
													</ul>
												</div>
												<!-- action left end here -->

												<!-- action right start here -->
												<div
													class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
													<div class="sidebar-toggle d-block d-lg-none">
														<button class="btn btn-sm btn-outline-primary">
															<i class="bi bi-list fs-5"></i>
														</button>
													</div>
													<!-- search bar  -->
													<div class="email-fixed-search flex-grow-1">
														<div class="form-group position-relative  mb-0 has-icon-left">
															<input type="text" class="form-control" name="searchInput" placeholder="Search email..">
															<div class="form-control-icon">
																<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        			<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#search" />
                                                    			</svg>
															</div>
														</div>
													</div>
													<!-- pagination and page count -->
												</div>
											</div>
											<!-- / action right -->
<script>
	const goMailDetail = (e) => {
		console.log("parentElemet : " + e.currentTarget.parentElement.id)
		const mailNo = e.currentTarget.parentElement.id;
		const mailboxes = document.querySelectorAll("a[name='menu']");
		let selectedMailBox = "";
		mailboxes.forEach(e => {
			if(e.className.includes("active")) {
				selectedMailBox = e.id;
			}
		});
		location.assign("${path }/mail/maildetail.do?mailNo=" + mailNo + "&selectedMailBox=" + selectedMailBox);
	}
	
	//임시저장 메일 이어쓰기도 페이지 이동 없이 목록 자리에서 연다.
	const continueMailWrite = (e) => {
		const mailNo = e.currentTarget.parentElement.id;
		openComposeMail(mailNo);
	}
	
	const checkAllMail = (function() {
		const checkAllMail = () => {
			let booleanResult = true;
			let checkedCount = 0;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) checkedCount++;
			});
			
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(checkedCount == 0) e.checked = true;
				else {
					e.checked = false;
					document.querySelector("input[name='checkAllMail']").checked = false;
				}
			});
		}
		return checkAllMail;
	})();
	
	const checkMail = () => {
		let checkedCount = 0;
		document.querySelectorAll("input[name='checkMail']").forEach(e => {
			if(e.checked) checkedCount++;
		})
		
		if(checkedCount == 0) document.querySelector("input[name='checkAllMail']").checked = false;
	}
	
	document.addEventListener("DOMContentLoaded", e => {
		document.querySelectorAll("li[name='mailList']").forEach(e => {
			console.log("mailId : " + e.id);
		})
	})
	
	//메일 삭제
	const deleteMail = () => {
		console.log("deleteMail onclick");
		let checkedCount = 0;
		document.querySelectorAll("input[name='checkMail']").forEach(e => {
			if(e.checked) checkedCount++;
		});

		let mailNoStr = "";
		let count = 1;
		document.querySelectorAll("input[name='checkMail']").forEach(e => {
			if(e.checked) {
				if(count == checkedCount) {
					mailNoStr += e.id;
				} else {
					mailNoStr += e.id + ",";						
				}
				count++;
			}
		});
		
		fetch("${path }/mail/deletemail.do", {
			method : "POST",
			headers : {
				"content-type" : "application/x-www-form-urlencoded;charset=utf-8"
			},
			body : "mailNoStr=" + mailNoStr
		})
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		})
	}
	
	//별 아이콘을 눌러 즐겨찾기
	const addFavorite = (e) => {
		const mailNo = e.currentTarget.parentElement.parentElement.id;
		const mailFavoriteStatus = e.currentTarget.firstElementChild.className == "favorite text-warning"; //mail의 즐겨찾기 여부를 확인합니다.
		const decisionFavoriteSpan = e.currentTarget.firstElementChild; //span태그의 속성을 변경하기위해 변수로 초기화해줍니다.
		const svgTagForFillYellow = decisionFavoriteSpan.querySelector("use"); //span자식태그의 use태그의 xlink:href 속성을 변경하기위해 use태그 element를 변수로 초기과해줍니다.
		const mailboxes = document.querySelectorAll("a[name='menu']");
		let selectedMailBox = "";
		
		mailboxes.forEach(e => {
			if(e.className.includes("active")) {
				selectedMailBox = e.id;
			}
		});
		console.log("selectedMailBox : " + selectedMailBox);
		//메일의 즐겨찾기 여부를 mailFavoriteStatus의 boolean값으로 확인해 true일 경우에는 즐겨찾기 해제를 하고 false일 경우에는 즐겨찾기를 해줍니다.
		if(mailFavoriteStatus == true) {
			fetch("${path}/mail/canceladdfavorite.do?mailNo=" + mailNo + "&selectedMailBox=" + selectedMailBox)
			.then(response => response.text())
			.then(data => {
				console.log(data);
				if(data == 1) {
					alert("즐겨찾기 해제");
					applicationBoolean = false;
					svgTagForFillYellow.setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star");
					decisionFavoriteSpan.className = "favorite";
				} else {
					alert("실패");
				}
			});
		} else {
			fetch("${path}/mail/addfavorite.do?mailNo=" + mailNo + "&selectedMailBox=" + selectedMailBox)
			.then(response => response.text())
			.then(data => {
				console.log(data);
				if(data == 1) {
					alert("즐겨찾기 추가");
					applicationBoolean = true;
					svgTagForFillYellow.setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill");
					decisionFavoriteSpan.className = "favorite text-warning";
				} else {
					alert("실패");
				}
			});
		}
	}
	//checkbox로 한번에 즐겨찾기
	const addFavorites = () => {
		console.log("addFavoriteFunction()")
		const mailCheckBox = document.querySelectorAll("input[name='checkMail']");
		let checkedCount = 0;
		let mailNoStr = "";
		
		mailCheckBox.forEach(e => {
			if(e.checked) {
				checkedCount++;
			}
		})
		
		let count = 1;
		mailCheckBox.forEach(e => {
			if(e.checked) {
				if(count == checkedCount) {
					mailNoStr += e.id;
				} else {
					mailNoStr += e.id + ",";						
				}
				count++;
			}
		})
		
		console.log(mailNoStr);
		
		fetch("${path}/mail/addfavorite.do?mailNo=" + mailNoStr)
		.then(response => response.text())
		.then(data => {
			if(data == 1) {
				alert("즐겨찾기 추가");
			} else {
				alert("실패");
			}
		});
	}
	
	const sendingMailList = () => {
		console.log("sendingMailList");
		fetch("${path }/mail/joinsendingmailbox.do")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		});
	}
	
	/* function ajaxPaging(pageNo) {
		console.log("왜 너가 실행 돼?");
		fetch("${path }/mail/joinsendingmailbox.do?cPage=1&numPerpage=5")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		});	
	} */
	const changeView = (url) => {
		fetch("${path }" + url)
		.then(response => response.text())
		.then(jspCode => {
			document.getElementById("mailListContainer").innerHTML = jspCode;
		});
	}
	
	const spamMailBoxView = () => {
		fetch("${path }/mail/joinspammail.do")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		})
	}
	
	const temporarySaveMailBoxView = () => {
		fetch("${path }/mail/temporarysavemailbox.do")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		})
	}
	
	const receiveMailList = () => {
		fetch("${path }/mail/receivingmail.do")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		});
	}
	
	const favoriteMailBoxView = () => {
		fetch("${path }/mail/myfavoritemailbox.do")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		});
	}
	
	const trashMailBoxView = () => {
		fetch("${path }/mail/jointrashmailbox.do")
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		});
	}
	
	const myMailBoxView = (myBoxNo) => {
		fetch("${ path}/mail/joinmymailbox.do?myMailBoxNo=" + myBoxNo)
		.then(response => response.text())
		.then(data => {
			document.getElementById("mailListContainer").innerHTML = data;
		});
	}
	
	const selectMenu = (function() {
		let selectMenuName = "받은메일함";
		const selectMenu = (event) => {
			//메일작성 폼이 열려있는 상태로 메뉴를 누르면 목록이 가려져 아무것도 안보인다.
			//메뉴를 고른 시점에 폼을 닫아서 목록이 바로 보이게 한다.
			closeComposeIfOpen();

			document.querySelectorAll("a[name='menu']").forEach(e => {
				e.setAttribute("class", "list-group-item");
			});

			event.currentTarget.setAttribute("class", "list-group-item active");
			selectMenuName = event.currentTarget.id;
			console.log("selectMenuName : " + selectMenuName);
			if(selectMenuName == "myMailBox") {
				document.querySelector(".deleteMyMailBoxMail").style.display = "";
			} else {
				document.querySelector(".deleteMyMailBoxMail").style.display = "none";
			}
			
			if(selectMenuName == "휴지통") {
				document.getElementById("restoreMailOption").style.display = "";
			} else {
				document.getElementById("restoreMailOption").style.display = "none";
			}
		}
		
		document.getElementById("deleteCompletelyButton").addEventListener("click", e => {
			const mailCheckBox = document.querySelectorAll("input[name='checkMail']");
			let checkedCount = 0;
			let mailNoStr = "";
			
			mailCheckBox.forEach(e => {
				if(e.checked) {
					checkedCount++;
				}
			});
			
			let count = 1;
			mailCheckBox.forEach(e => {
				if(e.checked) {
					if(count == checkedCount) {
						mailNoStr += e.id;
					} else {
						mailNoStr += e.id + ",";						
					}
					count++;
				}
			});
			
			console.log("mailNoStr : " + mailNoStr);
			if(checkedCount > 0) {
				if(selectMenuName != "휴지통") {
					alert("완전삭제는 휴지통메뉴에서만 가능합니다");
				} else {
					fetch("${path }/mail/perfectlydeletemail.do", {
						method : "POST",
						headers : {
							"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
						},
						body : "mailNoStr=" + mailNoStr
					})
					.then(response => response.text())
					.then(data => {
						document.getElementById("mailListContainer").innerHTML = data;
					}); 
				}
			} else {
				alert("체크박스를 먼저 체크해주세요");
			}
		});
		
		document.getElementById("deleteMailButton").addEventListener("click", e => {
			console.log("deleteMail onclick");
			let checkedCount = 0;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) checkedCount++;
			});

			let mailNoStr = "";
			let count = 1;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) {
					if(count == checkedCount) {
						mailNoStr += e.id;
					} else {
						mailNoStr += e.id + ",";						
					}
					count++;
				}
			});
			
			if(checkedCount == 0) return;//수정해야함
			console.log("mailNoStr : " + mailNoStr);
			
			fetch("${path }/mail/deletemail.do", {
				method : "POST",
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
				},
				body : "mailNoStr=" + mailNoStr + "&returnViewName=" + selectMenuName
			})
			.then(response => response.text())
			.then(data => {
				document.getElementById("mailListContainer").innerHTML = data;
			});
		})
		return selectMenu;
	})();
	
	document.querySelector("input[name='searchInput']").addEventListener("keyup", e => {
			const modal = document.querySelector(".modal");
			const myMailBoxModal = document.querySelector(".outer-mymailbox-modal");
			if(e.target.value.length > 0) {
				if(myMailBoxModal.style.display == "inline-block") {
					myMailBoxModal.style.display = "none";
				}
				modal.style.display = "grid";
				document.querySelectorAll(".contentSpan").forEach(span => {
					span.innerText = e.target.value;
				});
			} else {
				modal.style.display = "none";
			}
		});
		
		const searchMail = (e) => {
			const searchType = e.currentTarget.firstElementChild.innerText;
			const searchValue = e.currentTarget.lastElementChild.innerText;
			console.log("searchType : " + searchType);
			console.log("searchValue : " + searchValue);
			if(searchValue.length > 0) {
				fetch("${path }/mail/searchmail.do", {
					method : "POST",
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
					},
					body : "searchType=" + searchType + "&searchValue=" + searchValue
				})
				.then(response => response.text())
				.then(data => {
					document.getElementById("mailListContainer").innerHTML = data;
				})
			} else {
				alert("입력값이 없습니다.");
			}
		}
		
		const deleteMyMailBox = (e) => {
			const myMailBoxNo = e.currentTarget.id;
			const myMailBoxName = e.currentTarget.nextElementSibling.value;
			const result = confirm(myMailBoxName + "을(를) 삭제하시겠습니까?");
			if(result == true) {
				console.log("result : " + result);
				fetch("${path }/mail/deletemymailbox.do", {
					method : "POST",
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
					},
					body : "myMailBoxNo=" + myMailBoxNo
				})
				.then(response => response.text())
				.then(data => {
					document.getElementById("myMailBoxListContainer").innerHTML = data;
					
					fetch("${path }/mail/refreshmymailboxmodal.do")
					.then(response => response.text())
					.then(data => {
						document.getElementById("mymailbox-modalmain").innerHTML = data;
					})
				})
			}
		}
		
		const restoreMail = () => {
			const checkMail = document.querySelectorAll("input[name='checkMail']");
			let checkedMailCount = 0;
			let count = 1;
			let mailNoStr = "";
			
			checkMail.forEach(e => {
				if(e.checked) checkedMailCount++;
			});
			
			console.log("checkedMailCount : " + checkedMailCount);
			console.log(count == checkedMailCount);
			if(checkedMailCount > 0) {
				checkMail.forEach(e => {
					if(e.checked) {
						if(checkedMailCount == count) {
							mailNoStr += e.id;
						} else {
							console.log(",더함 else문에빠짐");
							mailNoStr += e.id + ","
						}
						count++;
					}
				});
				
				console.log("mailNoStr : " + mailNoStr);
				fetch("${path }/mail/restoretrashmail.do?mailNoStr=" + mailNoStr, {
					method : "POST",
					headers : {
						"Content_Type" : "application/x-www-form-urlencoded;charset=UTF-8"
					},
					body : "mailNoStr=" + mailNoStr
				})
				.then(response => response.text())
				.then(data => {
					console.log(data);
					if(data > 0) {
						alert("복구되었습니다.");
					} else {
						alert("복구에 실패했습니다.");
					}
					changeView("/mail/jointrashmailbox.do");
				})
			} else {
				alert("메일을 먼저 체크해주세요");
			}
		}
</script>

<c:if test="${not empty selectedMailBox }">
<input value="${selectedMailBox }" id="selectedMailBoxName" hidden="true">
	<script>
		//이거 지금 왜 되는지 모르겠다;;
		let selectedMailBoxName = document.getElementById("selectedMailBoxName").value;
		const mailBox = document.querySelectorAll("a[name='menu']");
		//전에 선택한 메일박스 선택되있게하는 로직
		mailBox.forEach(e => {
			e.setAttribute("class", "list-group-item");
			
			if(e.id == selectedMailBoxName) {
				e.setAttribute("class", "list-group-item active");
			}
		});
		
		/* if(selectedMailBoxName.include("myMailBox")) {
			
		} */
		
		//전에 선택한 메일함리스트 로드하는 로직
		switch(selectedMailBoxName) {
			case "보낸메일함" : sendingMailList(); break;
			case "즐겨찾기" : favoriteMailBoxView(); break;
			case "스팸메일함" : spamMailBoxView(); break;
			case "임시저장함" : temporarySaveMailBoxView(); break;
			case "휴지통" : trashMailBoxView(); break;
			case "myMailBox" : 
		}
	</script>
</c:if>
											<!-- email user list start -->
											<div class="email-user-list list-group ps ps--active-y" id="mailListContainer">
												<c:if test="${not empty mails }">
													<ul class="users-list-wrapper media-list" id="mailListUlTag">
														<c:forEach var="mail" items="${mails }" >
															<%-- <c:set var="favoriteIconUrl" value="${mail.mailStatus eq '즐겨찾기' ? path + '/resources/assets/static/images/bootstrap-icons.svg#star-fill' : path + '/resources/assets/static/images/bootstrap-icons.svg#star'}"/> --%>
															<li class=
																<c:forEach var="receiver" items="${mail.receivers }" >
															 	   <c:if test="${receiver.mailReceiverAddress eq emp.empEmail and receiver.receiverReadStatus eq 'Y' }">"media mail-read"</c:if>
																   <c:if test="${receiver.mailReceiverAddress eq emp.empEmail and receiver.receiverReadStatus ne 'Y' }">"media"</c:if>
																</c:forEach >
																id="${mail.mailNo }" name="mailList">
																<div class="user-action">
																	<div class="checkbox-con me-3">
																		<div class="checkbox checkbox-shadow checkbox-sm">
																			<!-- 메일 하나하나에 있는 체크박스 -->
																			<input type="checkbox" name="checkMail" class='form-check-input' onclick="checkMail()" id="${mail.mailNo }"> 
																		</div>
																	</div>
																	<button class="icon-button" onclick="addFavorite(event)">
																	<span id="colorDecisionSpan" class=
																		<c:if test="${mail.mailStatus eq '즐겨찾기' }" >
								                                        	"favorite text-warning"
								                                        </c:if>
																		<c:if test="${mail.mailStatus != '즐겨찾기' }" >
								                                        	"favorite"
								                                        </c:if>
								                                	>
																		<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
								                                            <use xlink:href=<c:if test="${mail.mailStatus eq '즐겨찾기' }" >
										                                                    	"${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill"
										                                                    </c:if>
																							<c:if test="${mail.mailStatus != '즐겨찾기' }" >
										                                                    	"${path }/resources/assets/static/images/bootstrap-icons.svg#star"
										                                                 	</c:if> id="iconPath" 
										                                    />
								                                        </svg>
								                                    </span>
							                                        </button>
																</div>
																<div class="pr-50">
																	<div class="avatar">
																		<img
																			src="${path }/resources/assets/compiled/jpg/1.jpg"
																			alt="avtar img holder">
																	</div>
																</div>
																<div class="media-body" onclick="goMailDetail(event)">
																	<div class="user-details">
																		<div class="mail-items">
																			<span class="list-group-item-text text-truncate">${mail.senderMailAddress }
																				<${mail.senderName }></span>
																		</div>
																		<div class="mail-meta-item">
																			<span class="float-right"> <span
																				class="mail-date">${mail.mailWriteDate }</span>
																			</span>
																		</div>
																	</div>
																	<div class="mail-message">
																		<p class="list-group-item-text truncate mb-0">
																			${mail.mailTitle }</p>
																		<div class="mail-meta-item">
																			<span class="float-right"> <span
																				class="bullet bullet-success bullet-sm"></span>
																			</span>
																		</div>
																	</div>
																</div>
															</li>
														</c:forEach>
													</ul>
												</c:if>

													<%-- <li class="media mail-read">
														<div class="user-action">
															<div class="checkbox-con me-3">
																<div class="checkbox checkbox-shadow checkbox-sm">
																	<input type="checkbox" id="checkboxsmall12"
																		class='form-check-input'> <label
																		for="checkboxsmall12"></label>
																</div>
															</div>
															<span class="favorite"> <svg class="bi"
																	width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
																		xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#star" />
                                                    </svg>
															</span>
														</div>
														<div class="pr-50">
															<div class="avatar">
																<img class="rounded-circle"
																	src="${path }/resources/assets/compiled/jpg/3.jpg"
																	alt="Generic placeholder image">
															</div>
														</div>
														<div class="media-body">
															<div class="user-details">
																<div class="mail-items">
																	<span class="list-group-item-text text-truncate mb-0">
																		Know Yourself Your Inner Power </span>
																</div>
																<div class="mail-meta-item">
																	<span class="float-right"> <span
																		class="mail-date">21 Mar</span>
																	</span>
																</div>
															</div>
															<div class="mail-message">
																<p class="list-group-item-text mb-0 truncate">Hope
																	your like it, or feel free to comment, feedback or
																	rebound !</p>
																<div class="mail-meta-item">
																	<span class="float-right"> <span
																		class="bullet bullet-warning bullet-sm"></span>
																	</span>
																</div>
															</div>
														</div>
													</li> --%>
												<div id="bageParContainer">
													${pageBar }										
												</div>
												<!-- <ul class="pagination pagination-sm justify-content-center" id="pageBar" style="margin-top : 50px;">
													<li class="page-item">
														<a class="page-link" href="#">이전</a>
													</li>
													<li class="page-item">
														<a class="page-link" href="#">1</a>
													</li>
												</ul> -->
												<!-- email user list end -->

												<!-- no result when nothing to show on list -->
												<c:if test="${empty mails }">
													<div class="no-results">
														<i class="bi bi-error-circle font-large-2"></i>
														<h5>No Items Found</h5>
													</div>
													<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
														<div class="ps__thumb-x" tabindex="0"
															style="left: 0px; width: 0px;"></div>
													</div>
													<div class="ps__rail-y"
														style="top: 0px; height: 733px; right: 0px;">
														<div class="ps__thumb-y" tabindex="0"
															style="top: 0px; height: 567px;"></div>
													</div>
												</c:if>
											</div>
											<!-- mailListContainer div end -->

											<!-- 메일작성 폼(writemail_response.jsp)이 들어오는 자리.
												 폼을 열면 위쪽 툴바(.email-action)와 목록을 감추고 여기만 보여준다. -->
											<div id="mailComposeContainer" style="display:none;"></div>
										</div>
									</div>
									<!--/ Email list Area -->

									<!-- Detailed Email View -->
									<div class="email-app-details">
										<!-- email detail view header -->
										<div class="email-detail-header">
											<div class="email-header-left d-flex align-items-center mb-1">
												<span class="go-back me-3"> <span
													class="fonticon-wrap d-inline"> <i
														class="fas fa-chevron-left"></i>
												</span>
												</span>
												<h5 class="email-detail-title font-weight-normal mb-0">
													Advertising Internet Online <span
														class="badge bg-light-danger badge-pill ms-1">PRODUCT</span>
												</h5>
											</div>
											<div class="email-header-right mb-1 ms-2 pl-1">
												<ul class="list-inline m-0">
													<li class="list-inline-item">
														<button class="btn btn-icon action-icon">
															<span class="fonticon-wrap"> <i
																class="fas fa-trash"></i>
															</span>
														</button>
													</li>
													<li class="list-inline-item">
														<button class="btn btn-icon action-icon">
															<span class="fonticon-wrap"> <svg class="bi"
																	width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
																		xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#envelope" />
                                                    </svg>
															</span>
														</button>
													</li>
													<li class="list-inline-item">
														<div class="dropdown">
															<button class="btn btn-icon dropdown-toggle action-icon"
																id="open-mail-menu" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false">
																<span class="fonticon-wrap"> <i
																	class="fas fa-folder"></i>
																</span>
															</button>
															<div class="dropdown-menu dropdown-menu-right" aria-labelledby="open-mail-menu">
																<a class="dropdown-item" href="javascript:temporarySaveMailBoxView()">
																	<i class="bi bi-edit"></i> 임시저장
																</a>
																<a class="dropdown-item" href="#">
																	<i class="bi bi-info-circle"></i> Spam
																</a>
																<a class="dropdown-item" href="#">
																	<i class="bi bi-trash"></i> Trash
																</a>
															</div>
														</div>
													</li>
													<li class="list-inline-item">
														<div class="dropdown">
															<button class="btn btn-icon dropdown-toggle action-icon"
																id="open-mail-tag" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false">
																<span class="fonticon-wrap"> <i
																	class="fas fa-tag"></i>
																</span>
															</button>
															<div class="dropdown-menu dropdown-menu-right"
																aria-labelledby="open-mail-tag">
																<a href="#" class="dropdown-item align-items-center">
																	<span class="bullet bullet-success bullet-sm"></span>
																	Product
																</a> <a href="#" class="dropdown-item align-items-center">
																	<span class="bullet bullet-primary bullet-sm"></span>
																	Work
																</a> <a href="#" class="dropdown-item align-items-center">
																	<span class="bullet bullet-warning bullet-sm"></span>
																	Misc
																</a> <a href="#" class="dropdown-item align-items-center">
																	<span class="bullet bullet-danger bullet-sm"></span>
																	Family
																</a> <a href="#" class="dropdown-item align-items-center">
																	<span class="bullet bullet-info bullet-sm"></span>
																	Design
																</a>
															</div>
														</div>
													</li>
													<li class="list-inline-item"><span
														class="no-of-list d-none d-sm-block ms-1">1-10 of
															653</span></li>
													<li class="list-inline-item">
														<button
															class="btn btn-icon email-pagination-prev action-icon">
															<i class="bi bi-chevron-left"></i>
														</button>
													</li>
													<li class="list-inline-item">
														<button
															class="btn btn-icon email-pagination-next action-icon">
															<i class="bi bi-chevron-right"></i>
														</button>
													</li>
												</ul>
											</div>
										</div>
										<!-- email detail view header end-->
										<div class="email-scroll-area ps ps--active-y">
											<!-- email details  -->
											<div class="row">
												<div class="col-12">
													<div class="collapsible email-detail-head">
														<div class="card collapse-header" role="tablist">
															<div id="headingCollapse5"
																class="card-header d-flex justify-content-between align-items-center"
																data-toggle="collapse" role="tab"
																data-target="#collapse5" aria-expanded="false"
																aria-controls="collapse5">
																<div class="collapse-title media">
																	<div class="pr-1">
																		<div class="avatar me-3">
																			<img
																				src="${path }/resources/assets/compiled/jpg/8.jpg"
																				alt="avtar img holder" width="30" height="30">
																		</div>
																	</div>
																	<div class="media-body mt-25">
																		<span class="text-primary">Elnora Reese</span> <span
																			class="d-sm-inline d-none">
																			&lt;elnora@gmail.com&gt;</span> <small
																			class="text-muted d-block">to Lois Jimenez</small>
																	</div>
																</div>
																<div
																	class="information d-sm-flex d-none align-items-center">
																	<small class="text-muted me-3">15 Jul 2019,
																		10:30</small> <span class="favorite"> <i
																		class="bi bi-star me-3"></i>
																	</span>
																	<div class="dropdown">
																		<a href="#" class="dropdown-toggle"
																			id="fisrt-open-submenu" data-toggle="dropdown"
																			aria-haspopup="true" aria-expanded="false"> <i
																			class="bi bi-dots-vertical-rounded me-0"></i>
																		</a>
																		<div class="dropdown-menu dropdown-menu-right"
																			aria-labelledby="fisrt-open-submenu">
																			<a href="#" class="dropdown-item mail-reply"> <i
																				class="bi bi-share"></i> Reply
																			</a> <a href="#" class="dropdown-item"> <i
																				class="bi bi-redo"></i> Forward
																			</a> <a href="#" class="dropdown-item"> <i
																				class="bi bi-info-circle"></i> Report Spam
																			</a>
																		</div>
																	</div>
																</div>
															</div>
															<div id="collapse5" role="tabpanel"
																aria-labelledby="headingCollapse5" class="collapse">
																<div class="card-content">
																	<div class="card-body py-1">
																		<p class="text-bold-500">Greetings!</p>
																		<p>Lorem Ipsum is simply dummy text of the
																			printing and typesetting industry. Lorem Ipsum has
																			been the industry's standard dummy text ever since
																			the 1500s, when an unknown printer took a galley of
																			type and scrambled it to make a type specimen book.</p>
																		<p>It has survived not only five centuries, but
																			also the leap into electronic typesetting, remaining
																			essentially unchanged.</p>
																		<p class="mb-0">Sincerely yours,</p>
																		<p class="text-bold-500">Envato Design Team</p>
																	</div>
																	<div class="card-footer pt-0 border-top">
																		<label class="sidebar-label">Attached Files</label>
																		<ul class="list-unstyled mb-0">
																			<li class="cursor-pointer pb-25"><img
																				src="../../../app-assets/static/images/icon/psd.png"
																				alt="psd.png" height="30"> <small
																				class="text-muted ms-1 attchement-text">uikit-design.psd</small>
																			</li>
																			<li class="cursor-pointer"><img
																				src="../../../app-assets/static/images/icon/sketch.png"
																				alt="sketch.png" height="30"> <small
																				class="text-muted ms-1 attchement-text">uikit-design.sketch</small>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<div class="card collapse-header" role="tablist">
															<div id="headingCollapse6"
																class="card-header d-flex justify-content-between align-items-center"
																data-toggle="collapse" role="tab"
																data-target="#collapse6" aria-expanded="false"
																aria-controls="collapse6">
																<div class="collapse-title media">
																	<div class="pr-1">
																		<div class="avatar me-3">
																			<img
																				src="${path }/resources/assets/static/images/faces/19.jpg"
																				alt="avtar img holder" width="30" height="30">
																		</div>
																	</div>
																	<div class="media-body mt-25">
																		<span class="text-primary">Lois Jimenez </span> <span
																			class="d-sm-inline d-none">
																			&lt;lois_jim@gmail.com&gt;</span> <small
																			class="text-muted d-block">to Elnora Reese</small>
																	</div>
																</div>
																<div
																	class="information d-sm-flex d-none align-items-center">
																	<i class="bi bi-paperclip me-3"></i> <small
																		class="text-muted me-3">10 Jul 2019, 10:30</small> <span
																		class="favorite"> <i class="bi bi-star me-3"></i>
																	</span>
																	<div class="dropdown">
																		<a href="#" class="dropdown-toggle"
																			id="second-open-submenu" data-toggle="dropdown"
																			aria-haspopup="true" aria-expanded="false"> <i
																			class="bi bi-dots-vertical-rounded me-0"></i>
																		</a>
																		<div class="dropdown-menu dropdown-menu-right"
																			aria-labelledby="second-open-submenu">
																			<a href="#" class="dropdown-item mail-reply"> <i
																				class="bi bi-share"></i> Reply
																			</a> <a href="#" class="dropdown-item"> <i
																				class="bi bi-redo"></i> Forward
																			</a> <a href="#" class="dropdown-item"> <i
																				class="bi bi-info-circle"></i> Report Spam
																			</a>
																		</div>
																	</div>
																</div>
															</div>
															<div id="collapse6" role="tabpanel"
																aria-labelledby="headingCollapse7" class="collapse">
																<div class="card-content">
																	<div class="card-body py-1">
																		<p class="text-bold-500">Greetings!</p>
																		<p>Successful businesses have many things in
																			common, today we’ll look at the big ‘R’of recognition
																			and how a digital advertising network may help.
																			Recognition can be illustrated by two individuals
																			entering a crowded room at a party. Both walk to the
																			far side of the room, one of them slips through the
																			crowd easily and unnoticed as they reach the far
																			side.</p>
																		<p>Gummies sweet tart marzipan lemon drops donut
																			pie. Chocolate cake gingerbread jujubes gingerbread
																			chocolate cake tart bear claw apple pie jelly-o.
																			Gummies biscuit brownie marshmallow oat cake tootsie
																			roll bear claw topping. Oat cake sesame snaps icing
																			cupcake wafer tiramisu jelly-o sugar plum carrot cake
																		</p>
																		<p class="mb-0">Sincerely yours,</p>
																		<p class="text-bold-500">Envato Design Team</p>
																	</div>
																	<div class="card-footer pt-0 border-top">
																		<label class="sidebar-label">Attached Files</label>
																		<ul class="list-unstyled mb-0">
																			<li class="cursor-pointer pb-25"><img
																				src="../../../app-assets/static/images/icon/psd.png"
																				alt="psd.png" height="30"> <small
																				class="text-muted ms-1 attchement-text">uikit-design.psd</small>
																			</li>
																			<li class="cursor-pointer"><img
																				src="../../../app-assets/static/images/icon/sketch.png"
																				alt="sketch.png" height="30"> <small
																				class="text-muted ms-1 attchement-text">uikit-design.sketch</small>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<div class="card collapse-header open" role="tablist">
															<div id="headingCollapse7"
																class="card-header d-flex justify-content-between align-items-center"
																data-toggle="collapse" role="tab"
																data-target="#collapse7" aria-expanded="false"
																aria-controls="collapse7">
																<div class="collapse-title media">
																	<div class="pr-1">
																		<div class="avatar me-3">
																			<img
																				src="${path }/resources/assets/compiled/jpg/8.jpg"
																				alt="avtar img holder" width="30" height="30">
																		</div>
																	</div>
																	<div class="media-body mt-25">
																		<span class="text-primary">Elnora Reese</span> <span
																			class="d-sm-inline d-none">&lt;elnora@gmail.com&gt;</span>
																		<small class="text-muted d-block">to Lois
																			Jimenez</small>
																	</div>
																</div>
																<div
																	class="information d-sm-flex d-none align-items-center">
																	<small class="text-muted me-3">05 Jul 2019,
																		10:30</small> <span class="favorite text-warning"> <svg
																			class="bi" width="1.5em" height="1.5em"
																			fill="currentColor">
                                                                <use
																				xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill" />
                                                            </svg>
																	</span>
																	<div class="dropdown">
																		<a href="#" class="dropdown-toggle"
																			id="third-open-menu" data-toggle="dropdown"
																			aria-haspopup="true" aria-expanded="false"> <i
																			class="bi bi-dots-vertical-rounded me-0"></i>
																		</a>
																		<div class="dropdown-menu dropdown-menu-right"
																			aria-labelledby="second-open-submenu">
																			<a href="#" class="dropdown-item mail-reply"> <i
																				class="bi bi-share"></i> Reply
																			</a> <a href="#" class="dropdown-item"> <i
																				class="bi bi-redo"></i> Forward
																			</a> <a href="#" class="dropdown-item"> <i
																				class="bi bi-info-circle"></i> Report Spam
																			</a>
																		</div>
																	</div>
																</div>
															</div>
															<div id="collapse7" role="tabpanel"
																aria-labelledby="headingCollapse7" class="collapse show">
																<div class="card-content">
																	<div class="card-body py-1">
																		<p class="text-bold-500">Greetings!</p>
																		<p>It is a long established fact that a reader
																			will be distracted by the readable content of a page
																			when looking at its layout.The point of using Lorem
																			Ipsum is that it has a more-or-less normal
																			distribution of letters, as opposed to using 'Content
																			here, content here',making it look like readable
																			English.</p>
																		<p>There are many variations of passages of Lorem
																			Ipsum available, but the majority have suffered
																			alteration in some form, by injected humour, or
																			randomised words which don't look even slightly
																			believable.</p>
																		<p class="mb-0">Sincerely yours,</p>
																		<p class="text-bold-500">Envato Design Team</p>
																	</div>
																	<div class="card-footer pt-0 border-top">
																		<label class="sidebar-label">Attached Files</label>
																		<ul class="list-unstyled mb-0">
																			<li class="cursor-pointer pb-25"><img
																				src="../../../app-assets/static/images/icon/psd.png"
																				alt="psd.png" height="30"> <small
																				class="text-muted ms-1 attchement-text">uikit-design.psd</small>
																			</li>
																			<li class="cursor-pointer"><img
																				src="../../../app-assets/static/images/icon/sketch.png"
																				alt="sketch.png" height="30"> <small
																				class="text-muted ms-1 attchement-text">uikit-design.sketch</small>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- email details  end-->
											<div class="row px-2 mb-4">
												<!-- quill editor for reply message -->
												<div class="col-12 px-0">
													<div class="card shadow-none border rounded">
														<div class="card-body quill-wrapper">
															<span>Reply to Lois Jimenez</span>
															<div class="snow-container" id="detail-view-quill">
																<div class="detail-view-editor ql-container ql-snow">
																	<div class="ql-editor ql-blank" data-gramm="false"
																		data-placeholder="Type something....."
																		contenteditable="true">
																		<p>
																			<br>
																		</p>
																	</div>
																	<div class="ql-clipboard" tabindex="-1"
																		contenteditable="true"></div>
																	<div class="ql-tooltip ql-hidden">
																		<a class="ql-preview" target="_blank"
																			href="about:blank"></a><input type="text"
																			data-formula="e=mc^2" data-link="https://quilljs.com"
																			data-video="Embed URL"><a class="ql-action"></a><a
																			class="ql-remove"></a>
																	</div>
																</div>
																<div class="d-flex justify-content-end">
																	<div class="detail-quill-toolbar ql-toolbar ql-snow">
																		<span class="ql-formats me-3">
																			<button class="ql-bold" type="button">
																				<svg viewBox="0 0 18 18">
                                                                        <path
																						class="ql-stroke"
																						d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z">
                                                                        </path>
                                                                        <path
																						class="ql-stroke"
																						d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z">
                                                                        </path>
                                                                    </svg>
																			</button>
																			<button class="ql-italic" type="button">
																				<svg viewBox="0 0 18 18">
                                                                        <line
																						class="ql-stroke" x1="7" x2="13" y1="4" y2="4"></line>
                                                                        <line
																						class="ql-stroke" x1="5" x2="11" y1="14" y2="14"></line>
                                                                        <line
																						class="ql-stroke" x1="8" x2="10" y1="14" y2="4"></line>
                                                                    </svg>
																			</button>
																			<button class="ql-underline" type="button">
																				<svg viewBox="0 0 18 18">
                                                                        <path
																						class="ql-stroke"
																						d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3">
                                                                        </path>
                                                                        <rect
																						class="ql-fill" height="1" rx="0.5" ry="0.5"
																						width="12" x="3" y="15"></rect>
                                                                    </svg>
																			</button>
																			<button class="ql-link" type="button">
																				<svg viewBox="0 0 18 18">
                                                                        <line
																						class="ql-stroke" x1="7" x2="11" y1="7" y2="11"></line>
                                                                        <path
																						class="ql-even ql-stroke"
																						d="M8.9,4.577a3.476,3.476,0,0,1,.36,4.679A3.476,3.476,0,0,1,4.577,8.9C3.185,7.5,2.035,6.4,4.217,4.217S7.5,3.185,8.9,4.577Z">
                                                                        </path>
                                                                        <path
																						class="ql-even ql-stroke"
																						d="M13.423,9.1a3.476,3.476,0,0,0-4.679-.36,3.476,3.476,0,0,0,.36,4.679c1.392,1.392,2.5,2.542,4.679.36S14.815,10.5,13.423,9.1Z">
                                                                        </path>
                                                                    </svg>
																			</button>
																			<button class="ql-image" type="button">
																				<svg viewBox="0 0 18 18">
                                                                        <rect
																						class="ql-stroke" height="10" width="12" x="3"
																						y="4"></rect>
                                                                        <circle
																						class="ql-fill" cx="6" cy="7" r="1">
                                                                        </circle>
                                                                        <polyline
																						class="ql-even ql-fill"
																						points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12">
                                                                        </polyline>
                                                                    </svg>
																			</button>
																		</span>
																	</div>
																	<button class="btn btn-primary send-btn">
																		<i class="bi bi-send me-3"></i> <span
																			class="d-none d-sm-inline"> Send</span>
																	</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
												<div class="ps__thumb-x" tabindex="0"
													style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps__rail-y"
												style="top: 0px; height: 736px; right: 0px;">
												<div class="ps__thumb-y" tabindex="0"
													style="top: 0px; height: 626px;"></div>
											</div>
										</div>
									</div>
									<!--/ Detailed Email View -->
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>

			<footer class="mt-4">
				<div class="footer text-muted">
					<p>2023 &copy; waaIT</p>
				</div>
			</footer>
		</div>
	</div>
	
	<!-- modal -->
	<div class="modal">
		<div class="button" id="searchTitleContainer">
			<button id="searchTtitleButton" onclick="searchMail(event)">
				<span class="searchType">[타이틀]</span>
				<span class="contentSpan"></span>
			</button>
		</div>
		<div class="button" id="searchContentContainer">
			<button id="searchContentButton" onclick="searchMail(event)">
				<span class="searchType">[내용]</span>
				<span class="contentSpan"></span>
			</button>
		</div>
		<div class="button" id="searchSenderContainer">
			<button id="searchSenderButton" onclick="searchMail(event)">
				<span class="searchType">[보낸사람]</span>
				<span class="contentSpan"></span>
			</button>
		</div>
		<div id="recentSearchContainer">
			<p style="margin:0px; padding-left:3px;">최근 검색어</p>
			<c:if test="${not empty recentSearch }">
				<c:forEach var="recent" items="${recentSearch }">
					<div class="recentButtonContainer padding-top-5" id="recentSearchButtonContainer">
						<button class="recentSearchButton padding-bottom-5" onclick="searchMailByRecentSearch(event)">
							<span class="recentSearchType">
								<c:if test="${recent.searchType eq 'M.MAILCONTENT' }">[내용]</c:if>
								<c:if test="${recent.searchType eq 'M.MAILTITLE' }">[타이틀]</c:if>
								<c:if test="${recent.searchType eq 'E.EMPEMAIL' }">[보낸사람]</c:if>
							</span>
							<span class="recentContentSpan">${recent.searchValue }</span>
						</button>
						<button class="searchDeleteButton padding-bottom-5" data-searchNo="${recent.recentSearchNo }" onclick="deleteSearchHistory(event)">
							x
						</button>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty recentSearch }">
				<div>
					<p>최근 검색어 없음</p>
				</div>
			</c:if>
		</div>
	</div>
	<style>
		.padding-top-5 {
			padding-top : 5px;
		}
		.padding-bottom-5 {
			padding-bottom: 5px;
		}
		#recentSearchContainer {
			height : 100%;
		}
		#recentSearchContainer > .recentButtonContainer:first-of-type {
		    margin-top: 15px;
		}
		.recentButtonContainer {
			display : flex;
		}
		.recentSearchButton {
			width : 70%;
			text-align : left;
			border : none;
			border-bottom : 1px solid gainsboro;
			background-color : white;
		}
		.searchDeleteButton {
			width : 30%;
			color : red;
			border : none;
			border-bottom : 1px solid gainsboro;
			background-color : white;
		}
	</style>
	<script>
		const deleteSearchHistory = (e) => {
			const recentSearchNo = e.currentTarget.dataset.searchno;
			fetch("${path }/mail/deleterecentsearchhistory.do?no=" + recentSearchNo)
			.then(response => response.text())
			.then(result => {
				if(result > 0) {
					fetch("${path }/mail/refreshsearchmodal.do")
					.then(response => response.text())
					.then(html => {
						document.getElementById("recentSearchContainer").innerHTML = html;
					})
				} else {
					alert("알 수 없는 오류로 삭제하는데 실패했습니다. 잠시뒤에 다시 시도해주세요");
				}
			})
		}	
		
		const searchMailByRecentSearch = (e) => {
			const searchType = e.currentTarget.firstElementChild.innerText;
			const searchValue = e.currentTarget.lastElementChild.innerText;

			console.log("searchType : " + searchType);
			console.log("searchValue : " + searchValue);
			if(searchValue.length > 0) {
				fetch("${path }/mail/searchmail.do", {
					method : "POST",
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
					},
					body : "searchType=" + searchType + "&searchValue=" + searchValue
				})
				.then(response => response.text())
				.then(data => {
					document.getElementById("mailListContainer").innerHTML = data;
				})
			} else {
				alert("입력값이 없습니다.");
			}
		}
	</script>
	<!-- 내 메일함으로 이동하는 모달 -->
	<div class="outer-mymailbox-modal modal">
        <div class="mymailbox-modal" id="mymailbox-modalmain">
        <c:if test="${not empty myMailBoxes }">
        	<c:forEach var="myBox" items="${myMailBoxes }">
        		<div class="mymailbox-container">
                	<button class="mailbox-btn" id="${myBox.myMailBoxNo }" onclick="moveMailToMyMailBox(event)">
                		${myBox.myMailBoxName }
                	</button>
            	</div>
        	</c:forEach>
        </c:if>
            <!-- <div class="userwantaction-container">
                <button class="btn btn-success">내 메일함으로 이동</button>
                <button class="btn btn-danger">취소</button>
            </div> -->
        </div>
    </div>
    
	<!-- <select id="searchSelect">
		<option value="choice">선택</option>
		<option value="mailTitle">[제목]</option>
		<option value="mailContent">[내용]</option>
		<option value="empEmail">[보낸사람]</option>
	</select> -->
	<script>
		
	</script>
	<style>
		.modal {
			position:absolute;
			display:none;
			border-radius : 10px;
			
			/* justify-content:center; */
			/* border:1px solid red; */
			
			left:600PX;
			top:185px;
			
			width:36%;
			height:30%;
			
			background-color:white;
		}
		
		.button {
			width:100%;
			height:100%;
			border-bottom:1px solid gainsboro;
			padding-top:5px;
			padding-bottom:5px;
		}
		
		.button button{
			width:100%;
			height:100%;
			background-color:white;
			border:none;
			text-align:left;
		}
		
		.searchType {
			font-size:15px;
		}
		
		.deleteMyMailBoxButton {
			background-color:white;
			border:none;
			color:red;
			margin-left:35px;
		}
		
		#recentSearchContainer {
			margin-top : 30px;
		}
		
		/* 내 메일함 이동 modal */
		.outer-mymailbox-modal {
            /* border: 1px solid black; */
            border-radius: 10px;
            width: 350px;
            height: 200px;
            overflow: hidden;
            display: hidden;
            position: absolute;
            top:190px;
            left:442px;
            box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.5);
            /* z-index:1000; */
            background-color:none;
        }
        .mymailbox-modal {
            width: 100%;
            height: 100%;
            overflow-y: auto;
            overflow-x: hidden;
        }

        .mymailbox-container {
            background-color:rgba(255, 255, 255, 0.189);
            height:45px;
            font-size:20px;
            border-bottom:1px solid black;
            font-family: "Gothic A1", sans-serif;
        }

        .first-mymailbox-container {
            margin-top: 10px;
        }

        .mailbox-btn {
            width: 100%;
            height: 100%;
            border: none;
            background-color: none;
            text-align: left;
            padding-left:20px;
        }

        .userwantaction-container {
            margin-top: 10px;
            display: flex;
            justify-content: right;
        }
	</style>
	<script>
		const modal = document.querySelector(".modal");
		const modalTest = () => {
			modal.style.display = "grid";
		}
	</script>
	<script src="${path }/resources/assets/static/js/components/dark.js"></script>
	<script
		src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>


	<script src="${path }/resources/assets/compiled/js/app.js"></script>



	<script>
	    document.querySelector('.sidebar-toggle').addEventListener('click', () => {
	        document.querySelector('.email-app-sidebar').classList.toggle('show')
	    })
	    document.querySelector('.sidebar-close-icon').addEventListener('click', () => {
	        document.querySelector('.email-app-sidebar').classList.remove('show')
	    })
	    // .compose-btn 은 openComposeMail() 로 메일작성 폼을 띄운다.
	    // (Mazer 기본 템플릿의 compose-new-mail-sidebar 는 쓰지 않으므로 열지 않는다)
	    document.querySelector('.email-compose-new-close-btn').addEventListener('click', () => {
	        document.querySelector('.compose-new-mail-sidebar').classList.remove('show')
	    })
	    
	    function ajaxPaging(pageNo, url) {
	    	console.log('pageNo : ' + pageNo);
	    	fetch("${path }" + url + "?cPage=" + pageNo + "&numPerpage=5")
	    	.then(response => response.text())
	    	.then(data => {
	    		document.getElementById('mailListContainer').innerHTML = data;
	    	});
	    }
	    
	    const mailSettingView = () => {
	    	closeComposeIfOpen();
	    	fetch("${path }/mail/mailsettingview.do", {
	    		method : "GET"
	    	})
	    	.then(response => response.text())
	    	.then(data => {
	    		document.getElementById("mailListContainer").innerHTML = data;
	    	});
	    }
	    
	    //환경설정 저장. numPerpage 는 필수, 스팸주소는 입력한 것만 보낸다.
	    const applyMailSetting = () => {
	    	const form = document.getElementById("mailSettingForm");
	    	const numPerpage = form.querySelector("select[name='numPerpage']").value;

	    	let body = "numPerpage=" + numPerpage;
	    	form.querySelectorAll("input[name='spamMailAddress']").forEach(input => {
	    		const address = input.value.trim();
	    		if(address.length > 0) body += "&spamMailAddress=" + encodeURIComponent(address);
	    	});

	    	fetch("${path }/mail/applymailsettingajax.do", {
	    		method : "POST",
	    		headers : {
	    			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
	    		},
	    		body : body
	    	})
	    	.then(response => response.text())
	    	.then(result => {
	    		if(result == 0) {
	    			alert("설정 저장에 실패했습니다. 잠시 후 다시 시도해주세요.");
	    			return;
	    		}
	    		alert("설정을 저장했습니다.");
	    		mailSettingView(); //등록한 스팸주소가 아래 목록에 바로 보이도록 다시 그린다.
	    	});
	    }

	    const deleteSpamMailAddress = (spamMailAddress) => {
	    	if(!confirm(spamMailAddress + " 을(를) 스팸목록에서 삭제하시겠습니까?")) return;

	    	fetch("${path }/mail/deletespamdomain.do", {
	    		method : "POST",
	    		headers : {
	    			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
	    		},
	    		body : "domainAddresses=" + encodeURIComponent(spamMailAddress)
	    	})
	    	.then(response => response.text())
	    	.then(data => {
	    		if(data == 0) {
	    			alert("삭제에 실패했습니다.");
	    			return;
	    		}
	    		alert("삭제에 성공했습니다.");
	    		mailSettingView(); //삭제된 주소가 목록에서 바로 빠지도록 다시 그린다.
	    	});
	    }
	    
		//뒤로가기시 반드시 요청보내는 메소드
		window.addEventListener("pageshow", e => {
		  
			//true => bfcache 또는 뒤로가기시 return값은 true
		  if (e.persisted) {
		    window.location.reload();
		  }
		});
	</script>

	<!-- 메일작성 폼용 라이브러리 (summernote 는 jquery 가 먼저 있어야 한다) -->
	<script src="${path }/resources/assets/extensions/jquery/jquery.min.js"></script>
	<script src="${path }/resources/assets/extensions/summernote/summernote-lite.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond/filepond.js"></script>
	<script>
		/* 메일작성 : 별도 페이지로 이동하지 않고 목록 영역(.email-app-list)을
		 * /mail/writemailform.do 응답(writemail_response.jsp)으로 갈아끼운다.
		 * 조각은 innerHTML 로 들어가서 script 가 실행되지 않으므로
		 * 초기화/이벤트 함수는 전부 여기(전역)에 둔다. */
		let composeFilePond = null;

		//mailNo 를 넘기면 임시저장 메일 이어쓰기
		const openComposeMail = (mailNo) => {
			const composeContainer = document.getElementById("mailComposeContainer");

			//이미 작성중이면 내용을 확인하고 새로 연다.
			if(composeContainer.style.display != "none") {
				const editable = composeContainer.querySelector(".note-editable");
				if(editable != null && editable.innerText.trim().length > 0
						&& !confirm("작성중인 내용은 저장되지 않습니다. 새로 작성하시겠습니까?")) return;
				destroyComposeMail();
			}

			let url = "${path }/mail/writemailform.do";
			if(mailNo) url += "?mailNo=" + mailNo;

			fetch(url)
			.then(response => response.text())
			.then(html => {
				document.getElementById("mailComposeContainer").innerHTML = html;
				toggleComposeView(true);
				initComposeMail();
			});
		}

		//true : 작성폼만 보이기, false : 툴바 + 목록만 보이기
		const toggleComposeView = (showCompose) => {
			document.querySelector(".email-action").style.display = showCompose ? "none" : "";
			document.getElementById("mailListContainer").style.display = showCompose ? "none" : "";
			document.getElementById("mailComposeContainer").style.display = showCompose ? "" : "none";
		}

		const initComposeMail = () => {
			$("#composeSummernote").summernote({
				tabsize: 2,
				height: 320,
				minHeight: 240,
				placeholder: "내용을 입력하세요"
			});

			//임시저장 본문(HTML)은 hidden textarea 로 넘어온다.
			const tempContentHolder = document.getElementById("tempMailContent");
			if(tempContentHolder && tempContentHolder.value.trim().length > 0) {
				$("#composeSummernote").summernote("code", tempContentHolder.value);
			}

			//pages/filepond.js 는 페이지 로드시점에 한번만 도는 스크립트라 여기서 직접 만든다.
			composeFilePond = FilePond.create(document.querySelector("#mailComposeContainer .multiple-files-filepond"), {
				credits: null,
				allowImagePreview: false,
				allowMultiple: true,
				allowFileEncode: false,
				required: false,
				storeAsFile: true
			});
		}

		//summernote/filepond 는 innerHTML 을 비우기 전에 정리해줘야 인스턴스가 남지 않는다.
		const destroyComposeMail = () => {
			if(composeFilePond != null) {
				composeFilePond.destroy();
				composeFilePond = null;
			}
			$("#composeSummernote").summernote("destroy");
			document.getElementById("mailComposeContainer").innerHTML = "";
		}

		const closeComposeMail = () => {
			const editable = document.querySelector("#mailComposeContainer .note-editable");
			const written = editable != null && editable.innerText.trim().length > 0;

			if(written && !confirm("작성중인 내용은 저장되지 않습니다. 닫으시겠습니까?")) return;

			destroyComposeMail();
			toggleComposeView(false);
		}

		//사이드바 메뉴를 눌렀을 때처럼 확인 없이 바로 닫아야 하는 경우
		const closeComposeIfOpen = () => {
			if(document.getElementById("mailComposeContainer").style.display == "none") return;

			destroyComposeMail();
			toggleComposeView(false);
		}

		//mailStatus : "전송" 또는 "임시저장"
		const submitComposeMail = (mailStatus) => {
			const form = document.getElementById("composeMailForm");
			const receiverInputs = form.querySelectorAll("input[name='mailReceiverAddress']");
			const receivers = [];

			receiverInputs.forEach(input => {
				if(input.value.trim().length > 0) receivers.push(input.value.trim());
			});

			if(receivers.length === 0) {
				alert("받는사람을 입력해주세요.");
				receiverInputs[0].focus();
				return;
			}

			form.querySelector("input[name='mailContent']").value = $("#composeSummernote").summernote("code");
			form.querySelector("input[name='mailReceiver']").value = receivers[0];

			const formData = new FormData(form);
			//빈 입력칸이 그대로 넘어가지 않도록 받는사람은 다시 채운다.
			formData.delete("mailReceiverAddress");
			receivers.forEach(receiver => formData.append("mailReceiverAddress", receiver));
			formData.append("mailStatus", mailStatus);

			fetch("${path }/mail/sendmailajax.do", {
				method : "POST",
				body : formData
			})
			.then(response => response.text())
			.then(result => {
				if(result != 1) {
					alert("메일 전송에 실패했습니다. 잠시 후 다시 시도해주세요.");
					return;
				}

				destroyComposeMail();
				toggleComposeView(false);
				alert(mailStatus == "임시저장" ? "임시저장했습니다." : "메일을 보냈습니다.");

				//보낸 뒤 보여줄 메일함을 클릭한것과 같게 처리(active 표시 + 목록 갱신)
				const targetMenuId = mailStatus == "임시저장" ? "임시저장함" : "받은메일함";
				selectMenu({ currentTarget : document.getElementById(targetMenuId) });

				if(mailStatus == "임시저장") temporarySaveMailBoxView();
				else receiveMailList();
			});
		}

		/* 아래 두개는 writemail.jsp 에 있던 받는사람 입력칸 로직을 그대로 옮긴 것 */
		const changeInputView = (e) => {
			const receiverInputs = document.querySelectorAll("input[name='mailReceiverAddress']");

			if(e.currentTarget.value.length == 0) return;
			if(e.currentTarget.getAttribute("class") == "finishing-receiver-input") return;

			if(receiverInputs.length != 5) {
				const $button = document.createElement("button");
				$button.setAttribute("type", "button");
				$button.setAttribute("class", "nostyle-btn");
				$button.setAttribute("onclick", "deleteMailReceiver(event)");
				$button.innerText = "x";

				const receiverInput = e.currentTarget;
				const inputDiv = e.currentTarget.parentElement;
				const inputContainer = e.currentTarget.parentElement.parentElement;

				const div = document.createElement("div");
				const $input = document.createElement("input");
				$input.setAttribute("type", "text");
				$input.setAttribute("name", "mailReceiverAddress");
				$input.setAttribute("class", "nonestyle-input");
				$input.setAttribute("placeholder", "받는사람 입력");
				$input.setAttribute("onblur", "changeInputView(event)");

				receiverInput.setAttribute("class", "finishing-receiver-input");
				receiverInput.setAttribute("readOnly", "true");

				inputDiv.appendChild($button);

				div.appendChild($input);
				inputContainer.appendChild(div);
			} else {
				alert("수령인은 최대 5명까지 가능합니다.");
			}
		}

		const deleteMailReceiver = (e) => {
			const receiverInput = document.querySelectorAll("input[name='mailReceiverAddress']");
			e.currentTarget.parentElement.remove();

			if(receiverInput.length == 1) {
				const $input = document.createElement("input");
				$input.setAttribute("type", "text");
				$input.setAttribute("name", "mailReceiverAddress");
				$input.setAttribute("class", "nonestyle-input");
				$input.setAttribute("placeholder", "받는사람 입력");
				$input.setAttribute("onblur", "changeInputView(event)");

				const div = document.createElement("div");
				div.appendChild($input);
				document.getElementById("receiverInputContainer").appendChild(div);
			}
		}
	</script>
</body>
<style>
	.icon-button {
		background: none;
		border: none;
		padding: 0;
		cursor: pointer;
		outline: none;
	}
	#mailListUlTag {
		overflow-y: auto;
		overflow-x: hidden;
	}
	/* Mazer 기본 스타일이 목록 li 마다 fadeIn(아래에서 위로) 애니메이션을 넣어놔서
	   메일함을 바꿀 때마다 리스트가 올라온다. 선택자가 길어서 !important 로 끈다. */
	.users-list-wrapper li {
		-webkit-animation: none !important;
		animation: none !important;
	}
	/* hover 시 translateY(1px) 이 걸리는데, transform 도 스크롤 영역에 포함돼서
	   마지막 항목에 마우스를 올리면 1px 넘쳐 스크롤바가 생긴다. 그림자는 남기고 이동만 뺀다. */
	.users-list-wrapper li.media:hover {
		-webkit-transform: none !important;
		transform: none !important;
	}
	
	#sideBarMenu {
		overflow-y: auto;
		overflow-x: hidden;
	}
	/* 메일작성 폼 영역 : 목록(.email-user-list)과 같은 높이를 쓰되
	   툴바가 감춰지는 만큼 조금 더 길게 잡는다. */
	#mailComposeContainer {
		height: calc(100vh - 9rem);
		overflow-y: auto;
		overflow-x: hidden;
		padding: 1.5rem;
	}
	#mailComposeContainer .card {
		box-shadow: none;
		border: 1px solid #dfe3e7;
	}
	/* 환경설정 화면도 목록 자리에 들어오므로 여백/스크롤을 따로 준다. */
	.mail-setting-wrapper {
		padding: 1.5rem;
		height: 100%;
		overflow-y: auto;
		overflow-x: hidden;
	}
	.mail-setting-wrapper .card {
		box-shadow: none;
		border: 1px solid #dfe3e7;
	}
	.myMailBoxContainer {
		display:grid; /* grid */
	}
	.myMailBoxContainerTopRow {
		display:flex; /* flex */
	}
	.addMyMailBoxButton {
		background:none;
		border:none;
		padding-top:22px;
		padding-left:30px;
	}
	.mailBoxNameInput {
		
	}
</style>
</html>