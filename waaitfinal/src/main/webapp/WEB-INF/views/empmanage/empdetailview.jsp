<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%-- <link rel="stylesheet" href="${path }/resources/assets/compiled/css/app.css"> --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath }" />
	<c:set var="e" value="${searchEmp }" />
</head>
<body>
	<header>
		<div class="logo" style="height: 100; ">
			<a href="${path }/"><img src="/resources/images/logo.png" alt="Logo" width="150px" style="height:90px"></a>
		</div>
	</header>
	<c:if test="${not empty e }">
		<div id="main-content">
	        <div class="left-side">
	            <div class="profile-container">
	                <img src="${path }/resources/upload/emp/profile/${e.empProfile }" alt="" class="profile-img">
	            </div>
	            <div class="name-container">
	                <p>${e.empName }</p>
	            </div>
	        </div>
	        <div class="main-content">
	            <table class="empinfo-table">
	                <tr>
	                    <td>나이</td>
	                    <td>
	                        <input class="nonestyle-input" name="empAge" type="text" value="${enAge }" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>성별</td>
	                    <td>
	                        <input class="nonestyle-input" type="text" value="${e.empGender }" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>메일</td>
	                    <td>
	                        <input class="nonestyle-input" type="text" value="${e.empEmail }" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>주소</td>
	                    <td>
	                        <input class="nonestyle-input" type="text" value="${e.empAddress }" readonly>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    <div class="btn-content">
	        <button class="btn btn-primary">수정</button>
	        <button class="btn btn-danger">삭제</button>
	    </div>
    </c:if>
</body>
<link rel="stylesheet" href="${path }/resources/css/sol/empdetailview.css">
</html>