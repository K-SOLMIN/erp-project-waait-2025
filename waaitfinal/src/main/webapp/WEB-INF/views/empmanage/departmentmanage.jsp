<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mazer Admin Dashboard</title>
    
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
    

  <link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app.css">
  <link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app-dark.css">
  <link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/iconly.css">
  <link rel="stylesheet" href="${path }/resources/css/sol/departmentmanage.css">
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
  
</head>

<body>
    <script src="${path }/resources/assets/static/js/initTheme.js"></script>
    
    <!-- script문 JU -->
    <script type="text/javascript" src="${path}/resources/js/headerju.js"></script>
    
    
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
			    <jsp:include page="/WEB-INF/views/common/managesidebar.jsp" />
			</div>
        </div>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            <div id="mainView" class="page-heading dept-manage">
                <div class="page-title">
                    <div>
                        <h1>부서 관리</h1>
                        <p>부서를 선택하면 소속된 팀이 함께 표시됩니다.</p>
                    </div>
                    <button type="button" class="btn btn-primary" id="openCreateBtn">
                        <i class="bi bi-plus-lg"></i> 새 부서
                    </button>
                </div>

                <%-- 새 부서 등록 — 기본은 접혀 있고 '새 부서'로 펼친다 --%>
                <div class="panel" id="createPanel" hidden>
                    <div class="panel-head">
                        <h2>새 부서 등록</h2>
                        <p>부서와 함께 만들 팀이 있으면 아래에서 같이 추가하세요.</p>
                    </div>
                    <div class="panel-body">
                        <label class="field-label" for="deptNameInput">부서명</label>
                        <div class="affix-field">
                            <input type="text" class="form-control" id="deptNameInput" placeholder="개발" autocomplete="off">
                            <span class="affix">부</span>
                        </div>
                        <p class="form-note">이름 뒤의 <strong>부</strong>는 자동으로 붙습니다.</p>

                        <div class="split"></div>

                        <label class="field-label">소속 팀 <span class="text-muted fw-normal">(선택 · 최대 5개)</span></label>
                        <div class="team-fields" id="teamFields"></div>
                        <button type="button" class="btn btn-light-secondary btn-sm mt-2" id="addTeamBtn">
                            <i class="bi bi-plus-lg"></i> 팀 추가
                        </button>

                        <p class="form-note" id="createError" hidden></p>
                    </div>
                    <div class="panel-foot">
                        <button type="button" class="btn btn-light-secondary" id="cancelCreateBtn">취소</button>
                        <button type="button" class="btn btn-primary" id="submitCreateBtn">등록</button>
                    </div>
                </div>

                <%-- 조직 브라우저 — 부서 목록과 선택된 부서의 팀 --%>
                <div class="panel org-browser">
                    <aside class="dept-column">
                        <div class="column-head">
                            부서 <span class="count tnum">${fn:length(depts) }</span>
                        </div>
                        <c:choose>
                            <c:when test="${not empty depts }">
                                <ul class="dept-list">
                                    <c:forEach var="dept" items="${depts }">
                                        <c:set var="teamCount" value="0" />
                                        <c:forEach var="team" items="${teams }">
                                            <c:if test="${team.parentCode eq dept.deptCode }">
                                                <c:set var="teamCount" value="${teamCount + 1 }" />
                                            </c:if>
                                        </c:forEach>
                                        <li>
                                            <button type="button"
                                                class="dept-row ${dept.deptCode eq 'D1' ? 'is-system' : '' }"
                                                data-code="${dept.deptCode }"
                                                data-name="${dept.deptName }"
                                                data-system="${dept.deptCode eq 'D1' }">
                                                <span class="dept-name">${dept.deptName }</span>
                                                <span class="team-count tnum">${teamCount }</span>
                                            </button>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <div class="empty-note">
                                    <i class="bi bi-diagram-3"></i>
                                    <p>등록된 부서가 없습니다.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </aside>

                    <section class="team-column">
                        <c:forEach var="dept" items="${depts }">
                            <c:set var="teamCount" value="0" />
                            <c:forEach var="team" items="${teams }">
                                <c:if test="${team.parentCode eq dept.deptCode }">
                                    <c:set var="teamCount" value="${teamCount + 1 }" />
                                </c:if>
                            </c:forEach>

                            <div class="dept-panel" data-panel="${dept.deptCode }" hidden>
                                <div class="team-head">
                                    <div>
                                        <h2 data-role="title">${dept.deptName }</h2>
                                        <span class="sub">소속 팀 <span class="tnum">${teamCount }</span>개</span>
                                    </div>
                                    <c:if test="${dept.deptCode ne 'D1' }">
                                        <div class="team-actions">
                                            <button type="button" class="btn btn-light-secondary" data-action="rename">이름 수정</button>
                                            <button type="button" class="btn btn-light-danger" data-action="delete">삭제</button>
                                        </div>
                                    </c:if>
                                </div>

                                <%-- 이름 수정 입력 — 수정 버튼을 눌러야 열린다 --%>
                                <div class="rename-box" data-role="renameBox" hidden>
                                    <label class="field-label">변경할 부서명</label>
                                    <div class="affix-field">
                                        <input type="text" class="form-control" data-role="renameInput" autocomplete="off">
                                        <span class="affix">부</span>
                                    </div>
                                    <p class="form-note" data-role="renameError" hidden></p>
                                    <div class="d-flex gap-2 mt-3">
                                        <button type="button" class="btn btn-primary btn-sm" data-action="renameApply">적용</button>
                                        <button type="button" class="btn btn-light-secondary btn-sm" data-action="renameCancel">취소</button>
                                    </div>
                                    <div class="split"></div>
                                </div>

                                <c:choose>
                                    <c:when test="${teamCount > 0 }">
                                        <ul class="team-list">
                                            <c:forEach var="team" items="${teams }">
                                                <c:if test="${team.parentCode eq dept.deptCode }">
                                                    <li class="team-item">${team.deptName }</li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="empty-note">
                                            <i class="bi bi-people"></i>
                                            <p>소속된 팀이 없습니다.</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>

                        <div class="empty-note" id="noSelection">
                            <i class="bi bi-arrow-left"></i>
                            <p>왼쪽에서 부서를 선택하세요.</p>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	var path = "${path }";
</script>

<script src="${path }/resources/assets/static/js/components/dark.js"></script>
<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${path }/resources/assets/compiled/js/app.js"></script>
<script src="${path }/resources/waait/index.js"></script>
<script src="${path }/resources/js/departmentmanage.js"></script>
</html>