<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="default"/>
<script>
var jjurl="${pageContext.request.contextPath}/modules/handover/index.html";
var u = navigator.userAgent;
if(u.indexOf('iPad') > -1){
	window.parent.location=jjurl;
}
</script>

<style type="text/css"> 
*{ margin:0; padding:0;} 
.box{ width:300px; height:300px; padding-top:60px; padding-left:60px;} 
.box li{ float:left; list-style:none} 
.box li a{ border:5px solid #2fa4e7; display:block; width:100px; height:100px; text-decoration:none; margin:0 0 -5px -5px; position:relative; z-index:0; text-align:center; line-height:50px;  font-size:30px;} 
.box li a:hover{ border:5px solid #333; z-index:1;} 
</style> 
</head> 
<body> 
<ul class="box"> 
<c:forEach items="${sysList}" var="item">
<li>
<a href="<c:choose><c:when test="${fn:startsWith(item.url,'http:')}">${item.url}?userid=${user.id}
</c:when>
<c:otherwise>${pageContext.request.contextPath}${item.url}?userid=${user.id}
</c:otherwise>
</c:choose>" id="${item.id}" target="_blank">
<img alt="${item.name}" src="<c:choose><c:when test="${item.icon}">${ctxStatic}${item.icon}
	</c:when>
	<c:otherwise>${ctxStatic}/images/handover_nav_icon.png
	</c:otherwise>
	</c:choose>"></img>
</a>
</li> 
</c:forEach>
</ul> 
</body> 
</html> 
