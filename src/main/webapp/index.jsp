<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
	<title>南京农业大学梨产业网</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<%    
		String path = request.getContextPath();    
		String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
	%> 
	<script type="text/javascript">
		var base = '<%=base %>';
	</script>

	<link rel="stylesheet" type="text/css" href="<%=base %>js/jquery-easyui/themes/metro-green/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=base %>js/jquery-easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=base %>css/index.css">
	
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/Javascript" src="<%=base %>js/jquery.slides.min.js"></script>
	
</head>
			
	<script type="text/javascript">
	$(document).ready(function(){
		 $(".preHide").css("display","block");
		 $("#imageArea").slidesjs({
		        width: 200,
		        height: 200,
		        play: {
		            active: true,
		              // [boolean] Generate the play and stop buttons.
		              // You cannot use your own buttons. Sorry.
		            effect: "slide",
		              // [string] Can be either "slide" or "fade".
		            interval: 2000,
		              // [number] Time spent on each slide in milliseconds.
		            auto: true,
		              // [boolean] Start playing the slideshow on load.
		            swap: true,
		              // [boolean] show/hide stop and play buttons
		            pauseOnHover: false,
		              // [boolean] pause a playing slideshow on hover
		            restartDelay: 1500
		              // [number] restart delay on inactive slideshow
		          }
		      });
		 
		  $("#messageAddButton").linkbutton();
		  
		  $("#messageAddButton").click(function(){
				$('#messageAddArea').window({
					title : '添加留言',
					width : 800,
					height : 600,
					modal : true
				});
				$('#messageAddArea').window('refresh', 'addMessage.html'); 
		  });


	})
	</script>	
	
<body >
   <!-- 网站主体 -->
   
   
   <div  id="website-body" class="easyui-layout" >
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>	
   <!-- main body，中间部分 -->
		<div id="main" data-options="region:'center'" style="margin-top:10px;">       
       	<div class="showBorder" style="height:60%">
       		<div id="imageArea" class="showBorder" style="height:100%;width:49%;float:left;">
 
	       	  		<a href="www.baidu.com"><img src="images/newsImages/1.jpg" width=100% height=100%></a>
	       	  		<a href="www.baidu.com"> <img src="images/newsImages/2.jpg"  width=100% height=100%></a>
	       	  		<img src="images/newsImages/3.jpg" width=100% height=100%>
	       	  		<img src="images/newsImages/4.jpg" width=100% height=100%>
 
       		</div>
       		<div class="showBorder" style="height:100%;width:25%;float:left">
       		</div>
       		<div class="showBorder" style="height:100%;width:25%;float:left">
       		</div>
       	</div>
       	<div class="showBorder" style="height:40%">
       		<div class="showBorder" style="height:100%;width:25%;float:left">
       		</div>
      		<div class="showBorder" style="height:100%;width:24%;float:left">
       		</div>       		
       		<div class="showBorder" style="height:100%;width:25%;float:left">
       		</div>
       		<div class="showBorder" style="height:100%;width:25%;float:left">
       		</div>       	
       	</div>
  
       </div>

 	<jsp:include page="bottom.jsp"></jsp:include>
   </div>
   </body>
</html>