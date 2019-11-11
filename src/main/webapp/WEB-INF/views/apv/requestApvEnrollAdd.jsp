<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="기안하기" name="tabTitle"/> 
   <jsp:param value="기안하기" name="pageTitle"/>
</jsp:include>
	<section>
		<div class="container">
			<button type="button" class="btn btn-primary" onclick="enrollApvl();">결재라인등록</button>
			<h2 class="title font-weight-bold text-primary">${dfOne["DFTITLE"]}</h2>

			<form id="apvDocModiForm" class="form-sample" method="post" action="">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-boarded">
								<tr>
									<th>기안제목</th>
									<td><input type="text" id="apvTitle" name="apvTitle"
										width="100%" /></td>
								</tr>
								<tr>
									<th>신청구분</th>
									<td><select id="apvType" name="apvType">
											<option value="일반">일반</option>
											<option value="품의">품의(비용청구)</option>
											<option value="휴가">휴가</option>
											<option value="출장">출장</option>
											<option value="근태">근태</option>
									</select></td>
								</tr>
								<tr>
									<th>문서분류</th>
									<td><input type="text" id="dcTitle" name="dcTitle"
										value="${dfOne['DCTITLE']}" readonly /> <input type="hidden"
										name="empNo" id="empNo" value="${loginEmp['EMPNO']}" />
										<input type="hidden"
										name="dcNo" id="dcNo" value="${dfOne['DCNO']}" /></td>
								</tr>
								<tr>
									<th colspan="2">결재폼</th>
								</tr>
								<tr>
									<td colspan="2">
										<div id="id01" class="text-center">
											${dfOne["DFHEADFORM"]}</div>
									</td>
								</tr>
								<tr>
									<th colspan="2">본문내용</th>
								</tr>
								<tr>
									<td colspan="2"><textarea id="dfContentForm"
											name="dfContentForm" rows="10" cols="100">${dfOne['DFCONTENTFORM']}</textarea></td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td><textarea id="moreInfo"
											name="moreInfo" rows="10" cols="100"></textarea></td>
								</tr>
							</table>

						</div>
					</div>
				</div>
				<button type="button" class="btn btn-primary" style="width: 100%" onclick="submitRequestApv();">기안하기</button>
			</form>
		</div>

		<script>
				var oEditors = [];
				$(function() {

					nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "dfContentForm",
						sSkinURI : "${path }/resources/se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});

				});
				
				function enrollApvl(){
					var url="${path}/apv/requestApvLineEnroll.do";
		      		var name="결재라인등록"
		            window.open(url,name,"width=1000,height=800,left=600");
				}
				
				function returnApvLA(value,idx){
					var inputApvlA=$('<input>');
					inputApvlA.val(value);
					inputApvlA.attr({"id":"apvLA"+idx,"type":"hidden","name":"apvLA"});
					
					$('#apvDocModiForm').append(inputApvlA);
				}
				function returnApvLE(value){
					var inputApvlE=$('<input>');
					inputApvlE.val(value);
					inputApvlE.attr({"id":"apvLE","type":"hidden","name":"apvLE"});
					
					$('#apvDocModiForm').append(inputApvlE);
				}
				function returnApvLR(value,idx){
					var inputApvlR=$('<input>');
					inputApvlR.val(value);
					inputApvlR.attr({"id":"apvLR"+idx,"type":"hidden","name":"apvLR"});
					
					$('#apvDocModiForm').append(inputApvlR);
				}
				
				function submitRequestApv(){
					var formContents = $('#apvDocModiForm').serializeObject();
					
					var headContent=$('#id01').html().trim();
					formContents["headContent"]=headContent;
					
					$.ajax({
						url:"${path}/apv/requestApvEnrollEnd.do",
						type : "post",
						data : JSON.stringify(formContents),
						contentType: "application/json",
						success : function(data) {
							if(data>0){
								alert("기안성공");
								location.href="${path}/apv/sendApv.do?loginNo=${loginEmp.EMPNO}";
							}else{
								alert("기안실패");
							}
						}
					});
				}
				
				$.fn.serializeObject = function() {

					  var result = {}
					  var extend = function(i, element) {
					    var node = result[element.name]
					    if ("undefined" !== typeof node && node !== null) {
					      if ($.isArray(node)) {
					        node.push(element.value)
					      } else {
					        result[element.name] = [node, element.value]
					      }
					    } else {
					      result[element.name] = element.value
					    }
					  }

					  $.each(this.serializeArray(), extend)
					  return result
					}

				
				</script>
	</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
