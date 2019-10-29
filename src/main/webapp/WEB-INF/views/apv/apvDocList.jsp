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

				<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6> -->
				<div style="float: right;">
					<input type="button" class="btn btn-primary mr-2 pull-right"
						onclick="doc_enroll()" value="양식등록" />
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-stripped" id="dataTable" width="100%"
						cellspacing="0">
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
	<!-- /.container-fluid -->

	<!-- End of Main Content -->



</section>
<script>
      	function doc_enroll(){
      		var url="${path}/apv/apvDocEnroll.do";
      		var name="양식등록"
            window.open(url,name,"width=1000,height=800,left=600");
      	}
      	
      	function modifyContents(dfno){
      		var url="${path}/apv/apvDocModify.do?dfNo="+dfno;
      		var name="양식수정"
            window.open(url,name,"width=1000,height=800,left=600");
      	}
      	
      	function deleteContents(dfno){
      		location.href="${path}/apv/apvDocDelete.do?dfNo="+dfno;
      	}
      </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />