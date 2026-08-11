<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- /mail/mailsettingview.do 응답. mailmain.jsp 의 메일목록 자리에 끼워넣는 조각.
     innerHTML 으로 들어가서 script 가 실행되지 않으므로
     이벤트는 mailmain.jsp 의 전역 함수(applyMailSetting / deleteSpamMailAddress)가 담당한다. --%>
<div class="mail-setting-wrapper">

	<div class="card mb-3">
		<div class="card-header">
			<h4 class="card-title mb-0">환경설정</h4>
		</div>
		<div class="card-body">
			<form id="mailSettingForm" onsubmit="return false;">
				<div class="mb-4">
					<label class="form-label fw-bold" for="numPerpageSelect">페이지당 보여줄 메일 수</label>
					<select class="form-select" id="numPerpageSelect" name="numPerpage" style="max-width: 180px;">
						<option value="5" ${numPerpage eq 5 ? 'selected' : '' }>5개</option>
						<option value="7" ${numPerpage eq 7 ? 'selected' : '' }>7개</option>
						<option value="10" ${numPerpage eq 10 ? 'selected' : '' }>10개</option>
						<option value="20" ${numPerpage eq 20 ? 'selected' : '' }>20개</option>
					</select>
					<small class="text-muted d-block mt-2">메일함 목록 한 페이지에 표시할 메일 개수입니다.</small>
				</div>

				<hr class="my-4">

				<div>
					<label class="form-label fw-bold">스팸 메일주소 등록</label>
					<div class="row g-2">
						<div class="col-md-4">
							<input type="text" class="form-control" name="spamMailAddress" placeholder="spam@waait.com">
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" name="spamMailAddress" placeholder="spam@waait.com">
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" name="spamMailAddress" placeholder="spam@waait.com">
						</div>
					</div>
					<small class="text-muted d-block mt-2">
						등록한 주소에서 온 메일은 받은메일함에서 빠지고 스팸메일함으로 분류됩니다. 비워두면 등록하지 않습니다.
					</small>
				</div>
			</form>
		</div>
		<div class="card-footer d-flex justify-content-end">
			<button type="button" class="btn btn-primary" onclick="applyMailSetting()">설정완료</button>
		</div>
	</div>

	<div class="card mb-0">
		<div class="card-header">
			<h4 class="card-title mb-0">
				등록된 스팸 메일주소
				<span class="badge bg-light-secondary ms-2">${empty spamDomains ? 0 : spamDomains.size() }</span>
			</h4>
		</div>
		<div class="card-body">
			<c:choose>
				<c:when test="${not empty spamDomains }">
					<ul class="list-group">
						<c:forEach var="address" items="${spamDomains }">
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>
									<svg class="bi me-2" width="1.1em" height="1.1em" fill="currentColor">
										<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#info-circle" />
									</svg>
									${address.spamDomainAddress }
								</span>
								<button type="button" class="btn btn-sm btn-outline-danger"
										data-address="${address.spamDomainAddress }"
										onclick="deleteSpamMailAddress(this.dataset.address)">삭제</button>
							</li>
						</c:forEach>
					</ul>
				</c:when>
				<c:otherwise>
					<p class="text-muted mb-0">등록된 스팸 메일주소가 없습니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</div>
