<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var ="loginEmp" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메일 상세 - waaIT</title>
<link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">

<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/application-email.css">
<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="${path }/resources/css/common/layout.css">
<style>
	.mail-detail-title {
		font-size: 1.5rem;
		font-weight: 700;
		word-break: break-all;
		margin: 0;
	}
	.mail-meta-label {
		flex: 0 0 72px;
		color: #6c757d;
		font-size: .875rem;
	}
	.mail-meta-value {
		word-break: break-all;
		font-size: .9rem;
	}
	.mail-content-body {
		min-height: 320px;
		line-height: 1.8;
		word-break: break-word;
	}
	.mail-content-body img {
		max-width: 100%;
		height: auto;
	}
	.icon-button {
		background: none;
		border: none;
		padding: 0;
		cursor: pointer;
		outline: none;
		line-height: 1;
	}
	.non-style-button {
		background: none;
		border: none;
		padding: 0;
		line-height: 1;
	}
	.movemail-img {
		width: 24px;
		height: 30px;
		border-radius: 6px;
	}
	.mail-file-item {
		display: flex;
		align-items: center;
		gap: .5rem;
	}

	/* 내 메일함 이동 모달 */
	.movemail-modal {
		display: none;
		position: fixed;
		top: 90px;
		right: 3rem;
		z-index: 1050;
		width: 280px;
		max-height: 380px;
		overflow-y: auto;
		background-color: #fff;
		border: 1px solid #e9ecef;
		border-radius: 10px;
		box-shadow: 0 8px 24px rgba(0, 0, 0, .12);
	}
	.mailbox-list {
		list-style-type: none;
		padding: 0;
		margin: 0;
	}
	.mailbox-list > li + li {
		border-top: 1px solid #f1f3f5;
	}
	.nostyle-button {
		width: 100%;
		padding: .75rem 1rem;
		background-color: transparent;
		border: none;
		text-align: left;
		font-size: .95rem;
	}
	.nostyle-button:hover {
		background-color: #f8f9fa;
	}
</style>
</head>
<body>
<script src="${path }/resources/assets/static/js/initTheme.js"></script>

<div id="app">
	<div id="main" style="margin-left: 0px;">
		<header class="mb-3">
			<div class="d-flex justify-content-between align-items-center">
				<div class="logo">
					<a href="${path }/"><img src="${path }/resources/images/logo.png" alt="Logo" width="150px" style="height:90px"></a>
				</div>
				<button type="button" class="btn btn-outline-secondary" onclick="location.assign('${path }/mail/mailmain.do')">
					<i class="bi bi-arrow-left"></i> 메일함으로
				</button>
			</div>
		</header>

		<div class="page-heading">
			<section class="section">
				<div class="card">
					<div class="card-header d-flex justify-content-between align-items-start flex-wrap gap-3">
						<h4 class="mail-detail-title">
							<c:choose>
								<c:when test="${not empty mail.mailTitle }">${mail.mailTitle }</c:when>
								<c:otherwise>(제목 없음)</c:otherwise>
							</c:choose>
						</h4>
						<div class="d-flex align-items-center gap-3">
							<button class="icon-button" onclick="addFavorite()" title="즐겨찾기">
								<c:forEach var="receiver" items="${mail.receivers}">
									<c:if test="${receiver.mailReceiverAddress eq loginEmp.empEmail}">
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
									</c:if>
								</c:forEach>
								<c:if test="${mail.senderMailAddress eq loginEmp.empEmail}">
									<span id="colorDecisionSpan" class=
										<c:if test="${mail.senderStatus eq '즐겨찾기' }" >
											"favorite text-warning"
										</c:if>
										<c:if test="${mail.senderStatus != '즐겨찾기' }" >
											"favorite"
										</c:if>
									>
										<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
											<use xlink:href=<c:if test="${mail.senderStatus eq '즐겨찾기' }" >
																"${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill"
															</c:if>
															<c:if test="${mail.senderStatus != '즐겨찾기' }" >
																"${path }/resources/assets/static/images/bootstrap-icons.svg#star"
															</c:if> id="iconPath"
											/>
										</svg>
									</span>
								</c:if>
							</button>
							<button onclick="myMailBoxModal()" class="non-style-button" title="내 메일함으로 이동">
								<img src="${path }/resources/waait/mail/img/movementmailbox.png" class="movemail-img" alt="메일함 이동">
							</button>
							<button class="non-style-button" onclick="deleteMail()" title="삭제">
								<img src="${path }/resources/waait/mail/img/trashcan.png" style="width: 20px; height: 20px" alt="삭제">
							</button>
						</div>
					</div>

					<div class="card-body">
						<div class="d-flex align-items-center flex-wrap gap-3 pb-3">
							<div class="avatar avatar-md">
								<img src="${path }/resources/assets/compiled/jpg/8.jpg" alt="avatar">
							</div>
							<div class="flex-grow-1">
								<div class="d-flex mb-1">
									<span class="mail-meta-label">보낸사람</span>
									<span class="mail-meta-value">
										<span class="text-primary">${mail.senderName }</span>
										<span class="text-muted">&lt;${mail.senderMailAddress }&gt;</span>
									</span>
								</div>
								<div class="d-flex">
									<span class="mail-meta-label">받는사람</span>
									<span class="mail-meta-value text-muted">
										<c:choose>
											<c:when test="${not empty mail.receivers }">
												<c:forEach var="receiver" items="${mail.receivers }" varStatus="status">
													${receiver.mailReceiverAddress }<c:if test="${!status.last }">, </c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose>
									</span>
								</div>
							</div>
							<small class="text-muted">${mail.mailWriteDate }</small>
						</div>

						<hr class="mt-0 mb-4">

						<div class="mail-content-body">${mail.mailContent }</div>
					</div>

					<div class="card-footer border-top">
						<label class="sidebar-label d-block mb-2">Attached Files</label>
						<c:choose>
							<c:when test="${not empty mail.files }">
								<ul class="list-unstyled mb-0">
									<c:forEach var="mailFile" items="${mail.files }">
										<li class="cursor-pointer mail-file-item pb-1">
											<i class="bi bi-paperclip text-muted"></i>
											<a href="javascript:mailFileDownload('${mailFile.mailOriginalFileName }','${mailFile.mailRenamedFileName }')">${mailFile.mailOriginalFileName }</a>
										</li>
									</c:forEach>
								</ul>
							</c:when>
							<c:otherwise>
								<p class="text-muted mb-0" style="font-size: .875rem;">첨부된 파일이 없습니다.</p>
							</c:otherwise>
						</c:choose>
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

<div class="movemail-modal">
	<c:if test="${not empty myMailBoxes }">
		<ul class="mailbox-list">
			<c:forEach var="myMailBox" items="${myMailBoxes }">
				<li>
					<button class="nostyle-button" onclick="moveMyMailBox(event);">${myMailBox.myMailBoxName }</button>
					<input id="myMailBoxNo" value="${myMailBox.myMailBoxNo }" hidden="true" disabled>
				</li>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${empty myMailBoxes }">
		<p class="text-muted text-center my-4 mb-0">내 메일함 없음</p>
	</c:if>
</div>

<script src="${path }/resources/assets/static/js/components/dark.js"></script>
<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${path }/resources/assets/compiled/js/app.js"></script>
<script>
	const mailFileDownload = (oriName, renamed) => {
		location.assign("${path }/mail/improvedfiledownload.do?mailOriginalFileName=" + oriName + "&mailRenamedFileName=" + renamed);
	}

	const addFavorite = (function() {
		const senderBoolean = ${mail.senderMailAddress eq loginEmp.empEmail ? true : false};
		let applicationBoolean;

		if(senderBoolean) {
			applicationBoolean = ${mail.senderStatus eq '즐겨찾기' ? true : false};
		} else {
			applicationBoolean = ${mail.mailStatus eq '즐겨찾기' ? true : false};
		}

		const addFavorite = () => {
			const mailNo = ${mail.mailNo};
			if(applicationBoolean == false) {
				fetch("${path}/mail/addfavorite.do?mailNo=" + mailNo)
				.then(response => response.text())
				.then(data => {
					if(data == 1) {
						alert("즐겨찾기에 추가되었습니다");
						applicationBoolean = true;
						document.getElementById("iconPath").setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill");
						document.getElementById("colorDecisionSpan").className = "favorite text-warning";
					} else {
						alert("알수없는 오류로 즐겨찾기 등록에 실패했습니다.");
					}
				});
			} else {
				fetch("${path}/mail/canceladdfavorite.do?mailNo=" + mailNo)
				.then(response => response.text())
				.then(data => {
					if(data == 1) {
						alert("즐겨찾기가 해제되었습니다.");
						applicationBoolean = false;
						document.getElementById("iconPath").setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star");
						document.getElementById("colorDecisionSpan").className = "favorite";
					} else {
						alert("알수없는 오류로 즐겨찾기 등록에 실패했습니다.");
					}
				});
			}
		}
		return addFavorite;
	})();

	const deleteMail = () => {
		const mailNo = ${mail.mailNo };
		fetch('${path }/mail/deletemail.do', {
			method : "POST",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
			},
			body : "mailNoStr=" + mailNo
		})
		.then(response => response.text())
		.then(data => {
			location.assign('${path }/mail/mailmain.do');
		})
	}

	const moveMyMailBox = (e) => {
		const mailNo = ${mail.mailNo };
		const mailBoxNo = e.target.nextElementSibling.value;

		fetch('${path }/mail/addmailmymailbox.do', {
			method : "POST",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
			},
			body : "mailNoStr=" + mailNo + "&myMailBoxNo=" + mailBoxNo
		})
		.then(response => response.text())
		.then(data => {
			location.assign("${path }/mail/mailmain.do");
		});
	}

	//내 메일함으로 이동 모달창 띄우기
	const myMailBoxModal = (function() {
		let modalNum = 0; //모달창 0이면 닫혀있음 1이면 열려있음
		const myMailBoxModal = () => {
			const myMailBoxModal = document.querySelector(".movemail-modal");
			const moveMailImg = document.querySelector(".movemail-img");

			if(modalNum == 0) {
				myMailBoxModal.style.display = "block";
				moveMailImg.style.border = "1px solid #adb5bd";
				modalNum = 1;
			} else {
				myMailBoxModal.style.display = "none";
				moveMailImg.style.border = "none";
				modalNum = 0;
			}
		}

		return myMailBoxModal;
	})();
</script>
</body>
</html>
