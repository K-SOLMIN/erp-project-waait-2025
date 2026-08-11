<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var ="emp" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메일 쓰기 - waaIT</title>
<link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">

<link rel="stylesheet" href="${path }/resources/assets/extensions/summernote/summernote-lite.css">
<link rel="stylesheet" href="${path }/resources/assets/compiled/css/form-editor-summernote.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/toastify-js/src/toastify.css">
<link rel="stylesheet" href="${path }/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="${path }/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="${path }/resources/css/common/layout.css">
<link rel="stylesheet" href="${path }/resources/waait/mail/writemail_css.css">
</head>
<body>
<script src="${path }/resources/assets/static/js/initTheme.js"></script>

<div id="app">
	<div id="main" style="margin-left: 0px;">
		<header class="mb-3">
			<div class="d-flex justify-content-between align-items-center">
				<div class="logo">
					<a href="javascript:goMailMain()"><img src="${path }/resources/images/logo.png" alt="Logo" width="130px" style="height:90px"></a>
				</div>
				<button type="button" class="btn btn-outline-secondary" onclick="goMailMain()">
					<i class="bi bi-arrow-left"></i> 메일함으로
				</button>
			</div>
		</header>

		<div class="page-heading">
			<section class="section">

				<%-- 임시저장 메일 이어쓰기 (continuewritemail.do 에서 model 에 mail 을 담아준다) --%>
				<c:if test="${not empty mail }">
					<form action="${path }/mail/sendmail.do" method="post" enctype="multipart/form-data" onsubmit="return mailContentInputHidden()">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title mb-0">메일 쓰기 <span class="badge bg-light-secondary ms-2">임시저장 이어쓰기</span></h4>
							</div>
							<div class="card-body">
								<div class="senderContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">보내는 사람</span>
									</div>
									<div class="senderInputContainer">
										<input type="text" class="nonestyle-input" name="senderMailAddress" value="${emp.empEmail }" readonly>
									</div>
								</div>
								<div class="receiverContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">받는사람</span>
									</div>
									<div class="myborder-bottom width90" style="display : flex;" id="receiverInputContainer">
										<c:choose>
											<c:when test="${mail.receivers.size() > 0 }">
												<c:forEach var="receiver" items="${mail.receivers }">
													<div>
														<input type="text" name="mailReceiverAddress" class="nonestyle-input" placeholder="받는사람 입력"
															value="${receiver.mailReceiverAddress }" onblur="changeInputView(event)">
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div>
													<input type="text" name="mailReceiverAddress" class="nonestyle-input" placeholder="받는사람 입력" onblur="changeInputView(event)">
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="mailTitleContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">제목</span>
									</div>
									<div class="myborder-bottom width90">
										<input type="text" name="mailTitle" class="nonestyle-input" placeholder="제목입력" value="${mail.mailTitle }">
									</div>
								</div>
								<div class="fileContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">파일 첨부</span>
									</div>
									<div class="width90 fileinput-container">
										<input type="file" class="multiple-files-filepond" name="upFile" multiple>
									</div>
								</div>

								<div class="mail-editor-wrapper">
									<div id="summernote"></div>
									<textarea id="tempMailContent" hidden="true">${mail.mailContent }</textarea>
								</div>
							</div>
							<div class="card-footer">
								<div id="actionContainer">
									<input type="text" name="mailContent" hidden="true">
									<input type="text" name="mailReceiver" hidden="true">
									<input type="submit" class="btn btn-primary" name="mailStatus" value="전송">
									<input type="submit" class="btn btn-secondary" name="mailStatus" value="임시저장">
								</div>
							</div>
						</div>
					</form>
				</c:if>

				<%-- 새 메일 쓰기 --%>
				<c:if test="${empty mail }">
					<form action="${path }/mail/sendmail.do" method="post" enctype="multipart/form-data" onsubmit="return mailContentInputHidden()">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title mb-0">메일 쓰기</h4>
							</div>
							<div class="card-body">
								<div class="senderContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">보내는 사람</span>
									</div>
									<div class="senderInputContainer">
										<input type="text" class="nonestyle-input" name="senderMailAddress" value="${emp.empEmail }" readonly>
									</div>
								</div>
								<div class="receiverContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">받는사람</span>
									</div>
									<div class="myborder-bottom width90" style="display : flex;" id="receiverInputContainer">
										<div>
											<input type="text" name="mailReceiverAddress" class="nonestyle-input" placeholder="받는사람 입력" onblur="changeInputView(event)">
										</div>
									</div>
								</div>
								<div class="mailTitleContainer flex-divcontainer">
									<div class="padding-top3">
										<span class="boldtext">제목</span>
									</div>
									<div class="myborder-bottom width90">
										<input type="text" name="mailTitle" class="nonestyle-input" placeholder="제목입력">
									</div>
								</div>
								<div class="fileContainer flex-divcontainer">
									<div class="padding-top3 width-7">
										<span class="boldtext">파일 첨부</span>
									</div>
									<div class="width90 fileinput-container">
										<input type="file" class="multiple-files-filepond" name="upFile" multiple>
									</div>
								</div>

								<div class="mail-editor-wrapper">
									<div id="summernote"></div>
								</div>
							</div>
							<div class="card-footer">
								<div id="actionContainer">
									<input type="text" name="mailContent" hidden="true">
									<input type="text" name="mailReceiver" hidden="true">
									<input type="submit" class="btn btn-primary" name="mailStatus" value="전송">
									<input type="submit" class="btn btn-secondary" name="mailStatus" value="임시저장">
								</div>
							</div>
						</div>
					</form>
				</c:if>

			</section>
		</div>

		<footer class="mt-4">
			<div class="footer text-muted">
				<p>2023 &copy; waaIT</p>
			</div>
		</footer>
	</div>
</div>

<script src="${path }/resources/assets/extensions/jquery/jquery.min.js"></script>
<script src="${path }/resources/assets/extensions/summernote/summernote-lite.min.js"></script>
<script>
	// Mazer 공용 pages/summernote.js 는 height 가 120 으로 고정이라 쓰지 않고
	// 이 화면에서 직접 초기화한다.
	$(function() {
		$("#summernote").summernote({
			tabsize: 2,
			height: 420,
			minHeight: 320,
			placeholder: "내용을 입력하세요"
		});

		// 임시저장 본문은 HTML 이라 JS 문자열로 바로 박으면 따옴표에서 깨진다.
		// hidden textarea 에 담아두고 읽어온다.
		const tempContentHolder = document.getElementById("tempMailContent");
		if(tempContentHolder && tempContentHolder.value.trim().length > 0) {
			$("#summernote").summernote("code", tempContentHolder.value);
		}
	});
</script>
<script>
	const mailContentInputHidden = () => {
		const receiverInputs = document.querySelectorAll("input[name='mailReceiverAddress']");
		let filledCount = 0;

		receiverInputs.forEach(input => {
			if(input.value.trim().length > 0) filledCount++;
		});

		if(filledCount === 0) {
			alert("받는사람을 입력해주세요.");
			receiverInputs[0].focus();
			return false;
		}

		const mailContent = document.querySelector("div[class='note-editable']").innerHTML;
		document.querySelector("input[name='mailContent']").value = mailContent;
		document.querySelector("input[name='mailReceiver']").value = receiverInputs[0].value;

		return true;
	}

	const changeInputView = (e) => {
		const receiverInputs = document.querySelectorAll("input[name='mailReceiverAddress']");

		if(e.currentTarget.value.length == 0) {
			return;
		}

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

	const goMailMain = () => {
		const editable = document.querySelector("div[class='note-editable']");
		const mailContent = editable ? editable.innerText.trim() : "";

		if(mailContent.length > 0) {
			if(confirm("지금까지 작성한것들은 저장되지 않습니다. 정말 나가시겠습니까?")) {
				location.assign("${path }/mail/mailmain.do");
			}
			return;
		}

		location.assign("${path }/mail/mailmain.do");
	}
</script>

<script src="${path }/resources/assets/static/js/components/dark.js"></script>
<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${path }/resources/assets/compiled/js/app.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond/filepond.js"></script>
<script src="${path }/resources/assets/extensions/toastify-js/src/toastify.js"></script>
<script src="${path }/resources/assets/static/js/pages/filepond.js"></script>
</body>
</html>
