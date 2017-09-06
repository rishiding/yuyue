<%@ page contentType="text/html;charset=UTF-8" %>
<footer>
            <ul class="menubar animated fadeInUp delay3">
            	
                <li class="tab " onclick="javascript:reserve()">
                    <i class="iconfont">&#xe63f;</i>
                    <label class="tab-label">预约</label>
                    <span class="point"></span>
                </li>
                <li class="tab" onclick="javascript:help()">
                    <i class="iconfont" >&#xe63d;</i>
                    <label class="tab-label">帮助</label>
                    <span class="point"></span>
                </li>
                 <li class="tab active" onclick="javascript:home()">
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
    	window.open("${base}/member/help",'_self') 
    }
    function reserve(){
    	window.open("${base}/reserve/list",'_self') 
    }
   
    
</script>