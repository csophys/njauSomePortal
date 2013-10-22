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
       	  <div id="left-main" data-options="region:'center',title:'文章列表'" style="height:100%;">
       	  	<div class="preHide" style="display:none">
			   <div style="height:75%">
			   <ul class="newsList documentList">

  						<s:iterator value="documentList">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px">[<s:date nice="false" name="addTime" format="yyyy-MM-dd" />]</span>
							</li>
						</s:iterator>

			
																																					
				</ul>
			   </div>
			   <div style="text-align:center;padding-top:20px">
					<!-- TODO:分页样式及js优化 -->
				 	<span>总页数：<i><s:property value="totalPage"/></i></span>
				 	<span style="margin-right:30px">当前页：<b><s:property value="pageNo"/></b></span>
				 
				 	<!-- 分页调转改成js，然后做边界验证 -->
					<span><a href="newsList?articleInfoDto.type=xwzx&pageSize=20&pageNo=<s:property value='pageNo-1'/>&totalPage=<s:property value='totalPage'/>" >前一页</a></span>
				
				  	<span><a style="margin:0 20 0 20" href="newsList?articleInfoDto.type=xwzx&pageSize=20&pageNo=<s:property value='pageNo+1'/>&totalPage=<s:property value='totalPage'/>">后一页</a></span>	
  	          		
  	          		
  	          		<!--<span>转到 <s:textfield cssStyle="width:25px" name="pageNo"></s:textfield> 页</span>-->
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