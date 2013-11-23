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
					<li><a href="newsList?articleInfoDto.type=glzd&pageSize=20&pageNo=1">管理制度</a></li>
       		</ul>
       	</div>
       	<div class="rightArea" >
       		<div id="imageArea">
       		</div>
       		<table>
       		<tr><td><img src="images/moduleNameIcon.jpg"></td><td><span class="moduleName">管理制度</span></td></tr>
       		</table>       		
       		<div class="newsListArea">
       		<ul class="normalNewsList">
       		<s:iterator  value="documentList" status="status">
      			<s:if test="#status.getIndex()==0"> 
      			   		 <s:property value="content" escape="false"/>		
                </s:if>
                    
                        <s:else>      

						</s:else>    
               
                     </s:iterator>

			</ul>						
       		</div>
       	</div>
       </div>
 
   <!-- bottom 底部 -->   	 
 	<jsp:include page="bottom.jsp"></jsp:include>
   </div>
   </body>
</html>