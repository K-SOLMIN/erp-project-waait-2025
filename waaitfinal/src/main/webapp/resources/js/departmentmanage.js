/**
 * 부서 관리
 * - 왼쪽 부서 목록에서 하나를 고르면 오른쪽에 그 부서의 팀 패널이 열린다.
 * - 등록/수정/삭제가 성공하면 화면을 다시 불러 목록과 개수를 실제 값에 맞춘다.
 */

const MAX_TEAM_INPUT = 5;

/* ---------- 부서 선택 ---------- */

const selectDept = (deptCode) => {
	document.querySelectorAll(".dept-row").forEach(row => {
		row.classList.toggle("is-selected", row.dataset.code === deptCode);
	});
	document.querySelectorAll(".dept-panel").forEach(panel => {
		panel.hidden = panel.dataset.panel !== deptCode;
	});

	const noSelection = document.getElementById("noSelection");
	if(noSelection) noSelection.hidden = true;
};

/* ---------- 새 부서 등록 ---------- */

const createPanel = () => document.getElementById("createPanel");

const showCreateError = (message) => {
	const note = document.getElementById("createError");
	note.textContent = message;
	note.classList.add("is-error");
	note.hidden = false;
};

const clearCreateError = () => {
	const note = document.getElementById("createError");
	note.hidden = true;
	note.textContent = "";
};

const openCreatePanel = () => {
	createPanel().hidden = false;
	document.getElementById("deptNameInput").focus();
};

const closeCreatePanel = () => {
	createPanel().hidden = true;
	document.getElementById("deptNameInput").value = "";
	document.getElementById("teamFields").innerHTML = "";
	clearCreateError();
};

const addTeamInput = () => {
	const fields = document.getElementById("teamFields");
	if(fields.children.length >= MAX_TEAM_INPUT) {
		showCreateError("팀은 최대 " + MAX_TEAM_INPUT + "개까지 함께 등록할 수 있습니다.");
		return;
	}
	clearCreateError();

	const row = document.createElement("div");
	row.className = "team-field";
	row.innerHTML =
		'<div class="affix-field">' +
			'<input type="text" class="form-control" name="teamInput" placeholder="개발1" autocomplete="off">' +
			'<span class="affix">팀</span>' +
		'</div>' +
		'<button type="button" class="icon-btn" data-action="removeTeam" aria-label="팀 입력란 삭제">' +
			'<i class="bi bi-x-lg"></i>' +
		'</button>';

	fields.appendChild(row);
	row.querySelector("input").focus();
};

/**
 * 서버가 이름 뒤에 '부'/'팀'을 붙이므로 사용자가 직접 붙이면 '개발부부'가 된다.
 * 입력값을 그대로 두고 안내만 하도록 검사한다.
 */
const validateName = (value, suffix) => {
	const name = value.trim();
	if(name.length === 0) return "이름을 입력하세요.";
	if(name.endsWith(suffix)) return "'" + suffix + "'는 자동으로 붙습니다. 앞부분만 입력하세요.";
	return null;
};

const enrollDeptWithTeam = () => {
	const deptInput = document.getElementById("deptNameInput");
	const deptError = validateName(deptInput.value, "부");
	if(deptError) {
		showCreateError("부서명: " + deptError);
		deptInput.focus();
		return;
	}

	const teamInputs = [...document.querySelectorAll("input[name='teamInput']")];
	for(const input of teamInputs) {
		const teamError = validateName(input.value, "팀");
		if(teamError) {
			showCreateError("팀명: " + teamError);
			input.focus();
			return;
		}
	}

	clearCreateError();
	const deptName = deptInput.value.trim();
	const teamName = teamInputs.map(input => input.value.trim()).join(",");

	fetch(path + "/manage/enrolldepartment.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "deptName=" + encodeURIComponent(deptName) + "&teamName=" + encodeURIComponent(teamName)
	})
	.then(response => response.text())
	.then(data => {
		if(Number(data) > 0) {
			location.reload();
		} else {
			showCreateError("부서 등록에 실패했습니다.");
		}
	})
	.catch(() => showCreateError("부서 등록 중 오류가 발생했습니다."));
};

/* ---------- 이름 수정 ---------- */

const openRenameBox = (panel) => {
	const box = panel.querySelector("[data-role='renameBox']");
	const input = panel.querySelector("[data-role='renameInput']");
	const title = panel.querySelector("[data-role='title']").textContent.trim();

	// 화면의 이름은 '개발부', 서버로 보낼 값은 '개발'이므로 접미사를 떼고 채운다
	input.value = title.endsWith("부") ? title.slice(0, -1) : title;
	box.hidden = false;
	input.focus();
	input.select();
};

const closeRenameBox = (panel) => {
	panel.querySelector("[data-role='renameBox']").hidden = true;
	panel.querySelector("[data-role='renameError']").hidden = true;
};

const applyRename = (panel) => {
	const input = panel.querySelector("[data-role='renameInput']");
	const note = panel.querySelector("[data-role='renameError']");
	const error = validateName(input.value, "부");

	if(error) {
		note.textContent = error;
		note.classList.add("is-error");
		note.hidden = false;
		input.focus();
		return;
	}
	note.hidden = true;

	fetch(path + "/manage/modifydeptname.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "deptCode=" + encodeURIComponent(panel.dataset.panel)
				+ "&deptName=" + encodeURIComponent(input.value.trim())
	})
	.then(response => response.text())
	.then(data => {
		if(Number(data) > 0) {
			location.reload();
		} else {
			note.textContent = "부서명 변경에 실패했습니다.";
			note.classList.add("is-error");
			note.hidden = false;
		}
	})
	.catch(() => {
		note.textContent = "부서명 변경 중 오류가 발생했습니다.";
		note.classList.add("is-error");
		note.hidden = false;
	});
};

/* ---------- 삭제 ---------- */

const deleteDept = (panel) => {
	const deptName = panel.querySelector("[data-role='title']").textContent.trim();
	if(!confirm(deptName + "을(를) 삭제할까요?\n소속 팀도 함께 사라지며 되돌릴 수 없습니다.")) return;

	fetch(path + "/manage/deletedept.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "deptCode=" + encodeURIComponent(panel.dataset.panel)
	})
	.then(response => response.text().then(text => {
		// 사원이 남아 있으면 서버가 500과 함께 사유를 돌려준다
		if(!response.ok) throw new Error(text);
		return text;
	}))
	.then(() => location.reload())
	.catch(error => alert(error.message || "부서 삭제 중 오류가 발생했습니다."));
};

/* ---------- 이벤트 연결 ---------- */

document.addEventListener("DOMContentLoaded", () => {
	const firstDept = document.querySelector(".dept-row");
	if(firstDept) selectDept(firstDept.dataset.code);

	document.getElementById("openCreateBtn").addEventListener("click", openCreatePanel);
	document.getElementById("cancelCreateBtn").addEventListener("click", closeCreatePanel);
	document.getElementById("submitCreateBtn").addEventListener("click", enrollDeptWithTeam);
	document.getElementById("addTeamBtn").addEventListener("click", addTeamInput);

	document.getElementById("deptNameInput").addEventListener("input", clearCreateError);

	document.querySelectorAll(".dept-row").forEach(row => {
		row.addEventListener("click", () => selectDept(row.dataset.code));
	});

	document.getElementById("mainView").addEventListener("click", (e) => {
		const trigger = e.target.closest("[data-action]");
		if(!trigger) return;

		if(trigger.dataset.action === "removeTeam") {
			trigger.closest(".team-field").remove();
			return;
		}

		const panel = trigger.closest(".dept-panel");
		if(!panel) return;

		switch(trigger.dataset.action) {
			case "rename":       openRenameBox(panel);  break;
			case "renameCancel": closeRenameBox(panel); break;
			case "renameApply":  applyRename(panel);    break;
			case "delete":       deleteDept(panel);     break;
		}
	});
});
