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

	<link rel="stylesheet" type="text/css" href="<%=base %>css/index.css">
	
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/Javascript" src="<%=base %>js/jquery.slides.min.js"></script>
	
</head>
			
	

<body >
   <!-- 网站主体 -->
   <div  id="website-body"  >
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>


   <!-- main body，中间部分 -->
       <div>
       	<div class="leftNavigation">
       		<ul class="newsList">
					<li><a href="newsList?articleInfoDto.type=xglwyje&pageSize=20&pageNo=1">相关研究论文（英文）</a></li>
					<li><a href="newsList?articleInfoDto.type=xjxwpaperz&pageSize=20&pageNo=1">水稻细菌性病害研究论文（中文）</a></li>
					<li><a href="newsList?articleInfoDto.type=xjyjpaperz&pageSize=20&pageNo=1">水稻细菌性病害学位论文（中文）</a></li>
       		</ul>
       	</div>
       	<div class="rightArea" >
       		<div id="imageArea">
       			 <img  src="images/image2.jpg"></img>
       		</div>
       		<table>
       		<tr><td><img src="images/moduleNameIcon.jpg"></td><td><span class="moduleName">相关知识</span></td></tr>
       		</table>       		
       		<div class="newsListArea">
       		<ul class="normalNewsList">
       			 		<s:iterator value="documentList">
							<li>
							<span><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span>
							</li>
						</s:iterator>
			</ul>						
       		</div>
 			   <div style="text-align:right;padding-top:20px">
					<!-- TODO:分页样式及js优化 -->
				 	<span>总页数：<i><s:property value="totalPage"/></i></span>
				 	<span style="margin-right:30px">当前页：<b><s:property value="pageNo"/></b></span>
				 
				 	<!-- 分页调转改成js，然后做边界验证 -->
				 	
					<span><a href="newsList?articleInfoDto.type=<s:property value='moduleKey'/>&pageSize=20&pageNo=<s:property value='pageNo-1'/>&totalPage=<s:property value='totalPage'/>" >前一页</a></span>
				
				  	<span><a style="margin:0 20 0 20" href="newsList?articleInfoDto.type=<s:property value='moduleKey'/>&pageSize=20&pageNo=<s:property value='pageNo+1'/>&totalPage=<s:property value='totalPage'/>">后一页</a></span>	
  	          		
  	          		
  	          		<!--<span>转到 <s:textfield cssStyle="width:25px" name="pageNo"></s:textfield> 页</span>-->
  	          </div>       		
       	</div>
       </div>
 
   <!-- bottom 底部 -->   	 
 	<jsp:include page="bottom.jsp"></jsp:include>
   </div>
   </body>
</html>