let showSelector = false;
$(document).ready(function() {
	// selector 커스텀 해서 만들기
	
	$("#esPreservationPeriod").val("5");
	$("#esSecurityLevel").val("A등급");
	
	
	let showSelector = false;
	$(document).on("click", ".selectorType", function() {
		if (!showSelector) {
			console.log("1");
			$(this)
				.parent()
				.find(".selectorArrow")
				.children()
				.attr("class", "fa-solid fa-chevron-up");
			$(this).parent().find(".selector__option").css("display", "block");

			showSelector = true;
		} else {
			console.log("2");
			$(this).parent().find(".selector__option").css("display", "none");
			$(this)
				.parent()
				.find(".selectorArrow")
				.children()
				.attr("class", "fa-solid fa-chevron-down");
			showSelector = false;
		}
	});

	$(document).on("click", ".option__item", function() {
		$(this).parent().parent().find(".typeName").html($(this).html());
		formatByDocumentType();

		if (
			$(this).parent().parent().attr("id") === "year" ||
			$(this).parent().parent().attr("id") === "month"
		) {
			$(".titleInput").val(
				$("#year .typeName").text() +
				"년 " +
				$("#month .typeName").text() +
				"월 지출 결의서 - 개인"
			);
		}
		if($(this).parent().parent().attr("id")==="preservationPeriod"){
			if($("#preservationPeriod .typeName").text()==="1년"){
				$("#esPreservationPeriod").val("1");
			}else if($("#preservationPeriod .typeName").text()==="3년"){
				$("#esPreservationPeriod").val("3");
			}else if($("#preservationPeriod .typeName").text()==="5년"){
				$("#esPreservationPeriod").val("5");
			}else if($("#preservationPeriod .typeName").text()==="10년"){
				$("#esPreservationPeriod").val("10");
			}else{
				$("#esPreservationPeriod").val("999");
			}
		}
		if($(this).parent().parent().attr("id")==="securityLevel"){
			$("#esSecurityLevel").val($("#securityLevel .typeName").text());
		}
	});

	// selector외부를 클릭하면 selector가 닫히도록 설정
	$(document).on("click", function(event) {
		let clickElement = $(event.target);
		if (clickElement.closest(`.selectorType`).length > 0) {
			console.log("4");
			// 모든 .selector__option 숨기기
			$(".selector__option").css("display", "none");
			$(".selector__option")
				.parent()
				.find(".selectorArrow")
				.children()
				.attr("class", "fa-solid fa-chevron-down");
			// 클릭된 .selectorType에 속한 .selector__option만 보이게 설정
			if (showSelector) {
				console.log("5");
				clickElement
					.closest(`.selectorType`)
					.parent()
					.find(".selector__option")
					.css("display", "block");
				clickElement
					.closest(`.selectorType`)
					.parent()
					.find(".selectorArrow")
					.children()
					.attr("class", "fa-solid fa-chevron-up");
				showSelector = true;
			}
		} else {
			console.log("3");
			$(".selector__option").css("display", "none");
			$(".selector__option")
				.parent()
				.find(".selectorArrow")
				.children()
				.attr("class", "fa-solid fa-chevron-down");
			showSelector = false;
		}
	});

	// 보존연한 및 보안등급 툴팁 이벤트
	$("#period, #level").on("mouseover", function() {
		if ($(this).attr("id")==="period") {
			$("#period__tooltip").css("display", "block").css("opacity", "1");
		} else {
			$("#level__tooltip").css("display", "block").css("opacity", "1");
		}
	});
	$("#period, #level").on("mouseout", function() {
		if ($(this).attr("id")==="period") {
			$("#period__tooltip").css("display", "none").css("opacity", "0");
		} else {
			$("#level__tooltip").css("display", "none").css("opacity", "0");
		}
	});

	// 현재 년도와 월을 기준으로 회계 기준일 동적 생성
	createYear();
	createMonth();

	$("input[name='type']").on("change", function() {
		if ($("input[name='type']:checked").val() === "개인") {
			$("#accountInfo").css("display", "flex");
			$("#corporationCard").css("display", "none");
		} else {
			$("#accountInfo").css("display", "none");
			$("#corporationCard").css("display", "flex");
		}
	});
	
	$("#searchUser").on("change",function(){
		$.ajax({
			url: "/office/searchUserAjax",
				dataType: "json",
				data: { keyword: $(this).val() }
		}).done(function(resp){
			console.log(resp)
		})
	})

	// 기안하기
	$("#vacationdraftingBtn").on("click", function(){
		if($("#esDocumentType").val()==="선택"||$("#esDocumentType").val()===""){
			alert("문서 종류를 선택하고 내용을 입력해주세요");
			return;
		}
		if($("#applicationEmployeeIDList").val()===""||$("#processEmployeeIDList").val()===""){
			alert("결제선을 설정해주세요.");
			return;
		}
		if($(".titleInput").val()===""){
			alert("문서 제목을 입력해주세요.");
			return;
		}
	})
});

// 문서 종류에 따른 ui 구성 변경
function formatByDocumentType() {
	console.log($("#documentType").text().trim());
	if ($("#documentType").text().trim() === "선택") {
		$("#esDocumentType").val("");
		$(".approvalLine .title button").css("display", "none");
		$(".approvalLine__table").css("display", "none");
		$(".approvalLine .infoDiv").css("display", "block");
		$(".detailDiv").css("display", "block");
		$(".esTitle").css("display", "none");
		$(".mainBox").css("display", "none");
		$(".fileListBox").css("display", "none");
	} else if ($("#documentType").text().trim() === "지출 결의서") {
		$("#esDocumentType").val("지출 결의서");
		console.log("지출결의");
		basicForm();

		$(".spendingResolution__table").css("display", "block");
		$(".businessContact__table").css("display", "none");
		spendingResolutionTitle();
	} else if ($("#documentType").text().trim() === "업무 연락") {
		$("#esDocumentType").val("업무 연락");
		console.log("업무연락");
		basicForm();
		$(".titleInput").val("");
		$(".spendingResolution__table").css("display", "none");
		$(".businessContact__table").css("display", "block");
	}
}

// 문서 종류 선택시 기본 동작
function basicForm() {
	$(".approvalLine .title button").css("display", "inline-block");
	$(".approvalLine__table").css("display", "block");
	$(".approvalLine .infoDiv").css("display", "none");
	$(".detailDiv").css("display", "none");
	$(".esTitle").css("display", "block");
	$(".mainBox").css("display", "block");
	$(".fileListBox").css("display", "block");
}

// 지출 결의 타이틀 작성
function spendingResolutionTitle() {
	let dateInfo = new Date();
	let year = dateInfo.getFullYear();
	let month = dateInfo.getMonth() + 1;
	$(".titleInput").val(year + "년 " + month + "월 지출 결의서 - 개인");
}

// 회계기준 년도 동적 삽입
function createYear() {
	// 현재 연도 가져오기
	console.log("현재 년도");
	let currentYear = new Date().getFullYear();
	$("#year .typeName").html(currentYear);
	for (let i = 4; i >= 0; i--) {
		let pastYear = currentYear - i;
		let optionItem = $("<div>").attr("class", "option__item").html(pastYear);
		$("#year .selector__option").append(optionItem);
	}
}

// // 회계기준 월 동적 삽입
function createMonth() {
	// 현재 월 가져오기
	let currentMonth = new Date().getMonth() + 1;
	$("#month .typeName").html(currentMonth);
	for (let i = 1; i <= 12; i++) {
		let month = i;
		let optionItem = $("<div>").attr("class", "option__item").html(month);
		$("#month .selector__option").append(optionItem);
	}
}

$(document).ready(function() {
	$("#approvalLineBtn").on("click", function() {
		$(".approvalLineModal").modal({
			fadeDuration: 300,
			showClose: false
		});
		$("#approvalLineModal__cancle").on("click", $.modal.close);
	})

});