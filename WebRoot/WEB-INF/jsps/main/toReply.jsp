<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>回复内容</title>
	<link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
	<link rel="stylesheet" href="<%=basePath%>css/admin.css">
	<script src="<%=basePath%>js/jquery.js"></script>
	<script src="<%=basePath%>js/pintuer.js"></script>

  </head>
  
  <body>
     <div class="panel admin-panel">
	  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 回复信息</strong></div>
	  <div class="body-content">
	    <form method="post" class="form-x" action="${pageContext.request.contextPath }/reply/reply.do?questionid=${questionid}" >      
	      <div class="form-group">
	        <div class="label">
	          <label>内容：</label>
	        </div>
	        <div class="field" >
	          <textarea id="content" name="content" style="height: 200px;width: 800px;"></textarea>
	          <div class="tips"></div>
	        </div>
	      </div>
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
  </body>
  <script type="text/javascript">
  	function checkSub() {
  		if ($("#content").val() == "" || $("#content").val() == null) {
  			alert("请输入内容");
			return false;
  		}
  		return true;
  	}
  </script>
</html>
