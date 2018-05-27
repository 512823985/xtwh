<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <title>显示问题列表</title>  
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/js/pintuer.js"></script> 
</head>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 查看已处理问题</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" id="keywords" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <%-- 
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button" class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
          <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
        </li>
      </ul>
    </div>
    --%>
    <table class="table table-hover text-center">
      <tr>
      	<th>序号</th>
        <th>姓名</th>       
        <th>电话</th>
        <th>IP地址</th>
        <th>所属类别</th>
        <th width="25%">标题</th>
         <th width="150">提交时间</th>
        <th>操作</th>       
      </tr>
      	<c:forEach items="${pageInfo.list }" var="question" varStatus="status">    
	        <tr>
	          <td>${status.index+1 }</td>
	          <td>${question.user.userName }</td>
	          <td>${question.user.userPhone }</td>
	          <td>${question.ip }</td>
	          <td>${question.category }</td>  
	          <td>${question.title }</td>
	          <td><fmt:formatDate value="${question.time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	          <td>
	          	<div class="button-group">
	          		<button type="button" class="button border-green" id="checkall" onclick="view(${question.id});"><span class="icon-check"></span> 查看</button>
	      		</div>
	          </td>
	        </tr>
        </c:forEach>  
      <tr>
        <td colspan="8">
        	<div class="pagelist"> 
        		<c:if test="${pageInfo.hasPreviousPage }">
	        		<a href="${pageContext.request.contextPath }/question/resolvedList.do?page=${pageInfo.pageNum-1}">上一页</a> 
        		</c:if>
        		
        		<c:forEach var="idx" items="${pageInfo.navigatepageNums }">
        			<c:choose>
		        		<c:when test="${idx==pageInfo.pageNum }">
		        			<span class="current">${idx }</span>
		        		</c:when>
		        		<c:otherwise>
		        			<a href="${pageContext.request.contextPath }/question/resolvedList.do?page=${idx}">${idx }</a>
		        		</c:otherwise>
	        		</c:choose>
        		</c:forEach>
        		
        		<c:if test="${pageInfo.hasNextPage }">
        			<a href="${pageContext.request.contextPath }/question/resolvedList.do?page=${pageInfo.pageNum+1}">下一页</a>
        		</c:if>
        	</div>
        </td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

function changesearch(){	
	window.location="${pageContext.request.contextPath}/question/searchResolved.do?keywords="+$("#keywords").val();
}

function view(id) {
	window.location="${pageContext.request.contextPath}/question/view.do?id="+id+"&resolved=true";
}

</script>
</body>
</html>