<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@taglib prefix="s" uri="/struts-tags" %>  	
  	<%    
		String path = request.getContextPath();    
		String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
	%> 
	       	  <div id="right-main" data-options="region:'east'" style="height:100%;width:300;margin-left:10px">
       	 	<div  class="easyui-layout" data-options="fit:true">
	       	 	<div id="right-main-top" data-options="region:'north',title:'网站公告',collapsible:false" style="height:220px;width:100%;">
	       	 		<marquee direction="up" loop="-1" scrollamount="4" onmouseover="this.stop()" onmouseout="this.start()">
						<ul class="newsList" id="announceList">
				
	       	  		  	<s:iterator value="@njau.org.action.DocumentAction@findIndexAnnouces()">
							<li>
								<a href="<s:property value='url' />" ><span><s:property value='title' /></span></a>
							</li>			       	  		  	
						</s:iterator>						
			    		</ul>
						
					</marquee>
	       	 	</div>
	       	 	
	       	 	<div id="right-main-center" data-options="region:'center',title:'用户登陆'" style="width:100%;margin:10px 0 10px 0;text-align:center;">
	       	 	<form id="login" class="preHide" action="adminManagement.jsp" method="post" style="display:none">
	       	 	<table  border="0" cellspacing="0" cellpadding="0" style="margin:0px 0 0 40px;width:100%">
	
	       	 	<s:if test="#session['username']==null">
					<tbody>
		              <tr>
		                <td width="21%" height="30"><div align="center"><span class="STYLE3">用户</span></div></td>
		                <td width="79%" height="30"><input type="text" id="loginname" name="loginname" style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
		              </tr>
		              <tr>
		                <td height="30"><div align="center"><span class="STYLE3">密码</span></div></td>
		                <td height="30"><input type="password" id="loginPassword" name="loginPassword" style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
		              </tr>
		              <table width="100%" style="text-align: center;margin-top:5px">
		              <tr>
		              <td><a href="javascript:void(0)" id="loginButton" class="link-button">登陆</a><a style="margin-left:10px" href="reg.jsp" id="regButton" class="link-button">注册</a></td>
		              </tr>
		              </table>
		              <tr>		              
		              <!-- 
		                <td height="30">&nbsp;</td>
		                <td height="30"><img src="images/dl.gif" width="81" height="22" border="0" usemap="#Map"></td>
		                 -->
		              </tr>
		            </tbody>	       	 	
	       	 	</s:if>
	       	 	<s:else>
	       	 	<span style="margin-top:20px;text-align:center;font-size:16px">欢迎你！<s:property value="#session['username']"/></span>
	       	 	
	       	 	<br/>
	       	 	 <a style="margin-top:20px;" href="loginOut" id="loginOutButton" class="link-button">退出</a>
	       	 	</s:else>
		              
            	</table>
            	<!-- 
				<map name="Map"><area shape="rect" coords="3,3,36,19" onclick="document.getElementById('login').submit()"><area shape="rect" coords="40,3,78,18" onclick="document.getElementById('login').reset()"></map>            	
	       	 	 -->
	       	 	</form>
	       	 	</div>
	       	 	
	       	 	<div id="right-main-bottom" data-options="region:'south',title:'友情链接',collapsible:false" style="height:400px;width:100%;">
	       	 	<ul class="preHide" style="margin-top:10px;list-style-type : none;font-size:14px;display:none;line-height: 30px">
						<li>
							<a href="" >南京农业大学</a>
						</li>
						<li>
							<a href="" >中国农业大学</a>
						</li>
						<li>
							<a href="" >合肥农业大学</a>
						</li>
						<li>
							<a href="" >西北农业大学</a>							
						</li>
																																	
						</ul>
						
	       	 	</div>
	       	 </div>
       	  </div>
       	  <script type="text/javascript">
	<!--
		  $(function(){
			  $("#loginButton").linkbutton();
			  $("#loginOutButton").linkbutton();
			  $("#regButton").linkbutton();
			  $("#loginButton").click(function(){
				 var loginname = $("#loginname").val();
				 var loginPassword = $("#loginPassword").val();
				 if(loginname==""||loginPassword=="") {
					 alert("请输入用户名或密码！");
					 return;
				 }
				 var param={
					 "user.username":loginname,
					 "user.password":loginPassword
				 };
				 $.ajax({
						async : false,
						type : "post",
						dataType : "json",
						data:param,
						url : "<%=path %>/login", 
						success : function(msg) {
							if(msg.code == 200){
								history.go(0);
							}else{
								alert(msg.msg);
							}
						}
				 });

			  });
			  
			  
		  } );
	//-->
	    	</script>
