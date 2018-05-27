<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>登录</title>  
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/js/pintuer.js"></script> 
	
  </head>
  
  <body>
  <div class="bg"></div>
	<div class="container">
	    <div class="line bouncein">
	        <div class="xs6 xm4 xs3-move xm4-move">
	            <div style="height:150px;"></div>
	            <div class="media media-y margin-big-bottom">           
	            </div>         
	            <form action="${pageContext.request.contextPath }/user/login.do" method="post">
	            <div class="panel loginbox">
	                <div class="text-center margin-big padding-big-top"><h1>信息系统运维管理网上平台</h1></div>
	                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
	                    <div class="form-group">
	                        <div class="field field-icon-right">
	                            <input type="text" class="input input-big" name="userName" placeholder="登录账号" data-validate="required:请填写账号" />
	                            <span class="icon icon-user margin-small"></span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <div class="field field-icon-right">
	                            <input type="password" class="input input-big" name="userPwd" placeholder="登录密码" data-validate="required:请填写密码" />
	                            <span class="icon icon-key margin-small"></span>
	                        </div>
	                    </div>
						<div class="field" style="text-align: center;">
							<span style="color: red; font-size:20px;">
								${message }
							</span>
						</div>
	                    <%-- 
	                    <div class="form-group">
	                        <div class="field">
	                            <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
	                           <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  
	                                                   
	                        </div>
	                    </div>
	                    --%>
	                </div>
	                <div style="padding:30px;text-align: center;">
	                	<input type="submit" class="button bg-main input-big" value="登录">
	                	<input style="margin-left: 60px;" type="button" class="button bg-main input-big" value="注册" onclick="register();">
	                </div>
	            </div>
	            </form>          
	        </div>
	    </div>
	</div>
  
  	<script type="text/javascript">
  		function register() {
  			window.location="${pageContext.request.contextPath}/user/toRegister.do";
  		}
  	</script>
  </body>
</html>
