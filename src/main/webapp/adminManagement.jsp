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
	<script type="text/javascript" src="<%=base %>js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="<%=base %>js/pagination.js"></script> 	 
	<script type="text/javascript" src="<%=base %>js/admin.js"></script> 	
	<script type="text/javascript" src="<%=base %>js/My97DatePicker/WdatePicker.js"></script> 		

	

	
</head>
			
	

<body >
   <!-- 网站主体 -->
   <div  id="website-body"  class="easyui-layout">
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>

   <!-- main body，中间部分 -->
       <div id="main" data-options="region:'center',title:'后台管理'"  >
       
       	<div id="win"></div>
       	
       	<div id="moduleTabs" class="easyui-tabs" data-options="fit:'true'">
	       <div title="文章管理" data-options="" style="padding:20px">
	       
	       <div id="SearchCondition" style="text-align:center;margin-bottom:10px;font-size:12px;">
	        <!-- 
			<label class="searchBox" for="articleTitle" style="border-width:0px;" >文章标题：</label>  <input id="articleTitle" ></input>
			<label class="searchBox" style="margin-left:5px;border-width:0px;">文章模块：</label>
			-->
			<div id="role" style="display:none"><s:property value="#session['role']" /></div>
			<select id="articleTag" class="easyui-combobox" style="width:75px;" data-options="required:true,panelHeight:'auto',editable:false">
				<option value="新闻资讯">新闻资讯</option>
				<option value="专家门诊">专家门诊</option>
				<option value="工作快讯">工作快讯</option>
				<option value="技术简报">技术简报</option>
				<option value="病虫害识别与防控">病虫害识别与防控</option>
				<option value="留言板">留言板</option>				

			</select>
			<a href="#" id="SearchForCondition" class="easyui-linkbutton" style="margin-left:20px;">搜索</a>
		  </div>
 			
			   <table id="articleDataGrid" title="文章列表" class="easyui-datagrid"  style="height:450px">
  			  </table>
		 </div>
    

	       <div title="图片管理" data-options="" style="padding:20px">
			   <table id="imageDataGrid" title="图片列表" class="easyui-datagrid"  style="height:450px">
  			  </table>
	       </div>

	       <div title="公告管理" data-options="" style="padding:20px">
			   <table id="announceDataGrid" title="公告列表" class="easyui-datagrid"  style="height:450px">
  			  </table>
	       </div>

		</div>
	  </div>

   <!-- bottom 底部 -->   	 

 	<jsp:include page="bottom.jsp"></jsp:include>
 	<!--初始化所在tab -->
 	<s:hidden name="currentTab" id="currentTab" ></s:hidden>
   </div>
   </body>
</html>