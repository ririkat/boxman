<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
	<jsp:param value="Accounting" name="tabTitle"/> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<section>


<!-- export Excel -->
<%-- <script type="text/javascript" src="${path }/resources/js/tableExport.js</script>
<script type="text/javaScript">
   function doExportExcel() {
     $('#dataTable').tableExport({
         type:'excel',
         mso: {
           styles: ['background-color',
                    'color',
                    'font-family',
                    'font-size',
                    'font-weight',
                    'text-align']
         }
       }
     );
   }
</script>
 --%>

<a href="#" onclick="doExportExcel()">Export to Excel</a>
<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold  text-primary">손익 계산표</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered"  id="dataTable" width="100%" cellspacing="0">
                </tbody>
                  <tbody>
                    <tr>
                      <td>매출</td>
                      <td>₩1,100,000,000</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>매출 원가</td>
                      <td>(₩890,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><strong>총 수익</strong></td>
                      <td></td>
                      <td><strong>₩210,000,000</strong></td>
                    </tr>
                    <tr>
                      <td>경영비</td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>월세</td>
                      <td>(₩3,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>임금</td>
                      <td>(₩100,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>임금세</td>
                      <td>(₩10,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>보험</td>
                      <td>(₩5,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>법무 관련 수수료</td>
                      <td>(₩2,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 이자</td>
                      <td>(₩3,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 기타</td>
                      <td>(₩2,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 퇴직금</td>
                      <td>(₩6,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>출장비</td>
                      <td>(₩1,500,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 세금</td>
                      <td>(₩20,000,000)</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>총 경영비</td>
                      <td></td>
                      <td><strong>(₩152,500,000)</strong></td>
                    </tr>
                    <tr>
                      <td>순 이익</td>
                      <td></td>
                      <td><strong>₩57,500,000</strong></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
</section>


<!-- Core plugin JavaScript-->
  <script src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

