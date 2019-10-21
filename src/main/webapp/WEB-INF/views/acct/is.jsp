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
<!-- export Excel -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/tableExport.js"></script>
<script type="text/javascript" src="${path }/resources/js/FileSaver.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>



<script type="text/javaScript">
   function doExcel() {
     $('#excelstyles').tableExport({
         type:'excel',
         mso: {
           styles: ['background-color'
                    ]
         }
       }
     );
   }
</script>

<section>

<a href="#" onclick="doExcel()">Export to Excel</a>
<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
 -->
          <table id="excelstyles">
    <thead>
    <tr>
        <th style="font-family: arial; font-size: 18px; font-weight: bold">C1</th>
        <th style="font-family: arial; font-size: 18px; font-weight: bold">C2</th>
        <th style="font-family: arial; font-size: 18px; font-weight: bold">C3</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td style="background-color:red">A</td>
        <td style="background-color:green">B</td>
        <td style="background-color:blue">C</td>
    </tr>
    <tr>
        <td style="text-align:left">D</td>
        <td style="text-align:center">E</td>
        <td style="text-align:right">F</td>
    </tr>
    <tr>
        <td style="color:green">G</td>
        <td style="color:blue">H</td>
        <td style="color:red">I</td>
    </tr>
    <tr>
      <td style="lala:green">J</td>
      <td style="lala:blue">K</td>
      <td style="lala:red">L</td>
  </tr>
    </tbody>
</table>
</section>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

