<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
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
	
	<script type="text/javascript">
	$(function(){
		$(".preHide").css("display","block");		
	})
	</script>
</head>
			
	

<body >
   <!-- 网站主体 -->
   <div  id="website-body"  class="easyui-layout">
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>

   <!-- main body，中间部分 -->
       <div id="main" data-options="region:'center'" style="margin-top:10px">
       <div  id="main-body"  class="easyui-layout" data-options="fit:true">
       	  <div id="left-main" data-options="region:'center',title:'新闻详情'" style="height:100%;">
			   <div class="preHide" id="content" style="display:none" >
				  <s:property value="document.content" escape="false"/>
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