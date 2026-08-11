<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="e" value="${searchEmp }" />
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사원 상세 - waait</title>

    <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
    <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">
    <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/iconly.css">
    <link rel="stylesheet" href="${path }/resources/css/sol/empdetailview.css">
</head>

<body>
    <script src="${path }/resources/assets/static/js/initTheme.js"></script>
    <script>
        var path = "${path }";
    </script>

    <div id="app">
        <div id="sidebar">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header position-relative">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="logo" style="height: 100; ">
                            <a href="${path }/"><img src="/resources/images/logo.png" alt="Logo" srcset="" width="130px" style="height:90px"></a>
                        </div>
                        <div class="theme-toggle d-flex gap-2  align-items-center mt-2">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
                                role="img" class="iconify iconify--system-uicons" width="20" height="20"
                                    preserveAspectRatio="xMidYMid meet" viewBox="0 0 21 21"
                            >
                                <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round"
                                    stroke-linejoin="round">
                                    <path d="M10.5 14.5c2.219 0 4-1.763 4-3.982a4.003 4.003 0 0 0-4-4.018c-2.219 0-4 1.781-4 4c0 2.219 1.781 4 4 4zM4.136 4.136L5.55 5.55m9.9 9.9l1.414 1.414M1.5 10.5h2m14 0h2M4.135 16.863L5.55 15.45m9.899-9.9l1.414-1.415M10.5 19.5v-2m0-14v-2"
                                        opacity=".3">
                                    </path>
                                    <g transform="translate(-210 -1)">
                                        <path d="M220.5 2.5v2m6.5.5l-1.5 1.5"></path>
                                        <circle cx="220.5" cy="11.5" r="4"></circle>
                                        <path d="m214 5l1.5 1.5m5 14v-2m6.5-.5l-1.5-1.5M214 18l1.5-1.5m-4-5h2m14 0h2"></path>
                                    </g>
                                </g>
                            </svg>
                            <div class="form-check form-switch fs-6">
                                <input class="form-check-input  me-0" type="checkbox" id="toggle-dark" style="cursor: pointer">
                                <label class="form-check-label"></label>
                            </div>
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
                                role="img" class="iconify iconify--mdi" width="20" height="20" preserveAspectRatio="xMidYMid meet"
                                viewBox="0 0 24 24"
                            >
                                <path fill="currentColor"
                                    d="m17.75 4.09l-2.53 1.94l.91 3.06l-2.63-1.81l-2.63 1.81l.91-3.06l-2.53-1.94L12.44 4l1.06-3l1.06 3l3.19.09m3.5 6.91l-1.64 1.25l.59 1.98l-1.7-1.17l-1.7 1.17l.59-1.98L15.75 11l2.06-.05L18.5 9l.69 1.95l2.06.05m-2.28 4.95c.83-.08 1.72 1.1 1.19 1.85c-.32.45-.66.87-1.08 1.27C15.17 23 8.84 23 4.94 19.07c-3.91-3.9-3.91-10.24 0-14.14c.4-.4.82-.76 1.27-1.08c.75-.53 1.93.36 1.85 1.19c-.27 2.86.69 5.83 2.89 8.02a9.96 9.96 0 0 0 8.02 2.89m-1.64 2.02a12.08 12.08 0 0 1-7.8-3.47c-2.17-2.19-3.33-5-3.49-7.82c-2.81 3.14-2.7 7.96.31 10.98c3.02 3.01 7.84 3.12 10.98.31Z">
                                </path>
                            </svg>
                        </div>
                        <div class="sidebar-toggler  x">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>
                        <li class="sidebar-item active">
                            <a href="${path }/manage/managemain.do" class="sidebar-link">
                                <i class="bi bi-grid-fill"></i>
                                <span>인사조회</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${path }/manage/enrollemployeeview.do" class="sidebar-link">
                                <i class="bi bi-person-plus-fill"></i>
                                <span>인사등록</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${path }/manage/departmentview.do" class="sidebar-link">
                                <i class="bi bi-diagram-3-fill"></i>
                                <span>부서/팀 관리</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading emp-detail">
                <c:choose>
                <c:when test="${empty e }">
                    <div class="card empty-card">
                        <div class="card-body">
                            <i class="bi bi-person-x"></i>
                            <h4>사원 정보를 찾을 수 없습니다</h4>
                            <p>목록에서 다시 선택해 주세요.</p>
                            <a href="${path }/manage/managemain.do" class="btn btn-primary">인사조회로 이동</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>

                    <%-- 연차 계산 --%>
                    <c:set var="basic" value="${e.basicAnnualLeave }" />
                    <c:set var="remain" value="${e.remainingAnnualLeave }" />
                    <c:set var="used" value="${basic - remain }" />
                    <fmt:formatNumber var="leaveRatio" value="${basic > 0 ? (remain * 100 / basic) : 0 }" maxFractionDigits="0" />

                    <div class="page-title">
                        <div class="crumb">
                            <a href="${path }/manage/managemain.do">인사조회</a>
                            <i class="bi bi-chevron-right"></i>
                            <span>사원 상세</span>
                        </div>
                        <div class="page-actions">
                            <a href="${path }/manage/managemain.do" class="btn btn-light-secondary">목록으로</a>
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-light-danger">삭제</button>
                        </div>
                    </div>

                    <div class="detail-grid">

                        <%-- 신원 카드 --%>
                        <section class="card identity-card">
                            <div class="card-body">
                                <div class="avatar-ring">
                                    <c:choose>
                                        <c:when test="${not empty e.empProfile }">
                                            <img src="${path }/resources/upload/emp/profile/${e.empProfile }" alt="${e.empName } 프로필 사진" class="avatar-img">
                                        </c:when>
                                        <c:when test="${not empty e.empName }">
                                            <span class="avatar-initial">${e.empName.substring(0,1) }</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="avatar-initial"><i class="bi bi-person"></i></span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <h1 class="emp-name">${e.empName }</h1>
                                <p class="emp-role">
                                    <c:if test="${not empty e.jobLevel.levelName }">${e.jobLevel.levelName }</c:if>
                                    <c:if test="${not empty e.deptName }"><span class="dot"></span>${e.deptName }</c:if>
                                    <c:if test="${not empty e.teamName }"> · ${e.teamName }</c:if>
                                </p>

                                <c:choose>
                                    <c:when test="${e.leaveYN eq 'Y' }">
                                        <span class="status-badge is-left">퇴사</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge is-active">재직 중</span>
                                    </c:otherwise>
                                </c:choose>

                                <dl class="id-list">
                                    <dt>사번</dt>
                                    <dd class="tnum">${e.empNo }</dd>
                                    <dt>아이디</dt>
                                    <dd class="tnum">${e.empId }</dd>
                                    <dt>입사일</dt>
                                    <dd class="tnum">
                                        <c:choose>
                                            <c:when test="${not empty e.empStartDate }"><fmt:formatDate value="${e.empStartDate }" pattern="yyyy-MM-dd" /></c:when>
                                            <c:otherwise><span class="is-empty">—</span></c:otherwise>
                                        </c:choose>
                                    </dd>
                                </dl>

                                <div class="contact-actions">
                                    <c:choose>
                                        <c:when test="${not empty e.empEmail }">
                                            <a href="mailto:${e.empEmail }" class="contact-btn"><i class="bi bi-envelope"></i>메일 보내기</a>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="contact-btn is-disabled"><i class="bi bi-envelope"></i>메일 없음</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${not empty e.empPhone }">
                                            <a href="tel:${e.empPhone }" class="contact-btn"><i class="bi bi-telephone"></i>전화 걸기</a>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="contact-btn is-disabled"><i class="bi bi-telephone"></i>번호 없음</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </section>

                        <div class="detail-main">

                            <%-- 연차 현황 --%>
                            <section class="card leave-card">
                                <div class="card-body">
                                    <div class="leave-gauge" style="--ratio:${leaveRatio }" role="img"
                                         aria-label="기본 연차 ${basic }일 중 ${remain }일 남음">
                                        <div class="gauge-center">
                                            <strong class="tnum">${remain }</strong>
                                            <span>일 남음</span>
                                        </div>
                                    </div>
                                    <div class="leave-figures">
                                        <h2 class="section-label">연차 현황</h2>
                                        <div class="figure-row">
                                            <div class="leave-figure">
                                                <span class="figure-label">기본 연차</span>
                                                <strong class="figure-value tnum">${basic }<em>일</em></strong>
                                            </div>
                                            <div class="leave-figure">
                                                <span class="figure-label">사용</span>
                                                <strong class="figure-value tnum">${used }<em>일</em></strong>
                                            </div>
                                            <div class="leave-figure">
                                                <span class="figure-label">잔여</span>
                                                <strong class="figure-value is-accent tnum">${remain }<em>일</em></strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <%-- 인적 사항 --%>
                            <section class="card">
                                <div class="card-body">
                                    <h2 class="section-label">인적 사항</h2>
                                    <dl class="info-list">
                                        <dt>생년월일</dt>
                                        <dd class="tnum">${empty e.empBirth ? '—' : e.empBirth }</dd>

                                        <dt>나이</dt>
                                        <dd>
                                            <c:choose>
                                                <c:when test="${enAge eq '-' or empty enAge }"><span class="is-empty">출생일 정보 없음</span></c:when>
                                                <c:otherwise><span class="tnum">만 ${enAge }세</span> <span class="sub">한국 나이 ${krAge }세</span></c:otherwise>
                                            </c:choose>
                                        </dd>

                                        <dt>성별</dt>
                                        <dd>
                                            <c:choose>
                                                <c:when test="${e.empGender eq 'm' }">남성</c:when>
                                                <c:when test="${e.empGender eq 'f' }">여성</c:when>
                                                <c:when test="${empty e.empGender }"><span class="is-empty">—</span></c:when>
                                                <c:otherwise>${e.empGender }</c:otherwise>
                                            </c:choose>
                                        </dd>

                                        <dt>이메일</dt>
                                        <dd>${empty e.empEmail ? '—' : e.empEmail }</dd>

                                        <dt>연락처</dt>
                                        <dd class="tnum">${empty e.empPhone ? '—' : e.empPhone }</dd>

                                        <dt>주소</dt>
                                        <dd>${empty e.empAddress ? '—' : e.empAddress }</dd>
                                    </dl>
                                </div>
                            </section>

                            <%-- 소속 및 근무 --%>
                            <section class="card">
                                <div class="card-body">
                                    <h2 class="section-label">소속 및 근무</h2>
                                    <dl class="info-list">
                                        <dt>부서</dt>
                                        <dd>${empty e.deptName ? '—' : e.deptName }</dd>

                                        <dt>팀</dt>
                                        <dd>${empty e.teamName ? '—' : e.teamName }</dd>

                                        <dt>직급</dt>
                                        <dd>${empty e.jobLevel.levelName ? '—' : e.jobLevel.levelName }</dd>

                                        <dt>입사일</dt>
                                        <dd class="tnum">
                                            <c:choose>
                                                <c:when test="${not empty e.empStartDate }"><fmt:formatDate value="${e.empStartDate }" pattern="yyyy년 M월 d일" /></c:when>
                                                <c:otherwise><span class="is-empty">—</span></c:otherwise>
                                            </c:choose>
                                        </dd>

                                        <dt>퇴사일</dt>
                                        <dd class="tnum">
                                            <c:choose>
                                                <c:when test="${not empty e.empEndDate }"><fmt:formatDate value="${e.empEndDate }" pattern="yyyy년 M월 d일" /></c:when>
                                                <c:otherwise><span class="is-empty">—</span></c:otherwise>
                                            </c:choose>
                                        </dd>

                                        <dt>재직 여부</dt>
                                        <dd>${e.leaveYN eq 'Y' ? '퇴사' : '재직 중' }</dd>
                                    </dl>
                                </div>
                            </section>
                        </div>
                    </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="${path }/resources/assets/static/js/components/dark.js"></script>
    <script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${path }/resources/assets/compiled/js/app.js"></script>
</body>
</html>
