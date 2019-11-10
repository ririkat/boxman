<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="수신결재함" name="tabTitle" />
	<jsp:param value="수신결재함" name="pageTitle" />
</jsp:include>

<section>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
         <!--  <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3" >
            
              <!-- <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6> -->
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped table-hover text-center" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>문서번호</th>
                      <th>문서분류</th>
                      <th>신청구분</th>
                      <th>기안제목</th>
                      <th>문서결재상태</th>
                      <th>시행상태</th>
                      <th>내결재상태</th>
                      <th>등록일</th>
                      <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="a" items="${list}">
						<tr>
							<td><c:out value='${a["APVNO"]}' /></td>
							<td><c:out value='${a["DCTITLE"]}' /></td>
							<td><c:out value='${a["APVTYPE"]}' /></td>
							<td><c:out value='${a["APVTITLE"]}' /></td>
							<td><c:out value='${a["APVSTATUS"]}' /></td>
							<td><c:out value='${a["APVESTATUS"]}' /></td>
							<td><c:out value='${a["APVASTATUS"]}' /></td>
							<td><c:out value='${a["APVENROLLDATE"]}' /></td>
							<td>
								<c:if test="${apvOne['APVAPRIOR'] eq apvOne['CURRTURN']}">
									<c:if test="${a['APVSTATUS'] eq '상신' and a['APVASTATUS'] eq '미결'}">
											<button type="button" class="btn btn-primary" onclick="apvOne(${a['APVNO']},${loginEmp['EMPNO']})" >결재하기</button>
									</c:if>
									<c:if test="${a['APVSTATUS'] eq '진행' and a['APVASTATUS'] eq '미결'}">
										<button type="button" class="btn btn-primary" onclick="apvOne(${a['APVNO']},${loginEmp['EMPNO']})" >결재하기</button>
									</c:if>
								</c:if>
							</td>
						</tr>
					</c:forEach>	
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      <!-- End of Main Content -->

</section>
   <script>
   			function apvOne(apvNo,empNo){
   		    	var url="${path}/apv/lookupApvAOne.do?apvNo="+apvNo+"&empNo="+empNo;
   		    	var name="기안열람"
   		        window.open(url,name,"width=1200,height=800,left=600");
   		    }
      	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>