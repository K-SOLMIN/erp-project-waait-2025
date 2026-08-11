/**
 * 부서 관리
 * - 왼쪽 부서 목록에서 하나를 고르면 오른쪽에 그 부서의 팀 패널이 열린다.
 * - 등록/수정/삭제가 성공하면 화면을 다시 불러 목록과 개수를 실제 값에 맞춘다.
 */

const MAX_TEAM_INPUT = 5;

/** 마지막 글자의 받침 유무로 조사를 고른다 ('개발부를' / '개발1팀을') */
const particle = (word, withJong, withoutJong) => {
	const code = word.charCodeAt(word.length - 1);
	if(code < 0xAC00 || code > 0xD7A3) return withJong;
	return (code - 0xAC00) % 28 > 0 ? withJong : withoutJong;
};

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
		'<button type="button" class="icon-btn is-danger" data-action="removeTeam" aria-label="팀 입력란 삭제">' +
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
	if(name.endsWith(suffix)) {
		return "'" + suffix + "'" + particle(suffix, "은", "는") + " 자동으로 붙습니다. 앞부분만 입력하세요.";
	}
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

/* ---------- 팀 ---------- */

const showNote = (el, message) => {
	el.textContent = message;
	el.classList.add("is-error");
	el.hidden = false;
};

/** 팀명이 이미 쓰이고 있는지 서버에 물어본다. 중복이면 true */
const isTeamNameTaken = (name) =>
	fetch(path + "/manage/checkduplicateteamname.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "modifyName=" + encodeURIComponent(name)
	})
	.then(response => response.text())
	.then(data => Number(data) > 0);

const openTeamRename = (item) => {
	const box = item.querySelector("[data-role='teamEdit']");
	const input = item.querySelector("[data-role='teamInput']");
	const name = item.querySelector("[data-role='teamName']").textContent.trim();

	input.value = name.endsWith("팀") ? name.slice(0, -1) : name;
	item.querySelector(".team-line").hidden = true;
	box.hidden = false;
	input.focus();
	input.select();
};

const closeTeamRename = (item) => {
	item.querySelector("[data-role='teamEdit']").hidden = true;
	item.querySelector("[data-role='teamError']").hidden = true;
	item.querySelector(".team-line").hidden = false;
};

const applyTeamRename = (item) => {
	const input = item.querySelector("[data-role='teamInput']");
	const note = item.querySelector("[data-role='teamError']");
	const error = validateName(input.value, "팀");

	if(error) {
		showNote(note, error);
		input.focus();
		return;
	}
	note.hidden = true;

	const newName = input.value.trim();
	isTeamNameTaken(newName)
		.then(taken => {
			if(taken) {
				showNote(note, "'" + newName + "팀'은 이미 있는 이름입니다.");
				return null;
			}
			return fetch(path + "/manage/modifyteamname.do", {
				method : "POST",
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
				},
				body : "teamCode=" + encodeURIComponent(item.dataset.team)
						+ "&modifyName=" + encodeURIComponent(newName)
			})
			.then(response => response.text());
		})
		.then(data => {
			if(data === null || data === undefined) return;
			if(Number(data) > 0) location.reload();
			else showNote(note, "팀명 변경에 실패했습니다.");
		})
		.catch(() => showNote(note, "팀명 변경 중 오류가 발생했습니다."));
};

const deleteTeam = (item) => {
	const teamName = item.querySelector("[data-role='teamName']").textContent.trim();
	if(!confirm(teamName + particle(teamName, "을", "를") + " 삭제할까요?\n되돌릴 수 없습니다.")) return;

	fetch(path + "/manage/deleteteam.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "teamCode=" + encodeURIComponent(item.dataset.team)
	})
	.then(response => response.text().then(text => {
		// 사원이 남아 있으면 서버가 500과 함께 사유를 돌려준다
		if(!response.ok) throw new Error(text);
		return text;
	}))
	.then(() => location.reload())
	.catch(error => alert(error.message || "팀 삭제 중 오류가 발생했습니다."));
};

const openTeamAdd = (item) => {
	item.querySelector(".add-team-btn").hidden = true;
	item.querySelector("[data-role='teamAddBox']").hidden = false;
	item.querySelector("[data-role='teamAddInput']").focus();
};

const closeTeamAdd = (item) => {
	item.querySelector("[data-role='teamAddBox']").hidden = true;
	item.querySelector("[data-role='teamAddError']").hidden = true;
	item.querySelector("[data-role='teamAddInput']").value = "";
	item.querySelector(".add-team-btn").hidden = false;
};

const applyTeamAdd = (item, deptCode) => {
	const input = item.querySelector("[data-role='teamAddInput']");
	const note = item.querySelector("[data-role='teamAddError']");
	const error = validateName(input.value, "팀");

	if(error) {
		showNote(note, error);
		input.focus();
		return;
	}
	note.hidden = true;

	const newName = input.value.trim();
	isTeamNameTaken(newName)
		.then(taken => {
			if(taken) {
				showNote(note, "'" + newName + "팀'은 이미 있는 이름입니다.");
				return null;
			}
			return fetch(path + "/manage/enrollteam.do", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				body : JSON.stringify({ parentDeptCode : deptCode, teamNameStr : newName })
			})
			.then(response => response.text());
		})
		.then(data => {
			if(data === null || data === undefined) return;
			if(Number(data) > 0) location.reload();
			else showNote(note, "팀 추가에 실패했습니다.");
		})
		.catch(() => showNote(note, "팀 추가 중 오류가 발생했습니다."));
};

/* ---------- 부서 삭제 ---------- */

const deleteDept = (panel) => {
	const deptName = panel.querySelector("[data-role='title']").textContent.trim();
	const teamCount = panel.querySelectorAll(".team-item[data-team]").length;
	const teamPart = teamCount > 0 ? "\n소속 팀 " + teamCount + "개도 함께 삭제됩니다." : "";

	if(!confirm(deptName + particle(deptName, "을", "를") + " 삭제할까요?" + teamPart + "\n되돌릴 수 없습니다.")) return;

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
		const item = trigger.closest(".team-item");

		switch(trigger.dataset.action) {
			case "rename":            openRenameBox(panel);            break;
			case "renameCancel":      closeRenameBox(panel);           break;
			case "renameApply":       applyRename(panel);              break;
			case "delete":            deleteDept(panel);               break;

			case "teamRename":        openTeamRename(item);            break;
			case "teamRenameCancel":  closeTeamRename(item);           break;
			case "teamRenameApply":   applyTeamRename(item);           break;
			case "teamDelete":        deleteTeam(item);                break;
			case "teamAddOpen":       openTeamAdd(item);               break;
			case "teamAddCancel":     closeTeamAdd(item);              break;
			case "teamAddApply":      applyTeamAdd(item, panel.dataset.panel); break;
		}
	});
});
