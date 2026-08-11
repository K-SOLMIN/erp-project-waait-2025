<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<%-- 포워드된 요청이면 원래 요청 URI를, 아니면 현재 URI를 기준으로 활성 메뉴를 정한다 --%>
<c:set var="fwdUri" value="${requestScope['jakarta.servlet.forward.request_uri'] }" />
<c:set var="navUri" value="${not empty fwdUri ? fwdUri : pageContext.request.requestURI }" />

<c:set var="urlEmpList"   value="${path }/manage/managemain.do" />
<c:set var="urlEmpDetail" value="${path }/manage/joinempdetail.do" />
<c:set var="urlEmpEnroll" value="${path }/manage/enrollemployeeview.do" />
<c:set var="urlOrg"        value="${path }/manage/departmentview.do" />

<%-- 사원 상세는 인사조회의 하위 화면이므로 인사조회를 활성 상태로 둔다 --%>
<c:set var="onEmpList" value="${navUri eq urlEmpList or navUri eq urlEmpDetail }" />

<div class="sidebar-menu">
    <ul class="menu">
        <li class="sidebar-title">인사</li>
        <li class="sidebar-item ${onEmpList ? 'active' : '' }">
            <a href="${urlEmpList }" class="sidebar-link">
                <i class="bi bi-people-fill"></i>
                <span>인사조회</span>
            </a>
        </li>
        <li class="sidebar-item ${navUri eq urlEmpEnroll ? 'active' : '' }">
            <a href="${urlEmpEnroll }" class="sidebar-link">
                <i class="bi bi-person-plus-fill"></i>
                <span>인사등록</span>
            </a>
        </li>

        <li class="sidebar-title">조직</li>
        <li class="sidebar-item ${navUri eq urlOrg ? 'active' : '' }">
            <a href="${urlOrg }" class="sidebar-link">
                <i class="bi bi-diagram-3-fill"></i>
                <span>조직 관리</span>
            </a>
        </li>

        <li class="sidebar-item mt-4">
            <a href="${path }/" class="sidebar-link">
                <i class="bi bi-arrow-left-circle"></i>
                <span>전체 메뉴</span>
            </a>
        </li>
    </ul>
</div>
