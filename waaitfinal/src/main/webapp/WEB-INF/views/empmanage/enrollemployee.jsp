<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path }/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/toastify-js/src/toastify.css">
<style>
	.enroll-form .form-label {
		font-weight: 500;
	}
	.enroll-form .form-group {
		margin-bottom: 1rem;
	}
	.enroll-hint {
		color: #dc3545;
		font-size: .8rem;
	}
	.profile-card .avatar img {
		object-fit: cover;
	}
</style>

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>사원 등록</h3>
				<p class="text-subtitle text-muted">새로운 사원의 기본 정보를 입력합니다.</p>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${path }/">Dashboard</a></li>
						<li class="breadcrumb-item"><a href="${path }/manage/empmanagemain.do">사원관리</a></li>
						<li class="breadcrumb-item active" aria-current="page">사원등록</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

	<section class="section">
		<form action="${path }/manage/enrollemployee.do" method="POST"
			enctype="multipart/form-data" onsubmit="return beforeEnrollEmployee()"
			class="enroll-form">
			<div class="row">
				<div class="col-12 col-lg-4">
					<div class="card profile-card">
						<div class="card-body">
							<div class="d-flex justify-content-center align-items-center flex-column py-3">
								<div class="avatar avatar-2xl">
									<img id="profilePreview" src="${path }/resources/assets/compiled/jpg/2.jpg" alt="Avatar">
								</div>
								<h5 class="mt-3 mb-1" id="previewName">새 사원</h5>
								<p class="text-small text-muted mb-0" id="previewEmail">이메일이 자동 생성됩니다</p>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header">
							<h4 class="card-title mb-0">첨부파일</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label for="signfile" class="form-label">서명 파일</label>
								<div class="fileContainer">
									<input type="file" id="signfile" class="basic-filepond" name="signfile">
								</div>
							</div>
							<div class="form-group mb-0">
								<label for="profile" class="form-label">프로필 사진</label>
								<div class="fileContainer">
									<input type="file" id="profile" class="image-preview-filepond" name="profile">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-8">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title mb-0">기본 정보</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="name" class="form-label">이름</label>
										<input type="text" name="empName" id="name" class="form-control" placeholder="ex) 홍길동" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="engName" class="form-label">영어이름</label>
										<input type="text" name="engName" id="engName" class="form-control" placeholder="ex) HongGilDong" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="empEmail" class="form-label">사내 메일주소</label>
										<input type="text" name="empEmail" id="empEmail" class="form-control" placeholder="영어이름 입력 시 자동 생성" disabled required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="usingEmail" class="form-label">현재 사용중인 메일</label>
										<input type="text" name="usingEmail" id="usingEmail" class="form-control" placeholder="아이디와 비밀번호를 받을 메일주소입니다." required>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="empPhone" class="form-label">핸드폰 번호</label>
										<input type="text" name="empPhone" id="empPhone" class="form-control" placeholder="ex) 010-1234-1234" required>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="empBirth" class="form-label">출생일</label>
										<input type="date" name="empBirth" id="empBirth" class="form-control" required>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="empGender" class="form-label">성별</label>
										<select name="empGender" id="empGender" class="form-select" required>
											<option value="m">남성</option>
											<option value="f">여성</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header">
							<h4 class="card-title mb-0">주소</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<div class="d-flex align-items-center flex-wrap gap-3">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="selectAddressMethod" id="directCheck" value="direct">
										<label class="form-check-label" for="directCheck">직접입력</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="selectAddressMethod" id="usingApiCheck" value="usingApi">
										<label class="form-check-label" for="usingApiCheck">우편번호로 찾기</label>
									</div>
									<span id="alertAddressSelect" class="enroll-hint" hidden="true">입력방식을 선택해주세요.</span>
								</div>
							</div>

							<div id="joinAddressByApi" hidden="true">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group">
												<input type="text" id="sample2_postcode" class="form-control" placeholder="우편번호" readonly>
												<button type="button" class="btn btn-outline-primary" onclick="sample2_execDaumPostcode()">검색</button>
											</div>
										</div>
									</div>
									<div class="col-md-8">
										<div class="form-group">
											<input type="text" name="roadAddress" id="sample2_address" class="form-control" placeholder="주소" readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" name="detailAddress" id="sample2_detailAddress" class="form-control" placeholder="상세주소">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" id="sample2_extraAddress" class="form-control" placeholder="참고항목" readonly>
										</div>
									</div>
									<div class="col-12">
										<span id="alertUsingApi" class="enroll-hint" hidden="true">입력란을 채워주세요.</span>
									</div>
								</div>
							</div>

							<div id="directWriteAddress" hidden="true">
								<div class="form-group mb-0">
									<input type="text" name="empAddress" id="empAddress" class="form-control" placeholder="주소 입력">
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header">
							<h4 class="card-title mb-0">소속 정보</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="selectJob" class="form-label">직책</label>
										<select name="levelCode" id="selectJob" class="form-select">
											<c:if test="${not empty jobs }">
												<c:forEach var="job" items="${jobs }">
													<option value="${job.levelCode }">${job.levelName }</option>
												</c:forEach>
											</c:if>
											<c:if test="${empty jobs }">
												<option value="empty" disabled>직급이 없습니다.</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="selectDept" class="form-label dept-label" hidden="true">부서</label>
										<select id="selectDept" class="form-select dept-select" hidden="true">
											<c:if test="${not empty depts }">
												<c:forEach var="dept" items="${depts }">
													<option value="${dept.deptCode }">${dept.deptName }</option>
												</c:forEach>
												<option id="noDeptOption" value="noDept">부서없음</option>
											</c:if>
											<c:if test="${empty depts }">
												<option value="empty" disabled>부서가 없습니다.</option>
											</c:if>
										</select>
										<input type="text" id="inputDeptCode" name="deptCode" hidden="true">
										<input type="text" id="inputTeamCode" name="teamCode" hidden="true">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group" id="teamContainer" hidden="true"></div>
								</div>
								<div class="col-12">
									<span class="enroll-hint">직책이 대표이거나 부장일 경우 팀은 선택할 수 없습니다.</span>
								</div>
							</div>
						</div>
					</div>

					<div class="d-flex justify-content-end gap-2 mb-4">
						<button type="button" class="btn btn-light-secondary" onclick="history.back()">취소</button>
						<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</div>
			</div>
		</form>

		<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
				style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1"
				onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
	</section>
</div>

<script>
	document.querySelectorAll("input[name='selectAddressMethod']").forEach(e => {
		e.addEventListener("click", e => {
			if(e.target.checked && e.target.value == 'direct') {
				document.getElementById("directWriteAddress").hidden = false;
				document.getElementById("joinAddressByApi").hidden = true;
				document.getElementById("alertAddressSelect").hidden = true;
			} else {
				document.getElementById("directWriteAddress").hidden = true;
				document.getElementById("joinAddressByApi").hidden = false;
				document.getElementById("alertAddressSelect").hidden = true;
			}
		})
	});

	document.getElementById("engName").addEventListener("blur", e => {
		const email = e.currentTarget.value + "@waait.com";
		document.getElementById("empEmail").value = email;
		document.getElementById("previewEmail").textContent = email;
	});

	document.getElementById("name").addEventListener("blur", e => {
		document.getElementById("previewName").textContent = e.currentTarget.value || "새 사원";
	});

	document.addEventListener("DOMContentLoaded", e => {
		document.getElementById("selectJob").addEventListener("click", e => {
			const deptLabel = document.querySelector("label[class='form-label dept-label']");
			const deptSelect = document.getElementById("selectDept");
			const teamContainer = document.getElementById("teamContainer");
			const noDeptOption = document.getElementById("noDeptOption");
			const jobLevel = e.target.value;

			if(jobLevel == "L1") {
				deptLabel.hidden = true;
				deptSelect.hidden = true;
				teamContainer.hidden = true;
			} else if(jobLevel == "L2") {
				deptLabel.hidden = false;
				deptSelect.hidden = false;
				teamContainer.hidden = true;
			} else if(jobLevel == "L3") {
				deptLabel.hidden = false;
				deptSelect.hidden = false;
				teamContainer.hidden = false;
				noDeptOption.hidden = false;
			} else {
				teamContainer.hidden = true;
				noDeptOption.hidden = true;
				deptSelect.options[0].selected = true;
			}
		});

		document.getElementById("selectDept").addEventListener("click", e => {
			const levelCode = document.getElementById("selectJob").value;
			const deptCode = document.getElementById("selectDept").value;
			if(levelCode == "L1" || levelCode == "L2") {
				document.getElementById("teamContainer").hidden = true;
				return;
			}
			fetch("${path }/manage/getteam.do", {
				method : "POST",
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
				},
				body : "deptCode=" + deptCode
			})
			.then(response => response.json())
			.then(data => {
				if(data.length > 0 && (levelCode != "L1" && levelCode != "L2")) {
					document.getElementById("teamContainer").hidden = false;
					let optionStr = "<label for='selectTeam' class='form-label'>팀</label>"
										+ "<select name='department.deptCode' id='selectTeam' class='form-select'>";
					for(let i = 0; i < data.length; i++) {
						let department = data[i];
						optionStr += "<option value='" + department["deptCode"] + "'>" + department["deptName"] + "</option>"
					}
					optionStr += "</select>";
					document.getElementById("teamContainer").innerHTML = optionStr;
				}
			})
		})
	})

	const beforeEnrollEmployee = () => {
		const directCheck = document.getElementById("directCheck"); //직접입력 선택
		const usingApiCheck = document.getElementById("usingApiCheck"); //우편번호 검색 선택
		const directAddressInput = document.getElementById("empAddress"); //직접입력 input
		const detailAddressInput = document.getElementById("sample2_detailAddress"); //상세주소
		const roadAddressInput = document.getElementById("sample2_address"); //도로명주소
		if(!directCheck.checked && !usingApiCheck.checked) {
			alert("주소 입력방식을 선택하고 주소를 입력해주세요.");
			directCheck.focus();
			document.getElementById("alertAddressSelect").hidden = false;
			return false;
		}

		if((directCheck.checked && directAddressInput.value.length == 0)
				|| (usingApiCheck.checked && (detailAddressInput.value.length == 0 || roadAddressInput.value.length == 0))) {
			alert("주소 입력칸을 채워주세요.");
			directAddressInput.focus();
			document.getElementById("alertUsingApi").hidden = false;
			return false;
		}

		const selectJobLevel = document.getElementById("selectJob");
		const selectDept = document.getElementById("selectDept");
		const selectTeam = document.getElementById("selectTeam");
		const deptHiddenInput = document.getElementById("inputDeptCode");
		const teamHiddenInput = document.getElementById("inputTeamCode");

		if(selectJobLevel.value == "L1") {
			deptHiddenInput.value = "D1";
			teamHiddenInput.value = "noTeam";
		} else if(selectJobLevel.value == "L2") {
			deptHiddenInput.value = selectDept.value;
			teamHiddenInput.value = "noTeam";
		} else {
			deptHiddenInput.value = selectDept.value;
			teamHiddenInput.value = selectTeam ? selectTeam.value : "noTeam";
		}

		if(selectDept.value == "noDept") {
			deptHiddenInput.value = "noDept";
		}

		return true;
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

<script src="${path }/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="${path }/resources/assets/extensions/filepond/filepond.js"></script>
<script src="${path }/resources/assets/extensions/toastify-js/src/toastify.js"></script>
<script src="${path }/resources/assets/static/js/pages/filepond.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
