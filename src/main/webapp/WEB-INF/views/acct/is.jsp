<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
	<jsp:param value="Accounting" name="tabTitle"/> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<!-- export Excel -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${path }/resources/moog/libs/FileSaver/FileSaver.min.js"></script>
<script type="text/javascript" src="${path }/resources/moog/libs/jsPDF/jspdf.min.js"></script>
<script type="text/javascript" src="${path }/resources/moog/bluebird.min.js"></script>
<script type="text/javascript" src="${path }/resources/moog/html2canvas.min.js"></script>
<script type="text/javascript" src="${path }/resources/moog/libs/jsPDF-AutoTable/jspdf.plugin.autotable.js"></script>
<script type="text/javascript" src="${path }/resources/moog/tableExport.js"></script>
<!-- Core plugin JavaScript-->
<script src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>

<script type="text/javaScript">

      function doExport() {
        $('#excelstyles').tableExport({
            type:'excel'
          }
        );
      }
      
      function pdfExport(){

    	    // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
    	    html2canvas(document.getElementById("pdfstyles"), {
    	        onrendered: function (canvas) {

    	            // 캔버스를 이미지로 변환
    	            var imgData = canvas.toDataURL('image/png');

    	            var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
    	            var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    	            var imgHeight = canvas.height * imgWidth / canvas.width;
    	            var heightLeft = imgHeight;

    	            var doc = new jsPDF('p', 'mm');
    	            var position = 0;

    	            // 첫 페이지 출력
    	            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
    	            heightLeft -= pageHeight;

    	            // 한 페이지 이상일 경우 루프 돌면서 출력
    	            while (heightLeft >= 20) {
    	                position = heightLeft - imgHeight;
    	                doc.addPage();
    	                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
    	                heightLeft -= pageHeight;
    	            }

    	            // 파일 저장
    	            doc.save('손익계산표.pdf');
    	        }
    	    });
    	}
</script>

<section>
	
     <nav class="navbar navbar-expand-lg ">
            <form class="form-inline ml-auto">
                <a id = "excelBtn" class="btn btn-outline-success pull-right" href="#" role="button" onclick="doExport()"><i class="fas fa-file-excel"></i> &nbsp Excel</a>
					&nbsp
					<a class="btn btn-outline-danger pull-right" href="#" role="button" onclick="pdfExport()"><i class="fas fa-file-pdf"></i> &nbsp PDF</a>
            </form>
    </nav>

<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
 -->
     <!-- DataTales Example -->
          <div class="card shadow mb-4" id = "pdfstyles">
            <div class="card-header py-3 nav">
              <h6 class="m-0 font-weight-bold  text-primary">손익  계산표</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              	<c:forEach items="${list }" var="list">
                <table class="table table-bordered pdfstyles"   id="excelstyles" width="100%" cellspacing="0">
                  <tbody>
                    <tr>
                      <td style="background-color">매출</td>
                      <td  id="revenue" ></td>
                      <td style="background-color"></td>
                    </tr>
                    <tr>
                      <td>매출 원가</td>
                      <td id="costOfRevenue"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><strong>총 수익</strong></td>
                      <td></td>
                      <td id = "netProfit"><strong>₩210,000,000</strong></td>
                    </tr>
                    <tr>
                      <td>경영비</td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>월세</td>
                      <td id="rent"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>임금</td>
                      <td id='salaries'></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>임금세</td>
                      <td id="saltax"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>보험</td>
                      <td id="insurance"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>법무 관련 수수료</td>
                      <td id="lawInterest"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 이자</td>
                      <td id="interest"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 기타</td>
                      <td id="otherInterest"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>퇴직금</td>
                      <td id="severance"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>출장비</td>
                      <td id="biztrip"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>지급 세금</td>
                      <td id="taxPay"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>총 경영비</td>
                      <td></td>
                      <td id="totalExpense"></td>
                    </tr>
                    <tr>
                      <td>순 이익</td>
                      <td></td>
                      <td id = "netincome"><strong></strong></td>
                    </tr>
                  </tbody>
                </table>
                </c:forEach>
              </div>
            </div>
          </div>

</section>

<script>
	
	/* $(function calc(){
		console.log($("#biztrip").val());
	})
	
	var obj = JSON.parse(data); */
	
	$(function(){
		$.ajax({
			url: "${path}/acct/result.do",
			success: function(data){
				// java -> javascript 로 데이터를 가지고 옴
				console.log(data);
				var list = JSON.parse(data);
				for(i=0; i<list[0].length; i++){
					console.log(list[0][i]);
				}
				
				$("#revenue").html("₩"+list[0].REVENUE);
				$("#costOfRevenue").html("(₩"+list[0].COSTREVENUE+")");
				
				var netProfit = list[0].REVENUE-list[0].COSTREVENUE;
				
				var rent = 3000000;
				var saltax = 3800000;
				var insurance = 5000000;
				var lawInterest = 2000000;
				var interest = 3000000;
				var otherInterest = 2000000;
				var taxPay = 20000000;
				
				var totalExpense = rent+saltax+insurance+lawInterest+interest+otherInterest+taxPay+list[0].SALARIES+list[0].BIZTRIP;
				var netincome = netProfit-totalExpense;
				
				$("#totalExpense").html("(₩"+totalExpense+")");
				
				if(netincome<0){
					$("#netincome").html("(₩"+Math.abs(netincome)+")");
				} else{
					$("#netincome").html("₩"+netincome);
				}
				
				$("#rent").html("(₩"+rent+")");
				$("#saltax").html("(₩"+saltax+")");
				$("#insurance").html("(₩"+insurance+")");
				$("#lawInterest").html("(₩"+lawInterest+")");
				$("#interest").html("(₩"+interest+")");
				$("#otherInterest").html("(₩"+otherInterest+")");
				$("#taxPay").html("(₩"+taxPay+")");
				$("#netProfit").html("(₩"+netProfit+")");
				$("#biztrip").html("(₩"+list[0].BIZTRIP+")");
				$("#severance").html("(₩"+list[0].SEVERANCE+")");
				$("#saltax").html("(₩"+list[0].SALTAX+")");
				$("#salaries").html("(₩"+list[0].SALARIES+")");
				
			} 
		})
		
	})
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>