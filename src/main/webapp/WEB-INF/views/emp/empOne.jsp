<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="BoxMan" name="tabTitle" />
	<jsp:param value='${emp["EMPNAME"]}' name="pageTitle" />
</jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
	<div class="col-12 grid-margin">
		<div class="card">
			<div class="card-body">
				<form class="form-sample" id="empUpFrm" method="post"
					enctype="multipart/form-data">
					<input type="hidden" value='${emp["EMPNO"]}' name="empNo" id="empNo"/>
					<p class="card-description">Personal info</p>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">이름</label>
								<div class="col-sm-9">
									<input type="text" class="form-control noFalse" name="empName"
										value='${emp["EMPNAME"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">부서</label>
								<div class="col-sm-9">
									<input type="text" class="form-control selectBox" name="deptName"
										value='${dept["DEPTNAME"]}' readonly> 
									<input type="hidden" name="deptNo" class="selectBox" value='${dept["DEPTNO"] }'/>
									<select
										name="deptNo" id="deptNo" class="form-control"
										style="display: none;">
										<option value='${dept["DEPTNO"]}'><c:out
													value='${dept["DEPTNAME"]}' /></option>
										<c:forEach items="${deptList}" var="d">
											<c:set var="listNo" value="${d['DEPTNO']}"/>
											<c:if test='${dept["DEPTNO"] ne listNo}'>
												<option value="<c:out value='${d["DEPTNO"]}'/>">
												<c:out value='${d["DEPTNAME"]}' /></option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">아이디</label>
								<div class="col-sm-9">
									<div id="userId-container">
										<input type="text" class="form-control noFalse"
											placeholder="아이디 (4글자이상)" name="empId"
											value='${emp["EMPID"]}' id="empId" readonly>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">직급</label>
								<div class="col-sm-9">
									<input type="text" class="form-control selectBox"
										value='${job["JOBNAME"] }' readonly /> 
									<input type="hidden" value='${job["JOBNO"] }' class="selectBox"/>
									<select name="jobNo"
										id="jobNo" class="form-control" style="display: none;">
										<option value='${job["JOBNO"]}'><c:out value='${job["JOBNAME"]}' /></option>
										<c:forEach items="${jobList}" var="j">
											<c:if test='${job["JOBNO"] ne j["JOBNO"]}'>
												<option value="<c:out value='${j["JOBNO"]}'/>">
													<c:out value='${j["JOBNAME"]}' />
												</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">연봉</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="empSal"
										value='${emp["EMPSAL"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">은행</label>
								<div class="col-sm-9">
									<input type="text" class="form-control selectBox" name="empSal"
										value='${emp["EMPBANK"]}' readonly> 
									<select
										name="empBank" id="empBank" class="form-control"
										style="display: none;">
										<option value="${emp['EMPBANK']}"><c:out value="${emp['EMPBANK']}"/></option>
										<option value="국민은행">국민은행</option>
										<option value="농협은행">농협은행</option>
										<option value="새마을금고">새마을금고</option>
										<option value="신한은행">신한은행</option>
										<option value="우리은행">우리은행</option>
										<option value="카카오뱅크">카카오뱅크</option>
										<option value="하나은행">하나은행</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">주민등록번호</label>
								<div class="col-sm-9">
									<input type="text" class="form-control noFalse" name="empSSN"
										value='${emp["EMPSSN"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">계좌번호</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empBankNum"
										value='${emp["EMPBANKNUM"]}' readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">성별</label>
								<div class="col-sm-9">
									<input type="text" class="form-control noFalse" name="empGender"
										value='${emp["EMPGENDER"]}' readonly> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">전화번호</label>
								<div class="col-sm-9" style="">
									<input type="text" class="form-control" name="empPhone"
										value='${emp["EMPPHONE"]}' readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">이메일</label>
								<div class="col-sm-9" style="">
									<input type="email" class="form-control" name="empEmail"
										value='${emp["EMPEMAIL"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">주소</label>
								<div class="col-sm-9">
									<input type="text" id="sample6_postcode" style="width:200px;display:inline;"
										class="form-control" value='${addr[0]}' readonly> 
									<input type="button" class="btn btn-success mr-2" onclick="sample6_execDaumPostcode()" 
										value="우편번호 찾기" style="float:right; display:none;" id="btnPost"><br>
									<input
										type="text" class="form-control" id="sample6_address"
										value='${addr[1]}' readonly> 
									<input
										type="text" class="form-control" id="sample6_detailAddress"
										style="display:inline;" value='${addr[2]}' readonly> 
									<input
										type="text" class="form-control" id="sample6_extraAddress"
										style="display:inline;" value='${addr[3]}' readonly>
									<input type="hidden" name="empAddr" id="empAddr"/>
								</div>
							</div>
						</div>
					</div>
					<c:forEach var="f" items="${list}">
						<div class="row">
							<c:if test="${f.efcName eq '증명사진'}">
							<input type="hidden" value='${f.efNo}' name="proNo"/>
							<input type="hidden" value='${f.efReName}' name="proImg"/>
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">사원사진</label>
									<div class="col-sm-9">
											<img src="${path}/resources/upload/emp/${f.efReName}" style="width:200px; height:auto;" id="proImg"/>
									</div>
									<div class="custom-file divFile" style="display:none;">
					                    <input type="file" class="custom-file-input" name="proImg" id="upFile1">
					                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
					                </div>
								</div>
							</div>
							</c:if>
							<c:if test="${f.efcName eq '결재도장'}">
							<input type="hidden" value='${f.efNo}' name="stampNo"/>
							<input type="hidden" value='${f.efReName}' name="stampImg"/>
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">결재도장</label>
									<div class="col-sm-9">
											<img src="${path}/resources/upload/emp/${f.efReName}" style="width:200px; height:auto;" id="stampImg"/>
										
									</div>
									<div class="custom-file divFile" style="display:none;">
					                    <input type="file" class="custom-file-input" name="stampImg" id="upFile3">
					                    <label class="custom-file-label" for="upFile3">파일을 선택하세요</label>
					                </div>
								</div>
							</div>
							</c:if>
						</div>
						<%-- <div class="row">
							<c:if test="${f.efcName eq '자격증'}">
							<input type="hidden" value='${f.efNo}' name="licenNo"/>
							<input type="hidden" value='${f.efReName}' name="licenReName"/>
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">자격증사진 </label>
									<div class="col-sm-9">
										<img src="${path}/resources/upload/emp/${f.efReName}" style="width:200px; height:auto;"/>
									</div>
									<div class="divFile" style="display:none;">
										<button type="button" class="btn btn-light btn-icon-split" style="position:absolute; right:0;" id="addFile">
						                       <span class="text">추가</span>
						                  </button>
						               <div class="custom-file">
						               		<div id="fileBox">
							                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
							                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
						                    </div>
						                </div>
					                </div>
								</div>
							</div>
							</c:if>
							<div class="col-md-6">
								<div class="form-group row" id="setHeight" style="height: 40px;">
								</div>
							</div>
						</div> --%>
					</c:forEach>
					<div style="margin: 0 auto; width: fit-content;">
						<input type="button" id="updateEmp" class="btn btn-success mr-2"
							value="정보수정" style="width: 150px;">
						<input type="button" id="updatePwEmp" class="btn btn-success mr-2"
							value="비밀번호 변경" style="width: 150px;">
					</div>
				</form>
			</div>
			<form name="updateFrm" action="${path }/emp/selectEmpOne.do">
				<input type="hidden" value='${emp["EMPNO"]}' name="empNo" />
			</form>
			<form name="updatePwFrm">
				<input type="hidden" value='${emp["EMPNO"]}' name="empNo" />
			</form>
		</div>
	</div>
</section>
<script>
	//수정버튼 누를때
	$(function(){
		$('#updateEmp').click(function(){
			if($('#updateEmp').val()=="정보수정") {
				$('input').attr("readonly", false);
				$('input.noFalse').attr("readonly", true);
				$('#btnPost').show();
				$('select').show();
				$('input.selectBox').attr("disabled",true);
				$('input.selectBox').hide();	
				$('.divFile').show();
				$('#updateEmp').val("수정완료");
			} else {
				if(confirm('수정하시겠습니까?')) {
					var empAddr = $('#sample6_postcode').val();
				    empAddr += "/" + $('#sample6_address').val();
				    empAddr += "/" + $('#sample6_detailAddress').val();
				    empAddr += "/" + $('#sample6_extraAddress').val();
				    $('#empAddr').val(empAddr);
					$('#empUpFrm').attr("action","${path}/emp/updateEmpEnd.do");
					$('#empUpFrm').submit();
				}
			}
		});
		
		//비밀번호 변경
		$('#updatePwEmp').click(function() {
			/* var empNo = $('#empNo').val().trim();
			console.log(empNo); */
			console.log('');
			var url = '${path}/emp/updatePassword.do';
			var status = "width=600, height=400, resizable=no, status=no, toolbars=no, menubar=no";
			var title="비밀번호 변경";
			var popUp = open("", title, status);
			window.name="parentWin"; 
			updatePwFrm.target = title;
			updatePwFrm.action=url;
			updatePwFrm.method="post";
			updatePwFrm.submit();
		});
	});
   
	var setHeight = $('#setHeight').height();
	//파일등록시 
	$(function(){
		/* $(document).on("change",$('[name=upFile]'), function(event){
			var fileName=this.files[0].name;
			$(this).next('.custom-file-label').html(fileName);
		}); */
		$('[name=proImg]').on('change', function(event){
			var fileName=this.files[0].name;
			var reader = new FileReader();
			$(this).next('.custom-file-label').html(fileName);
			reader.onload = function(e) {
				$('#proImg').attr("src",e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		});
		$('[name=stampImg]').on('change', function(event){
			var fileName=this.files[0].name;
			var reader = new FileReader();
			$(this).next('.custom-file-label').html(fileName);
			reader.onload = function(e) {
				$('#stampImg').attr("src",e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		});
	});
	var count = 4;
	
	//파일추가
	/* $(function(){
		$('#addFile').click(function(){
			setHeight = setHeight + 80;
			$('#setHeight').css("height",setHeight + "px");
			var addWrap = '<div class="custom-file" style="height:80px;">'; 
    		addWrap += '<input type="file" class="custom-file-input" name="upFile" id="upFile' + count + '"'
    		addWrap += '>';
    		addWrap += '<label class="custom-file-label" for="upFile' + count + '"';
    		addWrap += '>';
    		addWrap += "파일을 선택하세요";
    		addWrap += "</label>";
	        addWrap += '<input type="button" name="removeFile" class="btn" id="btnRemove" value="삭제">';
	        addWrap += '</div>'; 
            $(this).next().after(addWrap);
            count++;
      }); 
   }); */
	

	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />