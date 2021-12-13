<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx %>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "./SE/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
</script>
</head>
<style>
	.container{
		margin-top: 80px;
		margin-left: 230px;
		padding: 50px;
	}
	#backbtn {
		width: 150px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		color: white;
		
	}
	#savebtn {
		width: 100px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		margin-left: 800px;
		color: white;
	}
</style>
<body>
	<div class="container">
		<h1 class="title">양식 등록</h1>
		<form id="frm" action="./insertform.do" method="post" >
		<table class="editor">
			<tr>
				<td>
				<%-- ${fclist} --%>
					<%-- <select name="formclassification">
					<c:forEach items="${fclist}" var="list">
						<c:forEach items="${list}" var="map">
							${map.FORM_CLASS_NO}
							<option value="${map.form_class_no}">${map.form_class_nm}</option>
						</c:forEach>

					</c:forEach>
					</select> --%>
				</td>
			<tr>
	        <tr>
	            <td>제목</td>
	            <td><input type="text" id="title" name="title" style="width:650px"/></td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea rows="10" cols="30" id="ir1" name="content" style="width:650px; height:350px; "></textarea>
	            </td>
	        </tr>
		</table>
		<input id="savebtn" type="submit" value="저장">
		<input type="button" id="backbtn" onclick="location.href='./formlist.do'" value="목록으로 돌아가기">
		</form>
	</div>
</body>
</html>