<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- 내 메일함 목록 조각. mailmain.jsp 의 #myMailBoxListContainer 안에 그대로 들어간다.
     mailmain.jsp 가 처음 그리는 마크업과 반드시 같아야 한다. --%>
<c:choose>
	<c:when test="${not empty mailBoxes }">
		<c:forEach var="myBox" items="${mailBoxes }">
			<div class="mymailbox-item">
				<a href="javascript:myMailBoxView(${myBox.myMailBoxNo })" class="list-group-item mymailbox-list"
					name="menu" id="myMailBox${myBox.myMailBoxNo }" title="${myBox.myMailBoxName }"
					onclick="selectMenu(event)">
					<div class="fonticon-wrap d-inline me-3">
						<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
							<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#envelope" />
						</svg>
					</div>
					<span class="mymailbox-span">${myBox.myMailBoxName }</span>
				</a>
				<button type="button" class="mymailbox-delete-btn" title="메일함 삭제"
					data-boxno="${myBox.myMailBoxNo }" data-boxname="${myBox.myMailBoxName }"
					onclick="deleteMyMailBox(event)">
					<svg class="bi" width="1em" height="1em" fill="currentColor">
						<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#trash" />
					</svg>
				</button>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p class="mymailbox-empty">아직 만든 메일함이 없습니다.</p>
	</c:otherwise>
</c:choose>
