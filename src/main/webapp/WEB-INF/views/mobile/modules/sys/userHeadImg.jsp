<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>头像 </title>
<link href="${ctxStatic}/mobile/photo/style.css" rel="stylesheet" type="text/css">
 <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
 </head>
<body>
       
  
<article class="htmleaf-container">
<div id="clipArea"></div>
<div class="foot-use">
	<div class="uploader1 blue">
		<input type="button" name="file" class="button" value="打开">
		<input id="file" type="file" onchange="javascript:setImagePreview();" accept="image/*" multiple  />
	</div>
	<button id="clipBtn">截取</button>
</div>
<div id="preview"></div>
</article>
  
       
 <script src="${ctxStatic}/mobile/photo/iscroll-zoom.js"></script>
<script src="${ctxStatic}/mobile/photo/hammer.js"></script>
<script src="${ctxStatic}/mobile/photo/jquery.photoClip.js"></script>
  <script>
var obUrl = ''
//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
$("#clipArea").photoClip({
	width: 200,
	height: 200,
	file: "#file",
	view: "#view",
	ok: "#clipBtn",
	clipFinish: function(dataURL) {
		//console.log(dataURL);
	}
});
</script>
<script>
function convertBase64UrlToBlob(urlData){
    //去掉url的头，并转换为byte
    var bytes=window.atob(urlData.split(',')[1]);        
    
    //处理异常,将ascii码小于0的转换为大于0
    var ab = new ArrayBuffer(bytes.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < bytes.length; i++) {
        ia[i] = bytes.charCodeAt(i);
    }
    // 此处type注意与photoClip初始化中的outputType类型保持一致
    return new Blob( [ab] , {type : 'image/jpeg'});
}

$(function(){
$(".htmleaf-container").show();
$("#clipBtn").click(function(){
	
		if(imgsource=="")return;
		$.ajax({
		    url:'${ctx}/sys/user/imageUnload',
		    type:'POST', 
		    async:false,    
		    data:{id:'${user.id}', byteString:imgsource},	   
		    dataType:'json',      
		    success:function(data){
		        if(data.code='2000'){
		        	
		        	 window.location.href="${ctx}/";
		        }else{
		        	alert("保存失败！");
		        }
		    },
		    error:function(){
		    	alert("系统异常");
		    }
	});
		
		$(".htmleaf-container").hide();
	})
});
</script>
<script type="text/javascript">
$(function(){
	jQuery.divselect = function(divselectid,inputselectid) {
		var inputselect = $(inputselectid);
		$(divselectid+" small").click(function(){
			$("#divselect ul").toggle();
			$(".mask").show();
		});
		$(divselectid+" ul li a").click(function(){
			var txt = $(this).text();
			$(divselectid+" small").html(txt);
			var value = $(this).attr("selectid");
			inputselect.val(value);
			$(divselectid+" ul").hide();
			$(".mask").hide();
			$("#divselect small").css("color","#333")
		});
	};
	$.divselect("#divselect","#inputselect");
});
</script>

<script type="text/javascript">
$(function(){
   $(".mask").click(function(){
	   $(".mask").hide();
	   $(".all").hide();
   })
	$(".right input").blur(function () {
		if ($.trim($(this).val()) == '') {
			$(this).addClass("place").html();
		}
		else {
			$(this).removeClass("place");
		}
	})
});

$("#file0").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	 obUrl = objUrl;
	console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#img0").attr("src", objUrl).show();
	}
	else{
		$("#img0").hide();
	}
}) ;
function qd(){
   var objUrl = getObjectURL(this.files[0]) ;
   obUrl = objUrl;
   console.log("objUrl = "+objUrl) ;
   if (objUrl) {
	   $("#img0").attr("src", objUrl).show();
   }
   else{
	   $("#img0").hide();
   }
}
function getObjectURL(file) {
	var url = null ;
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}

var subUrl = "";
$(function (){
	$(".file-3").bind('change',function(){
		subUrl = $(this).val()
		$(".yulan").show();
		$(".file-3").val("");
	});

	$(".file-3").each(function(){
		if($(this).val()==""){
			$(this).parents(".uploader").find(".filename").val("营业执照");
		}
	});
$(".btn-3").click(function(){
$("#img-1").attr("src", obUrl);
$(".yulan").hide();
$(".file-3").parents(".uploader").find(".filename").val(subUrl);
})
	$(".btn-2").click(function(){
		$(".yulan").hide();
	})

});

function setImagePreview() {
	var preview, img_txt, picture;
	if (picture&&!picture.match(/.jpg|.gif|.png|.bmp/i)) return alert("您上传的图片格式不正确，请重新选择！"),
			!1;
	if (preview = document.getElementById("preview")){
			preview.style.display = "block",
			preview.style.width = "63px",
			preview.style.height = "63px",
			preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
	}
	return 0;
}
</script>
  
</body>
</html>
