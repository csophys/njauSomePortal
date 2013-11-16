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
   <div  id="website-body" >
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>

   <!-- main body，中间部分 -->
       <div id="main" style="height:550px" >
       
       	<div id="win"></div>
       	
       	<div id="moduleTabs" class="easyui-tabs" data-options="fit:'true'">
	       <div title="文章管理" data-options="" style="padding:20px">
	       
	       <div id="SearchCondition" style="text-align:center;margin-bottom:10px;font-size:12px;">
	        <!-- 
			<label class="searchBox" for="articleTitle" style="border-width:0px;" >文章标题：</label>  <input id="articleTitle" ></input>
			<label class="searchBox" style="margin-left:5px;border-width:0px;">文章模块：</label>
			-->
			<div id="role" style="display:none"><s:property value="#session['role']" /></div>
			<select id="articleTag" class="easyui-combobox" style="width:200px;" data-options="required:true,panelHeight:'auto',editable:false">
				<option value="项目公告">项目公告</option>
				<option value="学术动态">学术动态</option>
				<option value="图片新闻">图片新闻</option>
				<option value="项目说明">项目说明</option>
				<option value="项目组构成">项目组构成</option>
				<option value="相关研究论文">相关研究论文</option>
				<option value="研究队伍">研究队伍</option>
				<option value="相关研究论文（英文）">相关研究论文（英文）</option>
				<option value="水稻细菌性病害研究论文（中文）">水稻细菌性病害研究论文（中文）</option>
				<option value="水稻细菌性病害学位论文（中文）">水稻细菌性病害学位论文（中文）</option>
				<option value="标注(nyhyzx07-056)支持的论文">标注(nyhyzx07-056)支持的论文</option>
				<option value="工作进展">工作进展</option>
				<option value="图文诊断">图文诊断</option>
				<option value="视频诊断">视频诊断</option>
				<option value="其他诊断">其他诊断</option>
				<option value="专家答疑">专家答疑</option>
				<option value="专家队伍">专家队伍</option>
				<option value="联系我们">联系我们</option>		

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
			<!-- 
	       <div title="公告管理" data-options="" style="padding:20px">
			   <table id="announceDataGrid" title="公告列表" class="easyui-datagrid"  style="height:450px">
  			  </table>
	       </div>
			-->
		</div>
	  </div>

   <!-- bottom 底部 -->   	 

 	<jsp:include page="bottom.jsp"></jsp:include>
 	<!--初始化所在tab -->
 	<s:hidden name="currentTab" id="currentTab" ></s:hidden>
   </div>
   </body>
</html>