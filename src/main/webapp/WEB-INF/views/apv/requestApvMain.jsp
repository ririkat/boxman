<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="기안하기" name="tabTitle" />
	<jsp:param value="기안하기" name="pageTitle" />
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
									<td><button class="btn btn-primary" onclick="requestApv(${df['DFNO']})" >기안하기</button></td>
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
	<script>
	
	function requestApv(dfno){
  		var url="${path}/apv/requestApvEnroll.do?dfNo="+dfno;
  		var name="기안하기"
        window.open(url,name,"width=1000,height=800,left=600");
  	}
	</script>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />