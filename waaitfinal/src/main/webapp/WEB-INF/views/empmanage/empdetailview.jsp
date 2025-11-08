<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="e" value="${searchEmp }" />
</head>
<body>
	<h1>상세정보</h1>
	<c:if test="${not empty e }">
		<table>
			<thead class="t-head">
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>메일주소</th>
					<th>직급</th>
					<th>부서/팀</th>
					<th>주소</th>
					<th>입사일</th>
					<th>퇴사여부</th>
					<th>남은연차</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${e.empName }</td>
					<td>${e.empBirth }</td>
					<td>${e.empGender }</td>
					<td>${e.empEmail }</td>
					<td>${e.jobLevel.levelName }</td>
					<td>${e.deptName }/${e.teamName }</td>
					<td>${e.empAddress }</td>
					<td>${e.empStartDate }</td>
					<td>${e.leaveYN }</td>
					<td>${e.remainingAnnualLeave }</td>
				</tr>
			</tbody>
		</table>
	</c:if>
</body>
</html>