<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="emp" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<%-- /mail/writemailform.do 응답. mailmain.jsp 의 메일목록 자리에 그대로 끼워넣는 조각.
     innerHTML 으로 주입되기 때문에 여기에 <script> 를 써도 실행되지 않는다.
     summernote/filepond 초기화와 이벤트 처리는 mailmain.jsp 의 전역 함수가 담당한다.
     (openComposeMail / submitComposeMail / closeComposeMail / changeInputView) --%>
<form id="composeMailForm" enctype="multipart/form-data">
	<input type="hidden" name="mailContent">
	<input type="hidden" name="mailReceiver">

	<div class="card mb-0">
		<div class="card-header d-flex justify-content-between align-items-center">
			<h4 class="card-title mb-0">
				메일 쓰기
				<c:if test="${not empty mail }">
					<span class="badge bg-light-secondary ms-2">임시저장 이어쓰기</span>
				</c:if>
			</h4>
			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="closeComposeMail()">
				<i class="bi bi-x"></i> 닫기
			</button>
		</div>

		<div class="card-body">
			<div class="senderContainer flex-divcontainer">
				<div class="padding-top3 width-7">
					<span class="boldtext">보내는 사람</span>
				</div>
				<div class="senderInputContainer">
					<input type="text" class="nonestyle-input" name="senderMailAddress" value="${emp.empEmail }" readonly>
				</div>
			</div>

			<div class="receiverContainer flex-divcontainer">
				<div class="padding-top3 width-7">
					<span class="boldtext">받는사람</span>
				</div>
				<div class="myborder-bottom width90" style="display : flex;" id="receiverInputContainer">
					<c:choose>
						<c:when test="${not empty mail.receivers }">
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
				<div class="padding-top3 width-7">
					<span class="boldtext">제목</span>
				</div>
				<div class="myborder-bottom width90">
					<input type="text" name="mailTitle" class="nonestyle-input" placeholder="제목입력" value="${mail.mailTitle }">
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
				<div id="composeSummernote"></div>
				<%-- 임시저장 본문은 HTML 이라 JS 문자열로 바로 넘기면 따옴표에서 깨진다. --%>
				<textarea id="tempMailContent" hidden="true">${mail.mailContent }</textarea>
			</div>
		</div>

		<div class="card-footer">
			<div id="actionContainer">
				<button type="button" class="btn btn-primary" onclick="submitComposeMail('전송')">전송</button>
				<button type="button" class="btn btn-secondary" onclick="submitComposeMail('임시저장')">임시저장</button>
				<button type="button" class="btn btn-light-secondary" onclick="closeComposeMail()">취소</button>
			</div>
		</div>
	</div>
</form>
