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
	                <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQDxAPEBAQDw8QDxAQEA8QEA8PEA8PFRIWFhURFhUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQFy0dHh0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLSstLS0tLSstLS0tLS0tLS0rLS0tLf/AABEIARMAtwMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAAAQIGAwQFB//EAD4QAAEEAAMFBQYEAwcFAAAAAAEAAgMRBBIhBQYxQVETYXGBkSIyQqGxwQdS0fAUI3IzYoKisuHxFTRTY8L/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP/EACERAQEAAgMAAQUBAAAAAAAAAAABAhEDITESIjJBQlET/9oADAMBAAIRAxEAPwCwIQhdnIkJoUCQmhBFCkikCQhMIIppopUKkUhNAkJoUAikwEBUFJoQEDQhNAk0IU0MaEJ2qEhCagSE6RSAQAmEUgVIpY8RiY4xmke1g6ucGj1KwQbUgf7k0bvB7T90G2nSgZW1diutpteDwQCFNKkEU6TQgQSpSQgSaEKhoQhA0IQoMadICaoEITUCTSsLR2ptaLDNDpHAWQAOZ6+iDbmmawFziGtAskmgAqVtvfrKSzDNDq07V11/hHNcPezeF2KflaSIG8G8M5/M77BV61m5fxqRtY3aEs7+0lcXu7+AHQDkFiNk3flQCi398FnjeFlo2yvrR7hXABxFLubH3omw4p9ysHImj6rjOivWvqouZXFXY9E2TvlBMakuFx4ZtWnzVjjla4WCCF4uxvMaK0bubcex2SQlw+Ek0b6d61KzY9DQsMEuYA9QsqrJpISKBoUUwgkhJCqpISQptEEwkE1Q1o47HhnsMGeU8G3oB1ceQ4955BQ2ttDs8kTNZpTljHGgOLyOgVf2hiuzH8Nh80uIkvM7QuJPvOJvu5/oosjT2ttLESPcyOQ5m2X5DkijHe46n11VSxuKfI7+Y90hFgZnEgDutWHb0b8NC2LOyMu1cxpL5Hnm579B5AKqHvWMmoEwB3pxgFbsUDCLrzWVYYWA8lmyAcOKno3km0WtaGvm114LK9ns2L/2W7g9nGV7WgcT0tWnaO6ojw5cPhaTXh/wsW6bxw2oZaRqOBWWKQ8QaI5q27I3fE0bxVlvD0H78lq4zdlzdWiiOWtFT56a/wA62d2N4CHCGWtTTXcrV4abC8kxeGLO4g+i9E3Y2gZ8Mxx94DK7xGlrtLtxymnYSKSFpgIQkgkE1FMKBppIQRCkorDjJiyNzgLdVNb+Zx0aPMkKiqYnFmTE4hzDTwDEJK9nDwM/tH/1E3QWDATx4SGTEEXI62Rg0ST8Tj5ivIdUF3Z4AEaPmfb3fmc99u18GEeCq208YX00Gw1oaPGtT62s26bka2OxjpZHPe4ucTqfstdIhK1zVnjpZxNXDgFph1JZkVsCQk+K6OBjL3tY0cSAuXA2yrvubs+nGVw928t93EqXLTWOO3b3c2WGy8LyaeY4/Ox5Kz7XaOweK4NP0WluxES1zyOLjXXqtreGXJCepc0AddbI9AVje3Zo7sQgCTTT2B/q/VdPE4YG9Fr7tQ1Fm/M7MP6QA1v0JXVeFKPMN7cFkeXAaOBPmKv99xWT8P5fZmj6ODh4OH+yse9OBD8jeBc+h5tOn76KqblAsxM8Z4htH/C6l04725cs62vCEgU13ec0JIQNNJO0AEItCCIUHx5nAng2yP6qq/r6qSaDz7eKQswrY+bZ3t8gXV/qXJ3c2ScTIb91tFx8TX6qwb54EmRlcHkmv6QLPot7cXDBuHc6tTIfQDQLNm8m99KtvBsLsM72mmNcG0eNkNP/ANLgK4b+uIc3k15sj8xaAL+i4mA2E6VubO1l+6Dz6caWM9StYy5eOQU2ttZsRgZGSGN4pzTqFs4PD+0LWR1NibJLhmI0FADqeQ/fVW6aQQQVwLqaK40eJr1PknsTD2xo8j3E6nXrWnksrmh8xkcP5UWjdLzHqO7Qeneudvb04zU038HtCZsQbHFl0u3Kv7Q2hi8VMIhREZs5dWg2NSf381qbyb1y0WRNcxnumQinHuF8PFbm60s/8K7EMazI15Dow055KqyCScx1qtOC1JdM2zelv2LnY1rHHgAPkujjJwwEm6roT9Fp7OeJGtkb7r2hwPUELa2kw5QsLfVE2sZ55BIXmONhOQEEOLuAIbx515rn7uxOi2hI15tz4s195c0/qs+BxEuNnmzvdBAxr8hprdbpptw1J14LDuvBJ/FvfIbcyJrb7j7vyauuEu458lli6Wnahadru8yaFEFSQNNJNAIQhBFCiCmiNLaGDEjgas0W+Def1U8DgxE0tbwsmvFbSRNIrzff/EZsSGcmMHqdfpSsm7+DhGE/iZbcJI2BoGpHsW4Dvu/RUfeWbPi5nf8AsLfJvs/ZXT8PZ2T4R2Hdq6GQEA6+wSXNPhq4eQXm5e3p4brpzdrYITDtWRuYWHKGk250dWPMa6dFwg3I8c7PTmvU5sHllbM4AMaXCm8BYI+6pG80Q7YloGr6H7+azjfw6Z4y9xY9mtuNsLOlPcO/Ui+p4nu6WFa8FgGBgbQodyre6zAIwegyj7nzNq0QTLLVc3H7uxPJIaNeII9kjwSg2JTRHQEY4MF5fTgu62S1MBahusOHgDGhoAAGgA0ACyTx5m+Cx4ibKp4SS9Cqw50uzGHWh6BaOOwTYyHAAEiiQONcPqVYQ3UhcvbbtGjvta4/uZ5PtcwFNRBTteh5UwpArGCpAoMiEk0AhCEGNNRQglai86FCSDx/bjSMTMDx7V/zcSjY+05cJM2eI6jQtPuvbzaVu76YfJjJP74a/wBRX1BXIc1cbO3WX8vZti7wR4yHtGAgtH81vOPTie7TiqltBrZcRNlNhvCjepcPsn+GMWduMjyscXRAW97mZfeHAcRw8KHVYI4DHLmHuuBafEf8fJc7jp3xy2tWwhlZl6LuRuXB2c/gu3CVit31uQyardY5c+NbTX0kZrW2jHJo5gzVxF0fELifwuOMpkc9oYbyRtFZBys81YZ9oRxi3uDQOpXDm3ww+amm9eKrphjlfI7OzQ8M9s246k/Zc3a8tyV0HzKybL20ydri3Qt4+HVc6aTM5zupXXine3n5tzqmCpLEFK16HmZAVMFYmlTBQZAVJQCkFA0IQgxJqIKdoGkgpWgoX4iw/wAyF/Vrm34EEfUqrN1HgFefxBjuFh6Ooef/AAVRINDS55etzxu7KkIJF1aseAxFnI7gfUHkQq1s5hzk8gde6+as4whNVo7iO/uXHK9vRxzp1cPMYjldw5O5H9FYsBig7mubhcOJoBY9oCvNc8Z4Xc6XLbtra5sesrnWNFxdn7Ra+rOq7MLgVWLNK5tTdxsji98kr7JOUvpo7gBS5R2FhuDmm+FZnG1f2YdruKidnxDgAtOuPNZNeq9gcAzCwUxoa5+nfXL5LGFtbSkt9Dg3TzWsF6uPHUeDlz+WWzCkohSW3NIKQKgCpBBkBUgVjapBQTBQkEIMaEk0AhNIoK1v5X8ML49q2vQ2vPnCj5fdWTe7aXbylrTcURyg8nP+I/ZV5zbrv0+i55etx2N24w+UtOtjUdQVdMJhLJhJqSOnRuPxN5H7H/cKhbNc6ORj2+8x+Ug8CTwB89PNejtPbRR4iEW+M3lOhsaPiPjw9CvNyevVx3p0MAwUdKN09vRyhjMIHcltsAka2WP4mg9M1cQehH2KyHULk3tWjg8p00W5BLKzgbHQrcni1C18YcsUjuGVhA8SKXSQuXTQw2/UHMuB6Frr4XyXUw+3u2bmj4dV5NLASLA+PKPGtFZd0MdrkOgcK8Ht5en0Xoxwm3my5Lpao3akHiD6g8/r6LKFid7wPXRZV3cDQkmgYUlG1IIJBSCgEwVBNNRCEEE1FBKCTnACzoBzVe2ntF89w4ew0mnSjmOYZ+q6c8Bfec+zyYOHn1TgwoHLT7dPBVYo+8OEELY2DoTpw8v1XP2Vh+0mjZ3j5Lob2zZ8S4cmAN+63Nx8KDLJM7RsTbs8Ba4cl1t1wm6wYuOOHFyxyA9i8BjiBeUlgJcO8E35qybsYzs39k5ze0IvQjJi2DhLGeGeuI7vTo4HYbMTE8zNNySGRpHsvZfukdDVLWl3FBblEpq7Gla9a4X30uF1XedO4T2JD2/9vIbv/wAMpNWejXcD0PiVuvbzXDwGy8bBbDM2aNwoiVheCKrU2Dfja32iTDgWDJB1FufD3EcXN7+I53xWfiuzmGq5G9rsmDdyzPjH+YH7Ls9o19Oa4OF8ja5W/UIOEF8BKy/mPut4ztnLx5++SjIw6APY4Hvzc/8ACT6JZiyUkaZsr7HwyDn4XfkV28dsTSx7Ry6jmW8D58CuZsZuaZjT+VzT6j9V6rO3nWzZ+PbPG13Bw0e3m1wItb65uGwoDr914AaSOD2g6FdFbYO07SCaIYUgVEKQQTBTUQmFBIIStCogEKKdqBqGIlDWOcdAASfBStc/a8MkjcjCAD7zj07givPtoOLpHOOrjbndxcbr5gL0DcvZVYUZhrK7OR3clWxsB18/bla2zqcpIF/Ur0/AQBjGtAoAADwXm5N+O/H/AFswRBoAHJZlAFau0NpRQML5pGxsHNxqz0A4k9wXPTptuFQNclQNq/iRGDlw0Rk/vyWxvDk3ieXRcIb+47NmuKvy9n7I+d/NamGTNzj0yfZbHOztaGu5kaX6LR3nwxlwM8VHO1mdtcSWEOFeir2yPxK1DcVDQ4GWImh35D9j5K6txEWIjEsT2yMPxNII8PHuV+Ni/KVRHYiWJohk1nyjsn17MzXaB48LFhQweyw2dpbwijomvecTz9F394tngQGUe9hxnj7mjizzGnotfDuBaHDg4A+VL0YZfKduGc0y0mkhdGEkwVFNRElIKAKkEE7TtQRaCaFG0II2i0kKB2i1C0WqM+DjDpG92qsA4LjbKGrj4BdKacNaXOIDWguJPAACyV5uW/U9HHPpczezb7cFBn0dK/2YmH4nc3HnlHPyHNeQbX2rNipDLM8uJuhwawflaOQWfePbDsZiHzOJyXliafgjHAeJ4nvK4z3WtYzTOWW0w5TCgxTC1GUwunsHbk2Dk7SJ2hrPG7VkjehH34hctCo9s2NtODaEDnNHEZZoXGywkcO8HkVoO2b/AA7WxgksGjCeIHIHvXnG7O2XYPExzAnJeWVo+KI+8PHmO8Be34jDtlZpqHAEEdCNCFiX4Vr7oqaaxYp5gl7Gb2Sf7N/Bko7jyd1Cyhd5duRppJogCkoqSBppIQSQkhBC0rSQoGkhCo6GzfdPiuPv/tDssE9oPtTObEPA6u+QI8119nn2T4rzz8RdqslmZEx2YQBwcRw7R1WPKvmvLZvN6JdYqlI5Ra1IarKAujmbQpAJKQWgqTQhAL2n8OtpdvgIwT7cBMLvBtFv+Ut9F4sVZtzN6v8Ap/bgsdK2RrS1ocGgSNJ1J5AgnrwCzlNxcbqvW9sbJixUTopW2DwPxNdycDyK87lfPs6YQYq3wONRYmjVdD3932WnjPxJxryezEMTeVML3DzcaPouJjt5cZO1zJp3PY7i0tjynyATDcXKyvRGkEAjUHUEKQVK3b3j7INhl/s7pr/ydx7ldmkEWNQV225UkwikBENCEIGhK0IMaErRaCVoUU0G7gnUx3KjfhovE8VXaOAdnbmdTz8QvR3nxXrWz8e182Iw5qmMjsdc+ax9PVeSzRZZHs4ZXObWulGl5/2rt+sDQpqIKdrbKQTtRQqJJItCIClaFF5UVLMgPUAFMIJAqxbv7yGAdnIC+LkR7zPDqO5VwJ2rKlj1nDztkY17CHNcLBHMKap+5G0tXYZx0Nvj8fib9/VXBdJWaLQkhENCSEGNNRtFoJItRtO0FM30wfZyNxDC4GU5X60LAFV5D5KqPJJJJJJ1JOpXou9mF7TCvPOOpB5cfkSvOHFc8p23PEmBZFijWUKRQmEBAVDQkgqICoPUioO4pVNqmoWhBIuRaVJoM+DxBikZI3ixwd41yXqkMoe1r2mw4Ag9QRYXki9F3VlzYSLuzN9HFbxZydm0KNozLTKSFG00GC0WootUStMFQtO0EyLFHgV5nt/Zpw8zmfAfajP908vLgvSgVyt6MA2bDuOgdGC9pPcNR5hZym1ledxhTSCFzbNNIJoBCEkAsZWQrGlEgFJQBTzIJKNoSQSXoe6cZbhI7+LM7yLjXypefRMzOa0cXEAeZpepQsDWtaNA0AAdwC3imTNaLULRa2ynaFC0kELQhCBJpoRDXI3teRhXUatzQe8WNEIUvixQUBCFybMIQhAFCEIE7gsYQhSiQCkAhCsESgIQoOhsFoOJhB1Ge/MAkfML0dNC6YeM0kIQtoAmhCD/2Q==" alt="" class="profile-img">
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
	                        <input class="nonestyle-input" name="empAge" type="number" value="26" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>성별</td>
	                    <td>
	                        <input class="nonestyle-input" type="text" value="남" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>메일</td>
	                    <td>
	                        <input class="nonestyle-input" type="text" value="solmin614@naver.com" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>주소</td>
	                    <td>
	                        <input class="nonestyle-input" type="text" value="경기도 하남시 감일중앙로 20" readonly>
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
<script src="${path }/resources/js/empdetailview.js" ></script>
</html>