<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>通知-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/notice.css"/>

   <script type="text/javascript">
    var message="${message}";
	if(message){
		layer.msg(message);
	}
$(function() {
	$("#jvForm").validate();
});
var page = 0;

var totalPage = 1;

var loading = false;
load();
$(window).scroll(function () {
    if ($(document).scrollTop() + $(window).height() >= $(document).height()) {
        load();
    }
});
function load() {
    if (page >= totalPage) {
        return;
    }
    page++;
    loading = true;
    $.ajax({
        "url": '${ctx}/oa/oaNotify/selfData',
        dataType: 'json',
        data: {                 
        	pageNo: page,
        	pageSize: 10
        },
        success: function (res) {
        	console.info(res);
            try {
                if (res) {
                	totalPage=res.totalPage;
                	var res=res.list;
                	for (var i=0;i<res.length;i++){
                		var c =res[i];
                		var a=$("<a class='weui_cell' href='${ctx}/oa/oaNotify/form?id="+c.id+"'></a>");
                		var div1=$("<div class='weui_cell_bd weui_cell_primary'></div>");
                		var p1=$("<p class='title'>"+c.title+"</p>");
                		var p2=$("<p class='date'>"+c.createDate+"</p>");
                		var p3=$("<p class='date'>"+c.content+"</p>");
                		
                		div1.append(p1,p2,p3);
                		a.append(div1);
                		$("#hotlist").append(a);                		
                	}
                    
                }else{
                	$("#nouser").show();
                }
            }catch (e) {
               
            } finally {
                loading = false;
            }
        },
        error: function () {
            loading = false;
        }
    })
}


</script>
</head>

<body>
 <header>
    <div class="titlebar reverse"  >
       <a href="javascript:back()" >
            <i class="iconfont">&#xe640;</i>
          </a>
     <h1 > 系统公告
     </h1> 
    </div>
 </header>
 <article style="padding-bottom: 54px;padding-top:70px;">
            <div class="weui_cells weui_cells_access animated fadeInRight" id="hotlist">
            </div>
             <div id="nouser" style="display:none">暂无记录</div>
      </article>
  
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>

