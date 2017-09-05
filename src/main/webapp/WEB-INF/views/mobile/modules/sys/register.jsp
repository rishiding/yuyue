<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<section id="reg_section">
	<header>
        <nav class="left">
            <a href="#" data-icon="previous" data-target="back">返回</a>
        </nav>
        <h1 class="title">用户注册</h1>
    </header>
	<header>
        <h1 class="title">${fns:getConfig('productName')}</h1>
        <nav class="right">
            <a data-icon="arrow-down-left-2" href="#" id="btnLogout">退出</a>
        </nav>
    </header>
    <article class="active" data-scroll="true">
        <div style="padding: 10px 0 20px;">
        <ul class="list inset demo-list">
            <li data-icon="next" data-selected="selected">
                <span class="icon user"></span>
                <a href="#user_section?test=abc" data-target="section">
                    <strong>用户管理</strong>
                </a>
            </li>
        </ul>
        </div>
    </article>
    
     <script type="text/javascript">
	$('body').delegate('#reg_section','pageinit',function(){
	});
	$('body').delegate('#reg_section','pageshow',function(){
        var hash = J.Util.parseHash(location.hash);
        console.log(hash.param);
	});
	</script>
</section>