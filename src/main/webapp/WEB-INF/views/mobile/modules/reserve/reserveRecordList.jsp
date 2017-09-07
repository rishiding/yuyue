<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>预约记录-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/xunjia_wuliao.css"/>

    <script type="text/javascript">
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
        "url": '${ctx}/reserve/reserveRecord/reserveRecords',
        dataType: 'json',
        data: {                 
        	pageNo: page,
        	pageSize: 10
        },
        success: function (res) {
        	console.info(res.data);
            try {
                if (res.data) {
                	
                	
                	totalPage=res.data.totalPage;
                	var res=res.data.list;
                	for (var i=0;i<res.length;i++){
                		var c =res[i];
                	
                		var a=$("<a class='weui_cell' href='${ctx}/reserve/reserveRecord/form?id="+c.id+"'></a>");
                		var div1=$("<div class='weui_cell_bd weui_cell_primary'></div>");
                		var div2=$("<div class='wuliao-title'><label>预约医生："+c.reserveUser.name+"</label><span> -- "+c.reserveTypeName+"</span></div>");
                		var div3=$("<div class='detail clearfix'><span class='date'>&nbsp;&nbsp;&nbsp;预约日期："+c.reserveDate+"</span><span class='require'>时段：<label>"+c.reserveTime+"</label></span></div>");
                		var cl="class='green'";
                		if(c.status==2){
                			cl="class='gray'";
                		}
                		var div4=$("<div class='org'><span></span><label "+cl+">"+c.statusName+"</label></div>");
                		div1.append(div2,div3,div4);
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
     <h1 > &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 预约记录 <a href="${front}/reserve/index" style="float:right"> 增加 &nbsp;&nbsp;</a>
     </h1> 
    </div>
 </header>
 <article style="bottom: 0;">
    <div class="weui_cells weui_cells_access" id="hotlist">  
   
                <div id="nouser" style="display:none">暂无记录</div>
        
 	</div>   
 </article>  
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>