<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>联系人-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/xunjia_wuliao.css"/>
   <style type="text/css">
<style type="text/css">
textarea{
border: 1px solid #DADADA;
color: #888;
height: 100px;
margin-bottom: 16px;
margin-right: 6px;
margin-top: 2px;
outline: 0 none;
padding: 3px 3px 3px 5px;
width: 90%;
font-size: 12px;
line-height:15px;
box-shadow: inset 0px 1px 4px #ECECEC;
-moz-box-shadow: inset 0px 1px 4px #ECECEC;
-webkit-box-shadow: inset 0px 1px 4px #ECECEC;
}

 img {
    vertical-align: middle;
    display: inline-block;
    margin-right: 10px;
    width: 28px;
    height: 28px;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.org label.bai{
	background-color: #ffffff;
}

</style>
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
        "url": '${ctx}/contact/contact/myContact',
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
                	
                		var a=$("<a class='weui_cell' href='${ctx}/contact/contact/form?id="+c.id+"'></a>");
                		var div1=$("<div class='weui_cell_bd weui_cell_primary'></div>");
                		var div2=$("<div class='wuliao-title'><label>"+c.name+"</label><span> -- "+c.nickName+"</span></div>");
                		var div3=$("<div class='detail clearfix'><span class='date'>&nbsp;&nbsp;&nbsp;手机号："+c.telphone+"</span><span class='require'>身高：<label>"+c.height+"</label></span></div>");
                		var cl="class='green'";
                		var div4=$("<div class='org'><span></span><label "+cl+">修改</label></div>");
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
     <h1 > &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 常用联系人 <a href="${ctx}/contact/contact/form" style="float:right">增加  &nbsp;&nbsp;</a>
     </h1> 
    </div>
 </header>
 <article style="bottom: 0;">
    <div class="weui_cells weui_cells_access" id="hotlist">  
   
                <div id="nouser" style="display:none">暂无联系人</div>
        
 	</div>   
 </article>  
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>