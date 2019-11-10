<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value="게시판상세"/>
</jsp:include>
<section id="content">
<div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">상세페이지</h4>
                    <p class="card-description"> 각 부서의 노동 정책 및 행정업무에 대한 자료를 보실 수 있습니다. </p>
                    <form class="forms-sample" id="devFrm" enctype="multipart/form-data" method="post">
                    <input type = "hidden" name = "categoryNo" value = "${nt.categoryNo }"/>
                   <c:forEach items="${list2 }" var="list2" varStatus="v">
                  	 <c:choose>							 
						<c:when test="${list2['NCHECK'] == '필수아님'}">
	                      <div class="col-md-6 grid-margin stretch-card form-check">
	                        <label class="form-check-label">
	                         <input type="checkbox" class="form-check-input" name="nCheck" value="필독체크">필독체크 <i class="input-helper"></i></label>
                   		  </div>
                   		</c:when>
                   		<c:when test="${list2['NCHECK'] != '필수아님'}">
	                      <div class="col-md-6 grid-margin stretch-card form-check">
	                        <label class="form-check-label">
	                         <input type="checkbox" class="form-check-input" name="nCheck" value="필독체크" checked>필독체크 <i class="input-helper"></i></label>
                   		  </div>
                   		</c:when>
                   	</c:choose>		  
                   </c:forEach>
                   <input type="hidden" name="nNo" value="${nt.NNo}">
                      <div class="form-group">
                        <label for="exampleInputName1">제목</label>
                        <input type="text" class="form-control" id="exampleInputName1" name="nName" value="${nt.NName}" >
                      </div>
                     <div class="form-group">
                        <label for="exampleInputPassword4">등록일</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" value="${nt.NDate}" readonly>
                      </div>                     
                      <div class="form-group">
                        <label for="exampleInputPassword4">작성자</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" value="${nt.empName }" readonly>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">전화번호</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" value="${nt.empPhone }" readonly>
                      </div>
                      <div class="form-group">
                        <label for="exampleTextarea1">내용</label>
                        <textarea class="form-control" id="exampleTextarea1" name="nText" rows="15" >${nt.NText}</textarea> 
                      </div>
                       <div class="form-group">
                      	<div class=" custom-file">
                      	<label for="upFile">다운로드</label>		                   
							<c:forEach items="${upNotice}" var="a" varStatus="vs">
					            <button type="button" 
					                    class="btn btn-outline-success btn-block"
					                    onclick="fileDownload('${a.upNoticeOrgName}','${a.upNoticeReName }');">
					                								첨부파일${vs.count} - ${a.upNoticeOrgName }
					            </button>
					        </c:forEach>
		                </div>
               		  </div>
              									
                      	<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="25">
										<table id="addTable" width="400" cellspacing="0"
											cellpadding="0" bgcolor="#FFFFFF" border="0">
											<tr>
												<br>
												<td>
												  <div class="form-group">
							                      <label for="upFile">첨부파일</label>
							                      	<div class=" custom-file">
									                    <input type="file" class="custom-file-input" name="upFile" id="addImg" value="">
									                    <label class="custom-file-label" for="addImg"></label>
									                </div>
							               		  </div>	
												 </td>																						  
												<td align="left"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<div style="margin:0 auto; width:fit-content;">
                           
                      <button type="button" class="btn btn-success mr-2" onclick="updateNotice();">수정</button>
                      <button type="button" class="btn btn-light" onclick="deleteNotice();">삭제</button>
                        </div>
                    </form>
                  </div>
                </div>
              </div>
</section>

<script>
		$(function(){
			$('[name=upFile]').on('change',function(){
				var fileName=this.files[0].name;
				$(this).next('.custom-file-label').html(fileName);
			})
		});
		//수정버튼 클릭시 목록화면으로
		function updateNotice(){
			$("#devFrm").attr("action","${path}/notice/updateNotice.do");
			$("#devFrm").submit();
		}
		
		//삭제버튼 클릭시 목록화면으로
		function deleteNotice(){
			$("#devFrm").attr("action","${path}/notice/deleteNotice.do");
			$("#devFrm").submit();
		}
		
		

           
		//첨부파일 다운로드
		function fileDownload(oName, rName)
		{
		   oName=encodeURIComponent(oName);
		   location.href="${path}/notice/filedownLoad.do?oName="+oName+"&rName="+rName;
		}
</script>
