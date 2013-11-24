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
	
	
	<style>
	   .leftSideOfTable{
	   	  text-align: right
	   }
	</style>
	
	<script type="text/javascript">
	$(function(){
		$(".preHide").css("display","block");		
		
		$.extend($.fn.validatebox.defaults.rules, {
		    equals: {
		        validator: function(value,param){
		            return value == $(param[0]).val();
		        },
		        message: '两次密码输入不一致！'
		    }
		});		
		
		$(".regButton").linkbutton();
	})
	
	function ifUserExist(){
		
		if(!$("#username").validatebox("isValid")){
			return;
		}
		
		username = $("#username").val();
		$.ajax({
			dataType:"json",
			url : "ifUserExist",
			data:{"user.username":username},
			success:function(msg){
				if(msg.code==200){
				      $("#userFindResult").text("用户名"+username+"可以使用");					
				}else{
					  $("#userFindResult").text("很遗憾，用户名"+username+"已经被注册了");										
				}
			}
		});		
	}
	
    function submitForm(){
       $('#regForm').submit();
  	}
	
    function clearForm(){
        $('#regForm').form('clear');
    }	
	</script>
</head>
			
	

<body >
   <!-- 网站主体 -->
   <div  id="website-body" >
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>

   <!-- main body，中间部分 -->
       <div id="main" style="height:550px">
       <div  id="main-body"  class="easyui-layout" data-options="fit:true">
       	  <div id="left-main" data-options="region:'center',title:'用户注册'" style="height:100%;">
			   <div class="preHide"  style="display:none;width:100%;text-align: center" >
			   
				  <form id="regForm" action="reg" method="post">
				  	<div style="margin-top:20px">
	           		 <table style="margin:auto">
	                <tr>
	                    <td class="leftSideOfTable">用户名:</td>
	                    <td><input class="easyui-validatebox" type="text"  id="username" onblur="ifUserExist()" name="user.username" data-options="required:true,validType:'length[5,20]'"></input><span style="color:red" id="userFindResult"></span></td>
	                </tr>
	                <tr>
	                    <td class="leftSideOfTable">密码:</td>
	                    <td><input class="easyui-validatebox" type="password" id="password" name="user.password" data-options="required:true,validType:'length[6,20]'"></input></td>
	                </tr>
	                <tr>
	                    <td class="leftSideOfTable">确认密码:</td>
	                    <td><input class="easyui-validatebox" type="password" name="rePassword" validType="equals['#password']"></input></td>
	                </tr>
	                </table>
	                
	                </div>
		              <table width="100%" style="text-align: center;margin-top:10px">
		              <tr>
		              <td><a href="javascript:void(0)" onclick="submitForm()"  class="link-button regButton">注册</a><a style="margin-left:10px" href="javascript:void(0)" onclick="clearForm()" class="link-button regButton">重置</a></td>
		              </tr>
		              </table>	                
	               </form>
	               
			   </div>

       	  </div>
       	  

       	</div>
       </div>
   <!-- bottom 底部 -->   	 
 	<jsp:include page="bottom.jsp"></jsp:include>
   </div>
   </body>
</html>