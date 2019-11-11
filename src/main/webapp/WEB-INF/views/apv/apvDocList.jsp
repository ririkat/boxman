<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="결재양식등록" name="tabTitle" />
	<jsp:param value="결재양식관리" name="pageTitle" />
</jsp:include>

<section>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<!--  <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
 -->
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
			
				<form id="searchFrm">
					<div class="dataTables_length" id="dataTable_length">
						<label>Search: 
						<select name="type" id="dfSearch"
							class="form-control form-control-sm">
								<option value="dcTitle">문서분류명</option>
								<option value="dfTitle">문서양식명</option>
						</select> 
						<input type="search" class="form-control form-control-sm"
							placeholder="" aria-controls="dataTable" name="data">
						</label>
						<button onclick="fn_search();"
							class="btn btn-primary mr-2">
							<span class="text">검색</span>
						</button>
					</div>
				</form>

				<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6> -->
				<div style="float: right;">
					<input type="button" class="btn btn-primary mr-2 pull-right"
						onclick="docHead_enroll()" value="결재폼등록" />
					<input type="button" class="btn btn-primary mr-2 pull-right"
						onclick="docContent_enroll()" value="본문양식등록" />
					<input type="button" class="btn btn-primary mr-2 pull-right"
						onclick="doc_enroll()" value="양식등록" />
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-stripped" id="dataTable" width="100%"
						cellspacing="0" id="myTable">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서분류</th>
								<th>양식명</th>
								<th>관리</th>
							</tr>
						</thead>
						<tfoot>

						</tfoot>
						<tbody>
							<c:forEach var="df" items="${list}">
								<tr>
									<td><c:out value='${df["DFNO"]}' /></td>
									<td><c:out value='${df["DCTITLE"]}' /></td>
									<td><c:out value='${df["DFTITLE"]}' /></td>
									<td><button class="btn btn-primary" onclick="modifyContents(${df['DFNO']})" >수정</button>
									<button class="btn btn-primary" onclick="deleteContents(${df['DFNO']})" >삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		${pageBar }

	</div>


</section>
<script>
		//검색
		function fn_search() {
			$("#searchFrm").attr("action","${path}/apv/searchDocForm.do");
			$("#searchFrm").submit();
		}
		//테이블 정렬
		$(function() {
		  $("#myTable").tablesorter();
		});
		
      	function doc_enroll(){
      		var url="${path}/apv/apvDocEnroll.do";
      		var name="양식등록"
            window.open(url,name,"width=1200,height=800,left=600");
      	}
      	
      	function modifyContents(dfno){
      		var url="${path}/apv/apvDocModify.do?dfNo="+dfno;
      		var name="양식수정"
            window.open(url,name,"width=1200,height=800,left=600");
      	}
      	
      	function deleteContents(dfno){
      		if(confirm("삭제하시겠습니까?")){
      			location.href="${path}/apv/apvDocDelete.do?dfNo="+dfno;
      		}
      	}
      	
      	function docHead_enroll(){
      		var url="${path}/apv/apvDocHeadEnroll.do";
      		var name="결재폼등록"
            window.open(url,name,"width=1200,height=800,left=600");
      	}
      	
      	function docContent_enroll(){
      		var url="${path}/apv/apvDocContentEnroll.do";
      		var name="결재본문양식등록"
            window.open(url,name,"width=1200,height=800,left=600");
      	}
      </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />