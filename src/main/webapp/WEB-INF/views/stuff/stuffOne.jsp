<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="선덕별리현빈" name="tabTitle"/> 
   <jsp:param value="기호기오무관" name="pageTitle"/>
</jsp:include>
<style>
.form-control , .input-group , .form-group{
	width : 700px;
}

#stuffMain , #stuffSub , .custom-file , #conName{
	width : 690px;
}

</style>
<section>
<div class = "card shadow mb-4">
<form id = "stuffFrm" enctype="multipart/form-data" method="post" action="${path}/stuff/stuffUpdateEnd.do" onsubmit="return checkValue();">
	<div class="card-body">
		<h4 class="card-title">물품 상세</h4>
		<input type = "hidden" name = "stuffNo" value = "${stuff.stuffNo }"/>
		<p class="card-description" style = "color : red">수정을 원하시면 값을 다시 입력해주세요.</p>
			<div>
				<label for="exampleInputName1">물품 이미지</label>
			</div>
			<div class="form-group">
				<img class="img-fluid rounded" src="${path}/resources/upload/stuff/${stuffUpload.imgRename}" style = "width : 500px; height : 500px; border: 0.5px solid #d1d3e2;"/>
			</div>
			<div>
				<label for="exampleInputName1">첨부파일</label>
			</div>
			<div class="form-group">
            <button type="button" 
                    class="btn btn-outline-success btn-block"
                    onclick="fileDownload('${stuffUpload.imgOriname}','${stuffUpload.imgRename }');">
                    ${stuffUpload.imgOriname}
            </button>

			</div>
			<div class="form-group">
				<label for="exampleInputName1">물품 이름</label> <input type="text"
					class="form-control" id="stuffName" value="${stuff.stuffName }"
					name="stuffName" required="required">
					<div id="stuffNameCheck" class="rg-checkMsg card-title"></div>
			</div>
			<div>
				<label for="exampleInputName1">가격</label>
			</div>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">￦</span>
				</div>
				<input type="number" class="form-control"
					aria-label="Amount (to the nearest dollar)" name="price" value = "${stuff.price / 10000.0}">
			</div>
			<div>단위 : (만원)</div>
			<br>
			<div class="form-group">
				<label for="exampleInputPassword4">수량</label> <input
					type="number" class="form-control" id="exampleInputPassword4"
					placeholder="수량" name = "stuffCount" value = "${stuff.stuffCount }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword4">무게 (Kg)</label> <input
					type="number" class="form-control" id="exampleInputPassword4"
					placeholder="무게 (Kg)" name = "weight" value = "${stuff.weight}">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword4">가로 (Cm)</label> <input
					type="number" class="form-control" id="exampleInputPassword4"
					placeholder="가로(X)" name="size1" value = "${stuff.size1 }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword4">세로 (Cm)</label> <input
					type="number" class="form-control" id="exampleInputPassword4"
					placeholder="세로(X)" name="size2" value = "${stuff.size2 }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword4">높이 (Cm)</label> <input
					type="number" class="form-control" id="exampleInputPassword4"
					placeholder="높이(H)" name="size3" value = "${stuff.size3 }">
			</div>
			<div class="form-group">
				<label for="exampleInputName1">제조일자</label> <input type="date"
					class="form-control" id="exampleInputName1"
					name="manufacturingDate" value = "${stuff.manufacturingDate }">
			</div>
			<div class="form-group">
				<label for="exampleInputName1">제조국가</label> <input type="text"
					class="form-control" id="exampleInputName1" placeholder="제조국가"
					name="manufacturingCountry" value = "${stuff.manufacturingCountry }">
			</div>
			<div class="form-group">
				<label for="exampleInputName1">색상</label> <input type="text"
					class="form-control" id="exampleInputName1" placeholder="색상"
					name="color" value = "${stuff.color }">
			</div>
			<div class="form-group">
				<label for="exampleInputName1">재질</label> <input type="text"
					class="form-control" id="exampleInputName1" placeholder="재질"
					name="material" value = "${stuff.material }">
			</div>
			
			<div class = "form-group row">
				<label class = "col-sm-2 col-form-labe">카테고리</label>
			</div>
				<div class = "col-sm-10">
					<select name = "stuffMain" id = "stuffMain" class = "form-control" required="required">
						<option value = "${stuffMaincategory.mcNo }">${stuffMaincategory.mcName }</option>
						<c:forEach var = "mc" items = "${list }">
							<option value = "${mc.mcNo }">${mc.mcName }</option>
						</c:forEach>
					</select>
					<br>
					<select name = "stuffSub" id = "stuffSub"  class = "form-control">
						<option value = "${stuff.scName}">${stuff.scName }</option>
					</select>
				</div>
			<br>
			 <div class = "form-group row">
				<label class = "col-sm-2 col-form-labe">거래처</label>
			 </div>
				<div class = "col-sm-10">
					<select name = "conName" id = "conName" class = "form-control" required="required">
						<option value = "${sutffConnection.conName }">${sutffConnection.conName }</option>
						<c:forEach var = "con" items = "${list2 }">
							<option value = "${con.conName }">${con.conName }</option>
						</c:forEach>
					</select>
			</div>
			<br><br>
			<div class="form-group">
                        <label for="exampleTextarea1">기타 사항</label>
                        <textarea rows="8" cols="20" class = "form-control" id = "etc" name = "etc" style = "resize: none">${stuff.etc }</textarea>
            </div>

			<div class = "form-group row">
				<label class = "col-sm-2 col-form-labe">물품 이미지</label>
			</div>
				<div class = "col-sm-10">
					<div class="custom-file">
                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
                    <label class="custom-file-label" for="upFile">${stuffUpload.imgOriname }</label>
                	</div>
				</div>
			<br><br>

			


			<input type = "submit" class = "btn btn-success mr-2" value="수정" id = "btn">
			<button type="button" class="btn btn-light" onclick="deleteStuff();">삭제</button>


			</div>		
		</form>
	</div>





</section>
<script>
$(function(){
    $("#stuffMain").click(function(){
       $.ajax({
          url : "${path}/stuff/stuffSubcategoryList.do",
          type : "post",
          data : { "mcNo" : $("#stuffMain").val()},
          success:function(data){

        	  	$("#stuffSub").find("option").remove();
		
				for (var i = 0; i < data.length; i++) {

					if (i < 0) 
					{
						 $("#stuffSub").append("<option value='0'>서브 카테고리를 선택하세요</option>");
					} 
					else 
					{
						 $('<option value="' + data[i].scName +'">' + data[i].scName + '</option>').appendTo('#stuffSub');
					}							 
				}
				
				 console.log(data);
			}
		});
	});
});

$(function(){
	$('[name=upFile]').on('change', function(){
		var fileName = this.files[0].name;
		$(this).next('.custom-file-label').html(fileName);
	
	})  
  });
  
function deleteStuff(){
	if(confirm("삭제시 해당 물품에 관한 모든 정보가 전부 삭제됩니다.\n정말 삭제하시겠습니까?")) {
		location.href="${path}/stuff/deleteStuff.do?stuffNo=${stuff.stuffNo}";
	}
}

function fileDownload(oName, rName){
   oName=encodeURIComponent(oName);
   location.href="${path}/stuff/filedownLoad.do?oName="+oName+"&rName="+rName;
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>