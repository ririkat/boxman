<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="거래처 수정" name="tabTitle"/> 
</jsp:include>

<style>
.form-control {
    display: block;
    width: 500px;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #6e707e;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #d1d3e2;
    border-radius: .35rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.connectionName {
	display: inline-block;
}
#postcode1, #postcode2, #addrBtn, #address, #address_etc {
	margin-bottom: 5px;
	display: inline-block;
}
.trf {
	margin-top: 5px;
}
</style>

<section>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">거래처 수정</h6>
        </div>
		<div class="card-body">
			<br/>
			
			<form id="modifyConnection" name="modifyConnection" class="forms-sample" method="post" onsubmit="return modify_validate();">
				<input type="hidden" name="conCode" value="${conn['CONCODE']}">
				<input type="hidden" name="trfCode" value="${transferInfo['TRFCODE']}">
				<div class="form-group">
					<label>거래처 구분</label>
					<div class="col-sm-4">
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conCateg" id="conCategory1" value="매입" disabled> 매입처 <i class="input-helper"></i>
							</label>
						</div>
					
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conCateg" id="conCategory2" value="매출" disabled> 판매처 <i class="input-helper"></i>
							</label>
						</div>
					
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conCateg" id="conCategory2" value="유통" disabled> 유통업체 <i class="input-helper"></i>
							</label>
						</div>
					</div>
				</div>
				<br/>
				
				<div class="form-group">
					<label>* 거래처 상호(이름)</label>
					<div id="connectionName">
						<input type="text" class="form-control connectionName" id="conName" name="conName" value="${conn['CONNAME'] }" disabled/>
					</div>
				</div>
				<br/>
				
				<div class="form-group">
					<label>* 대표자명</label>
					<input type="text" class="form-control" id="conRepName" name="conRepName" value="${conn['CONREPNAME'] }" required />
				</div>
				<br/>
				
				<div class="form-group">
					<label>* 전화번호</label>
					<input type="tel" class="form-control" id="conTel" name="conTel" value="${conn['CONTEL'] }" required />
				</div>
				<br/>
				
				<div class="form-group">
					<label>핸드폰번호</label>
					<input type="tel" class="form-control" id="conPhone" name="conPhone" value="${conn['CONPHONE'] }"/>
				</div>
				<br/>
				
				<div class="form-group">
					<label>사용구분</label>
					<div class="col-sm-4">
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conUseCk" id="conUseCk1" value="Y"> 사용 <i class="input-helper"></i>
							</label>
						</div>
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conUseCk" id="conUseCk2" value="N"> 사용안함 <i class="input-helper"></i>
							</label>
						</div>
					</div>
				</div>
				<br/>

				<div class="form-group">
					<label>이체정보</label>
					<div class="col-sm-4">
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conTransCk" id="conTransCk1" value="Y"> 입력 <i class="input-helper"></i>
							</label>
						</div>
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="conTransCk" id="conTransCk2" value="N"> 나중에 <i class="input-helper"></i>
							</label>
						</div>
						<br>
						<div class="form-group">
							<label>은행명<input type="text" class="form-control trf" id="trfBkName" name="trfBkName" value="${transferInfo['TRFBKNAME']}" /></label>
							<label>계좌번호<input type="text" class="form-control trf" id="trfAccount" name="trfAccount" value="${transferInfo['TRFACCOUNT']}" /></label>
							<label>예금주명<input type="text" class="form-control trf" id="trfAccHolder" name="trfAccHolder" value="${transferInfo['TRFACCHOLDER']}" /></label>
							<label>비고<input type="text" class="form-control trf" id="trfNote" name="trfNote" value="${transferInfo['TRFNOTE']}" /></label>
						</div>
					</div>
				</div>
				<br/>

				<div class="form-group">			
					<label>* 주소</label>
					<br/>
					<input type="text" class="form-control" id="postcode1" name="postcode1" style="width:70px;" readonly/>
					-
					<input type="text" class="form-control" id="postcode2" name="postcode2" style="width:70px;" readonly/>
					&nbsp;&nbsp;
					<input type="button" class="btn btn-primary btn-fw connectionName" id="addrBtn" onClick="openDaumZipAddress();" value="주소검색" />
					<br/>
					<input type="text" class="form-control" id="address" name="address" style="width:300px" readonly/>
					<input type="text" class="form-control" id="address_etc" name="address_etc" style="width:200px" placeholder="상세주소"/>
					<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						//다음 주소 API
						function openDaumZipAddress() {
							new daum.Postcode({
								oncomplete:function(data) {
									jQuery("#postcode1").val(data.postcode1);
									jQuery("#postcode2").val(data.postcode2);
									jQuery("#address").val(data.address);
									jQuery("#address_etc").focus();
									console.log(data);
								}
							}).open();
						}
					</script>
				</div>
				<br/>
				<button type="button" class="btn btn-success mr-2" onclick="submitConn();">수정</button>
				<button type="button" class="btn btn-light" onclick="deleteConn();">삭제</button>
			</form>
		</div>
	</div>

	<form name="checkconNameDuplFrm" method="post">
		<input type="hidden" name="conCateg_" />
		<input type="hidden" name="mCategName_" />
		<input type="hidden" name="conName_" />
	</form>
</section>

<script>
$("input:radio[name=conTransCk]").click(function() {
    if($("input[name=conTransCk]:checked").val() == "N") {
        $("input[name=trfBkName]").attr("disabled",true);
        $("input[name=trfAccount]").attr("disabled",true);
        $("input[name=trfAccHolder]").attr("disabled",true);
        $("input[name=trfNote]").attr("disabled",true);

		$("input[name=trfBkName]").attr("required",false);
		$("input[name=trfAccount]").attr("required",false);
		$("input[name=trfAccHolder]").attr("required",false);
    }
    else {
        $("input[name=trfBkName]").attr("disabled",false);
        $("input[name=trfAccount]").attr("disabled",false);
        $("input[name=trfAccHolder]").attr("disabled",false);
        $("input[name=trfNote]").attr("disabled",false);

		$("input[name=trfBkName]").attr("required",true);
		$("input[name=trfAccount]").attr("required",true);
		$("input[name=trfAccHolder]").attr("required",true);
    }
});


$(document).ready(function() {
	if("${conn['CONCATEG']}"=="매입") {
		$("#conCategory1").attr("checked",true);
	}
	else if("${conn['CONCATEG']}"=="매출") {
		$("#conCategory2").attr("checked",true);
	}
	else if("${conn['CONCATEG']}"=="유통") {
		$("#conCategory3").attr("checked",true);
	}
	
	if("${conn['CONUSECK']}".trim()=="Y") {
		$("#conUseCk1").attr("checked",true);
	}
	else if("${conn['CONUSECK']}".trim()=="N") {
		$("#conUseCk2").attr("checked",true);
	}
	
	if("${conn['CONTRANSCK']}".trim()=="Y") {
		$("#conTransCk1").attr("checked",true);
		
        $("input[name=trfBkName]").attr("disabled",false);
        $("input[name=trfAccount]").attr("disabled",false);
        $("input[name=trfAccHolder]").attr("disabled",false);
        $("input[name=trfNote]").attr("disabled",false);

		$("input[name=trfBkName]").attr("required",true);
		$("input[name=trfAccount]").attr("required",true);
		$("input[name=trfAccHolder]").attr("required",true);
	}
	else if("${conn['CONTRANSCK']}".trim()=="N") {
		$("#conTransCk2").attr("checked",true);

        $("input[name=trfBkName]").attr("disabled",true);
        $("input[name=trfAccount]").attr("disabled",true);
        $("input[name=trfAccHolder]").attr("disabled",true);
        $("input[name=trfNote]").attr("disabled",true);

		$("input[name=trfBkName]").attr("required",false);
		$("input[name=trfAccount]").attr("required",false);
		$("input[name=trfAccHolder]").attr("required",false);
	}
	
	
	var post1 = "${conn['CONADDR']}".substring(0,3);
	var post2 = "${conn['CONADDR']}".substring(4,7);
	$("#postcode1").attr("value",post1);
	$("#postcode2").attr("value",post2);
	var fullAddr = "${conn['CONADDR']}".substring(8);
	var addr = fullAddr.split('(');
	var addr1 = "";
	var addr2 = "";
	addr1 = addr[0].substring(addr[0].length-1,0);
	$("#address").attr("value",addr1);
	addr2 = addr[1].substring(addr[1].length-1,0);
	$("#address_etc").attr("value",addr2);
});


function modify_validate() {
	var regExpRepName = /^[가-힣a-zA-Z]+$/;
	var regExpConTel = /^[0-9]{8,10}$/;
	var regExpConPhone = /^01([0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/;
	
	var regExpBankName = /^[가-힣a-zA-Z]+$/;
	var regExpAccount = /[0-9]/;
	
	if(!regExpRepName.test(modifyConnection.conRepName.value)) {
		conRepName.focus();
		alert("대표자명은 한글과 영어만 입력 가능합니다.");
		return false;
	}
	if(!regExpConTel.test(modifyConnection.conTel.value)) {
		conTel.focus();
		alert("전화번호는 8~10자 내의 숫자만 가능합니다.");
		return false;
	}
	if(($('#conPhone').val() != "") && (!regExpConPhone.test(modifyConnection.conPhone.value))) {
		conPhone.focus();
		alert("핸드폰번호는 11자 내의 숫자만 가능합니다.");
		return false;
	}
	console.log($("input[name=conTransCk]:checked"));
	if($("input[name=conTransCk]:checked").val() == "Y") {
		if(!regExpBankName.test(modifyConnection.trfBkName.value)) {
			trfBkName.focus();
			alert("은행명은 한글과 영어만 입력 가능합니다.");
			return false;
		}
		if(!regExpAccount.test(modifyConnection.trfAccount.value)) {
			trfAccount.focus();
			alert("계좌번호는 숫자만 입력 가능합니다.");
			return false;
		}
		if(!regExpBankName.test(modifyConnection.trfAccHolder.value)) {
			trfAccHolder.focus();
			alert("예금주명은 한글과 영어만 입력 가능합니다.");
			return false;
		}
	}
 	if(modifyConnection.postcode1.value == "") {
		postcode1.focus();
		alert("주소검색을 통해 우편번호 및 주소를 입력하세요.")
		return false;
	} 
	return true;
}

function submitConn(){
	$("#modifyConnection").attr("action","${path }/connection/modifyConnEnd.do");
	$("#modifyConnection").submit();
}

function deleteConn(){
	if(confirm("거래처 삭제시 등록된 이체정보와\n연결된 판매정보 및 구매정보가 전부 삭제됩니다.\n정말 삭제하시겠습니까?")) {
		location.href="${path}/connection/deleteConn.do?conCode=${conn['CONCODE']}";
	}
}
</script>













