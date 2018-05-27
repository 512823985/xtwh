<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 提交问题</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/question/add.do">
      <input type="hidden" name="userid" value="${userid }">
      <div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <input id="title" type="text" class="input" name="title" value="" />
          <div class="tips"></div>
        </div>
      </div>
      <%-- 
      <div class="form-group">
        <div class="label">
          <label>网站LOGO：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="slogo" class="input tips" style="width:25%; float:left;" value="" data-toggle="hover" data-place="right" data-image=""  />
          <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" >
        </div>
      </div>
      --%>
      <div class="form-group">
        <div class="label">
          <label>所属类别：</label>
        </div>
        <div class="field">
          <select id="category" class="input" name="category" >
          	<%-- 
          	<option value="合成作战平台">合成作战平台</option>
          	<option value="警综平台">警综平台</option>
          	<option value="实名制系统">实名制系统</option>
          	<option value="pgis系统">pgis系统</option>
          	--%>
          </select>
        </div>
      </div> 
              
      <div class="form-group">
        <div class="label">
          <label>具体内容：</label>
        </div>
        <div class="field">
          <textarea id="content" name="content" class="input" style="height:120px;"></textarea>
          <div class="tips"></div>
        </div>
      </div>
      <%-- 
      <div class="form-group">
        <div class="label">
          <label>图片附件：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="slogo" class="input tips" style="width:25%; float:left;" value="" data-toggle="hover" data-place="right" data-image=""  />
          <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" >
        </div>
      </div>
      --%>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button onclick="return checkSub();" class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
    	requestCategory();
    });
        
	function requestCategory() {
		$("#category").empty();
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/question/requestCategory.do',
			dataType:'json',
			success:function(data) {
				$("#category").append("<option value='-1'>--请选择--</option>");
				for (var i = 0; i < data.length; i++) {
					$("#category").append("<option value='"+data[i].name+"'>"+data[i].name+"</option>");
				}
			}
		});
	}
	
	function checkSub() {
		if( $("#title").val() == "" || $("#title").val()==null) {
			alert("请输入标题");
			return false;
		}
		if ($("#category").val() == "-1") {
			alert("请选择所属分类");
			return false;
		}
		if ($("#content").val() == "" || $("#content").val() == null) {
			alert("请输入内容");
			return false;
		}
		return true;			
	}
	
</script>
</body>
</html>