<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>医生列表-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/xunjia_wuliao.css"/>
<style>
 img {
    vertical-align: middle;
    display: inline-block;
    margin-right: 10px;
    width: 60px;
    height:60px;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
</style>
    <script type="text/javascript">

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
        "url": '${front}/reserve/doctor',
        dataType: 'json',
        data: {  
        	userType:2,
        	pageNo: page,
        	pageSize: 5
        },
        success: function (res) {
        	
            try {
                if (res.data) {
					var nopic='${ctxStatic}/images/nopicture.jpg';
                	totalPage=res.data.totalPage;
                	var res=res.data.list;
                	console.info(res);
                	for (var i=0;i<res.length;i++){
                		
                		var c =res[i];
                		var pic;
                		if(c.photo){
                			pic=c.photo;
                		}else{
                			pic=nopic;
                		}
                		var a=$("<a class='weui_cell' href='${front}/reserve/doctorInfo?userid="+c.id+"'></a>");
                		var div1=$("<div class='weui_cell_bd weui_cell_primary'></div>");
                		var div2=$("<div class='wuliao-title'><img src='"+pic+"'/><label>"+c.name+"</label><span>--"+c.title+"</span></div>");
                		var div3=$("<div class='detail clearfix'><span class='date'>"+c.company.name+" &nbsp;|&nbsp;"+c.office.name+"</span><span></span></div>");
                		
                		var div4=$("<div class='org'><span></span><label class='green'>预约</label></div>");
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
     <h1 >医生列表
     </h1> 
    </div>
 </header>
 <article style="bottom: 0;">
    <div class="weui_cells weui_cells_access" id="hotlist">  
   
                <div id="nouser" style="display:none">暂无医生</div>
        
 	</div>   
 </article>  
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>