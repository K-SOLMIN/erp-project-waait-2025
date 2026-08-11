<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<title>메인화면(마이페이지 인덱스)</title>
<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="${path}/resources/css/ju/headerju.css">

<!-- 조직도 -->
<script src="https://balkan.app/js/orgchart.js"></script>
<style>
	#chart-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .orgchart {
        background: #fff;
    }
</style>

<div class="page-heading">
    <h3>Profile Statistics</h3>
    <%-- <c:forEach var="m" items="${total }"> --%>
</div> 
<div class="page-content"> 
    <section class="row">
        <div class="col-12 col-lg-9">
            <div class="row">
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon purple mb-2">
                                        <i class="iconly-boldShow"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">근무시간</h6>
                                    <c:if test="${not empty workTotal }">
	                                    <h6 class="font-extrabold mb-0">
	                                    	<fmt:formatDate value="${workTotal.get(0).workStart}" pattern="HH:mm" />
	                                    	<c:if test="${not empty workTotal.get(0).workEnd}">
	                                    		 ~ <fmt:formatDate value="${workTotal.get(0).workEnd}" pattern="HH:mm" />
	                                    	</c:if>
	                                    </h6>
                                    </c:if>
                                    <c:if test="${empty workTotal }">
                                    	<h6 class="font-extrabold mb-0">근무 기록 없음</h6>
                                    </c:if>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card"> 
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon blue mb-2">
                                        <i class="iconly-boldProfile"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                	<a href="${path}/mail/mailmain.do">
	                                    <h6 class="text-muted font-semibold">안읽은 메일</h6>
	                                    <h6 class="font-extrabold mb-0">${notReadReceiveMailCount }</h6>
	                                </a>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon green mb-2">
                                        <i class="iconly-boldAdd-User"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7" onclick="chattingOpen();" style="cursor: pointer;">
                                    <h6 class="text-muted font-semibold">안읽은 채팅</h6>
                                    <h6 class="font-extrabold mb-0">${chatCount}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon red mb-2">
                                        <i class="iconly-boldBookmark"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">남은 연차</h6>
                                    <%-- <h6 class="font-extrabold mb-0">${total.get(0).vacaLeft }일 / ${total.get(0).basicAnnualLeave }일</h6> --%>
                                    <h6 class="font-extrabold mb-0">${employee.remainingAnnualLeave }일 / ${employee.basicAnnualLeave }일</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- </c:forEach> --%>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>조직도</h4>                            
                        </div>
                        <div class="card-body">
                            <div style="width: 100%; height: 600px; overflow-x: auto;">
                            	<div id="tree" style="height: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-xl-4">
                    <div class="card">
                        <div class="card-header">
                            <h4>공지사항</h4>
                        </div>
                        <div class="card-body">
                            <!-- 공지사항 더미 시작 -->
                            <div class="table-responsive">
                                <table class="table table-hover" id="table1">
                                    <thead>
                                        <tr>
                                            <th>작성 부서</th>
                                            <th>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>인사팀</td>
                                            <td>연말 정산 서류 제출 안내</td>
                                        </tr>
                                        <tr>
                                            <td>영업팀</td>
                                            <td>3분기 목표 달성 전략 발표</td>
                                        </tr>
                                        <tr>
                                            <td>개발2팀</td>
                                            <td>시스템 업그레이드 일정 공지</td>
                                        </tr>
                                        <tr>
                                            <td>재정팀</td>
                                            <td>2분기 재무 보고서 제출 요청</td>
                                        </tr>
                                        <tr>
                                            <td>경영관리부</td>
                                            <td>사내 규정 변경 사항 안내</td>
                                        </tr>
                                        <tr>
                                            <td>개발1팀</td>
                                            <td>신규 프로젝트 계획 회의 안내</td>
                                        </tr>
                                        <tr>
                                            <td>인사팀</td>
                                            <td>복리후생 제도 변경 안내</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- 공지사항 더미 여기까지 -->
                        </div>
                    </div>
                </div>
                
                
                <div class="col-12 col-xl-8">
                    <div class="card">
                        <div class="card-header">
                            <h4>휴가 신청 관련</h4>
                        </div> 
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Comment</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/5.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Cantik</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">Congratulations on your graduation!</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/2.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">Wow amazing design! Can you make another tutorial for
                                                    this design?</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/8.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Singh Eknoor</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">What a stunning design! You are so talented and creative!</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/3.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Rani Jhadav</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">I love your design! It’s so beautiful and unique! How did you learn to do this?</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-3">
            <div class="card">
                <div class="card-body py-4 px-4">
                    <div class="d-flex align-items-center">
                        <div class="avatar avatar-xl">
                            <img src="${path}/resources/assets/compiled/jpg/1.jpg" alt="Face 1">
                        </div>
                        <div class="ms-3 name">
                            <h5 class="font-bold">${employee.empName }</h5>
                            <h6 class="text-muted mb-0">${employee.empEmail}</h6>
                            <div class="mt-2">
								<c:if test="${work!=null}">
								<button class="btn btn-primary" disabled>${work.workStart.getHours()}:${work.workStart.getMinutes()}</button>
								<c:if test="${work.workEnd == null }">
								<button class="btn btn-primary" onclick="leaveWork()">퇴근</button>
								</c:if>
								<c:if test="${work.workEnd != null }">
								<button class="btn btn-primary" disabled>${work.workEnd.getHours()}:${work.workEnd.getMinutes()}</button>
								</c:if>
								</c:if>
								<c:if test="${work==null}">
								<button onclick="work()" class="btn btn-primary">출근</button>
								<button onclick="noWork()" class="btn btn-primary">퇴근</button>
								</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>MY WORK LIST</h4>
                </div>
                <div class="card-content pb-4">
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="${path}/resources/assets/compiled/jpg/4.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">팀회의록 업데이트</h5>
                            <h6 class="text-muted mb-0">프로젝트</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="${path}/resources/assets/compiled/jpg/5.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">08/27 판교 출장</h5>
                            <h6 class="text-muted mb-0">일정</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="${path}/resources/assets/compiled/jpg/1.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">연말 정산 서류 제출</h5>
                            <h6 class="text-muted mb-0">행정</h6>
                        </div>
                    </div>
                    <div class="px-4">
                        <button class='btn btn-block btn-xl btn-outline-primary font-bold mt-3'>TO DO LIST</button>
                    </div>
                </div>
            </div> 
            <div class="card">
                <div class="card-header">
                    <h4>승인 대기중 문서</h4>
                </div>
                <div class="card-body">
                    <p class="text-muted mb-0">대기중인 문서가 없습니다.</p>
                </div>
            </div>
        </div>
    </section>
</div>


        </div>
    </div>
    <script src="${path }/resources/assets/static/js/components/dark.js"></script>
    <script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
    
    <script src="${path }/resources/assets/compiled/js/app.js"></script>
    <!-- 출퇴근 관련 onclick이벤트 -->
    <script src="${path }/resources/waait/index.js"></script>

 <!-- 전자결재관련 차트 -->
<%-- <script src="${path }/resources/assets/extensions/apexcharts/apexcharts.min.js"></script> --%>
<%-- <script src="${path }/resources/assets/static/js/pages/dashboard.js"></script> --%>
	
	<!-- script문 JU -->
    <script>const path = "${path}";</script>
    <script type="text/javascript" src="${path}/resources/js/headerju.js"></script>
</body>

</html>