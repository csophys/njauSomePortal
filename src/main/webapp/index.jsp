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
   
   
   <div  id="website-body"  class="easyui-layout">
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>

   <!-- main body，中间部分 -->
       <div id="main" data-options="region:'center'" style="margin-top:10px;">
       <div  id="main-body"  class="easyui-layout" data-options="fit:true">
       	  <div id="left-main" data-options="region:'center'" style="height:100%;">
       	  	<div class="easyui-layout" data-options="fit:true">
	     	  	<div id="left-main-top" data-options="region:'north',title:'新闻资讯',collapsible:false" style="height:250px;width:100%;">
	       	  		<div id="newsArea" class="preHide" style="height:100%;width:60%;float:left;margin-top:10px;display:none">
	       	  		<ul class="newsList" >

  						<s:iterator value="@njau.org.action.DocumentAction@findDocument('新闻资讯')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px">[<s:date nice="false" name="addTime" format="yyyy-MM-dd" />]</span>
							</li>
						</s:iterator>

					</ul>
						<div ><span style="float:right"><a href="newsList?articleInfoDto.type=xwzx&pageNo=1&pageSize=20" >更多&gt;&gt;</a></span></div>	
		       	  	</div>
	       	  		<div id="imageArea" style="height:100%;width:36%;border:1px solid green;float:right;margin:2px;display:none">

	       	  		  	<s:iterator value="@njau.org.action.DocumentAction@findIndexImages()">
	       	  		  	<!-- 
		       	  		<a href="<s:property value='imageUrl' />"><img src='<s:property value="filePath" />' width=100% height=100%></a>	       	  		  	
		       	  		 -->
		       	  		<img onclick='window.open("<s:property value='imageUrl' />")' src='<s:property value="filePath" />' width=100% height=100%>
						</s:iterator>

	       	  		<!-- 		       	  			       	  		  			    		 
		       	  		<a href="www.baidu.com"><img src="images/newsImages/1.jpg" width=100% height=100%></a>
		       	  		<a href="www.baidu.com"> <img src="images/newsImages/2.jpg"  width=100% height=100%></a>
		       	  		<img src="images/newsImages/3.jpg" width=100% height=100%>
		       	  		<img src="images/newsImages/4.jpg" width=100% height=100%>
		       	  		<a href=""><img src="uploads/20131018192333.jpg" width=100% height=100%></a>
		       	   	   <a href="123"><img src="uploads/20131018113153.gif" width=100% height=100%></a>	       	  		  	
		    		 -->  
	       	  		</div>
	       	  	</div>
	       	  	
	       	  	<div id="left-main-center" data-options="region:'center',title:'专家门诊'" style="width:100%;margin:10px 0 10px 0">
	       	  		   <div class="preHide" style="display:none">
	       	  		    <ul class="newsList documentList">
  						<s:iterator value="@njau.org.action.DocumentAction@findDocument('专家门诊')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px">[<s:date nice="false" name="addTime" format="yyyy-MM-dd" />]</span>
							</li>
						</s:iterator>	       	  		    
						</ul>
						
						<div ><span style="float:right"><a href="newsList?articleInfoDto.type=zjmz&pageNo=1&pageSize=20" >更多&gt;&gt;</a></span></div>							
					   </div>	       	  	
	       	  	</div>
	       	  	
	       	  	<div id="left-main-bottom" data-options="region:'south',title:'留言板',collapsible:false" style="height:280px;width:100%;">
	       	  		<div class="preHide" style="marigin-top:10px;display:none">
	       	  		<s:if test="#session['username']!=null">
	       	  			<div style="float:right"><a id="messageAddButton">添加留言</a></div>
	       	  			<div id="messageAddArea"></div>
	       	  		</s:if>
	       	  			<ul class="newsList documentList" >
  						<s:iterator value="@njau.org.action.DocumentAction@findDocument('留言板')">
							<li>
							<span style="float:left;width: 40%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px">[<s:date nice="false" name="addTime" format="yyyy-MM-dd" />]</span><span style="margin-left:30px">用户：<s:property value="memo" /></span>
							</li>
						</s:iterator>	       	  			

						</ul>
						<div ><span style="float:right"><a href="newsList?articleInfoDto.type=lyb&pageNo=1&pageSize=20" >更多&gt;&gt;</a></span></div>
					</div>																			
	       	  	</div> 
       	  	</div>
       	  </div>

		<!-- body 右侧边栏 -->
		<jsp:include page="body-right.jsp"></jsp:include>
		
       	</div>
       </div>
   <!-- bottom 底部 -->   	 
 	<jsp:include page="bottom.jsp"></jsp:include>
   </div>
   </body>
</html>