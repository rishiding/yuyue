<%@ page contentType="text/html;charset=UTF-8" %>
<br>
<br>
<br>
<footer>
            <ul class="menubar animated fadeInUp delay3">
            	
                <li class="tab <c:if test="${sessionScope._tab eq 'reserve'}">active</c:if>" onclick="javascript:reserve()">
                    <i class="iconfont">&#xe63f;</i>
                    <label class="tab-label">预约</label>
                   
                </li>
                <li class="tab <c:if test="${sessionScope._tab eq 'help'}">active</c:if>" onclick="javascript:help()">
                    <i class="iconfont" >&#xe63d;</i>
                    <label class="tab-label">帮助</label>
                   
                </li>
                 <li class="tab <c:if test="${sessionScope._tab eq 'index'}">active</c:if>" onclick="javascript:home()">
                    <i class="iconfont" >&#xe63e;</i>
                    <label class="tab-label">我</label>
                </li>
               
            </ul>
 </footer>
<script type="text/javascript">
    function back(){
    	window.history.go(-1); 
    }
    function home(){
    	window.open("${ctx}/",'_self') 
    }
    function help(){
    	window.open("${front}/reserve/help",'_self') 
    }
    function reserve(){
    	window.open("${front}/reserve/index",'_self') 
    }
   
    
</script>