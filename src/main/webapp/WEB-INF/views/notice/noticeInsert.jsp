<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
div#demo-container {
	width: 40%;
	padding: 15px;
	margin: 0 auto;
	border: 1px solid lightgray;
	border-radius: 10px;
}
</style>
<section id="content">
<form id="devFrm" enctype="multipart/form-data" method="post">
<div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">게시판</h4>
                    <p class="card-description"> 게시글 작성 </p>
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="exampleInputName1">제목</label>
                        <input type="text" class="form-control" id="exampleInputName1" name="nName" placeholder="">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">부서</label>
                         <select name = "deptNo" id = "exampleInputEmail3" class="form-control">
		                  <option value = "0">해당 부서를 선택하세요</option>
		                  <c:forEach items="${deptList}" var="dept">
		                     <option value = "<c:out value='${dept["DEPTNAME"]}'/>"><c:out value='${dept["DEPTNAME"]}'/></option>
		                  </c:forEach>
		               </select>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">작성자</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" placeholder="">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">전화번호</label>
                        <input type="number" class="form-control" id="exampleInputPassword4" placeholder="">
                      </div>                 
                     
                      <div class="form-group">
                        <label for="exampleTextarea1">내용</label>
                        <textarea class="form-control" id="exampleTextarea1" name="nText" rows="2"></textarea> 
                      </div>
                      
                      <!-- <div class="form-group">
                      <label for="upFile">첨부파일</label>
                      	<div class=" custom-file">
		                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
		                    <label class="custom-file-label" for="upFile"></label>
		                </div>
               		  </div>	 -->
                      <button name="addButton" type="button" value="추가" class="btn btn-light btn-icon-split" 
                      							style=" cursor: hand; position:absolute; right:0;" id="addFile" onClick="insRow()">
				             <span class="text">추가</span>
				      </button>										
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
									                    <input type="file" class="custom-file-input" name="upFile" id="addImg">
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
							
                      <button type="button" onclick="insertNotice();" class="btn btn-success mr-2">등록</button>
                      <button class="btn btn-light">취소</button>
                    </form>
                  </div>
                </div>
              </div>
	</form>
</section>

<script>
	//등록 버튼 클릭시 리스트화면으로
	function insertNotice(){
		$("#devFrm").attr("action","${path }/notice/insertNotice.do");
		$("#devFrm").submit();
	}
	
        //확장자, 정규식 검사
        var count = 1;
        $(document).on("change","input[name='addImg"+count+"']",function(event) {
           var ext = $(this).val().split('.').pop().toLowerCase();
           var fileSize = (this).files[0].size;
           var maxSize = 1024*1024*1024;
           
           if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
              alert("등록할 수 없는 확장자입니다.");
              $(this).val("");
              return;
           } 
           
           if(fileSize > maxSize) {
              alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
              $(this).val("");
              return;
           }
        });
	
	$(function(){
		$('[name=upFile]').on('change',function(){
			console.log();
			var fileName=this.files[0].name;
			$(this).next('.custom-file-label').html(fileName);
		})
	});
	
	
	
	       var oTbl;
               //Row 추가
               function insRow() {
                 oTbl = document.getElementById("addTable");
                 var oRow = oTbl.insertRow();
                 oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
                 var oCell = oRow.insertCell();

               
                 //삽입될 Form Tag         
                 var frmTag = "<div class=' custom-file'>";
                 frmTag += "<input type='file' class='custom-file-input' name='upFile' id='addImg'> ";
                 frmTag += "<label class='custom-file-label' for='addImg'></label>";
                 frmTag += "</div>";
                 frmTag += "<input type=button value='삭제' class='btn btn-light btn-icon-split' onClick='removeRow()' style='cursor:hand'>";
                 oCell.innerHTML = frmTag;
               }
               //Row 삭제
               function removeRow() {
                 oTbl.deleteRow(oTbl.clickedRowIndex);
               }

               function frmCheck()
               {
                 var frm = document.form;
                 
                 for( var i = 0; i <= frm.elements.length - 1; i++ ){
                    if( frm.elements[i].name == "addImg" )
                    {
                        if( !frm.elements[i].value ){
                                frm.elements[i].focus();
                   return;
                         }
                     }
                  }
                }
</script>