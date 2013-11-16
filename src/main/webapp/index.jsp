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
	<script type="text/javascript" src="<%=base %>js/My97DatePicker/WdatePicker.js"></script> 	
	<script type="text/Javascript" src="<%=base %>js/jquery.slides.min.js"></script>

	<style type="text/css">
	.link-button{
		background-color: green;
		padding:3px
	}
	</style>	

	
</head>
			
<script type="text/javascript">
	$(document).ready(function(){
		 $(".preHide").css("display","block");
		 $("#imageArea").slidesjs({
		        play: {
		            active: false,
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
		          },
				 navigation: {
				      active: false
				 },
				 pagination: {
				      active: false
				    }				 
		      });

	})
	</script>	
		

<body >
   <!-- 网站主体 -->
   <div  id="website-body" >
   
   <!-- header部门，包括banner和menu -->
   <jsp:include page="head.jsp"></jsp:include>

   <!-- main body，中间部分 -->

		<div id="main" class="showBorder" style="height:500px;width:100%" >       
       	<div class="showBorder" style="height:280px;width:100%;border-bottom: 1px dashed grey;margin-bottom: 5px;padding-bottom: 5px">
       		<div id="imageArea" class="showBorder" style="height:100%;width:49%;float:left;">
				
	       	  		<img src="images/newsImages/1.jpg" />
	       	  		<img src="images/newsImages/2.jpg" />
	       	  		<img src="images/newsImages/3.jpg" />
	       	  		<img src="images/newsImages/4.jpg" />
 
       		</div>
       		<div id="projectAnnounce" class="showBorder" style="margin-left:10px;height:100%;width:25%;float:left">
       				<img src="images/gongao.gif" width="244" height="25" />
					 <ul id="announceList" style="margin-left:5px" >

  						<s:iterator value="@njau.org.action.DocumentAction@findDocument('项目公告')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px"></span>
							</li>
						</s:iterator>

					</ul>       		
       		</div>
       		<div id="loginArea" class="showBorder" style="height:100%;width:22%;float:left">
	       	 	<table  border="0" cellspacing="0" cellpadding="0" style="margin:100px 0 0 10px;width:100%">
	
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
		              </tr>
		            </tbody>	       	 	
	       	 	</s:if>
	       	 	<s:else>
	       	 	<span style="margin-top:20px;text-align:center;font-size:16px">欢迎你！<s:property value="#session['username']"/></span>
	       	 	
	       	 	<br/>
	       	 	 <a style="margin-top:20px;" href="loginOut" id="loginOutButton" class="link-button">退出</a>
	       	 	</s:else>
		              
            	</table>				       		
       		</div>
       	</div>
       	<div class="showBorder" style="height:55%">
       		<div id="projectProgress" class="showBorder" style="height:100%;width:25%;float:left">
       		<img src="images/jinzhan.gif" width="244" height="25" />
					 <ul class="newsList" >

  						<s:iterator value="@njau.org.action.DocumentAction@findListByMultipleType('标注(nyhyzx07-056)支持的论文,工作进展')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px"></span>
							</li>
						</s:iterator>

					</ul>        		
       		</div>
      		<div id="relatedknowlegde" class="showBorder" style="height:100%;width:24%;float:left">
				 <img src="images/xiangguanzhishi.gif" width="244" height="25" />      		
					 <ul class="newsList" >

  						<s:iterator value="@njau.org.action.DocumentAction@findListByMultipleType('相关研究论文（英文）,水稻细菌性病害研究论文（中文）,水稻细菌性病害学位论文（中文）')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:10px"></span>
							</li>
						</s:iterator>

					</ul>       		
       		</div>       		
       		<div id="remoteDiagnose" class="showBorder" style="height:100%;width:25%;float:left">
				 <img src="images/yuancheng.gif" width="244" height="25" />       		
					 <ul class="newsList" >

  						<s:iterator value="@njau.org.action.DocumentAction@findListByMultipleType('图文诊断,视频诊断,其他诊断')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px"></span>
							</li>
						</s:iterator>

					</ul>        		
       		</div>
       		<div id="professialQAndA" class="showBorder" style="height:100%;width:25%;float:left">
				  <img src="images/dayi.gif" width="244" height="25" />       		
					 <ul class="newsList" >

  						<s:iterator value="@njau.org.action.DocumentAction@findDocument('专家答疑')">
							<li>
							<span style="float:left;width: 60%;height:28px;overflow:hidden"><a  href="newsDetail?document.documentId=<s:property value='documentId'/>" ><s:property value="title" /></a></span><span style="margin-left:30px"></span>
							</li>
						</s:iterator>

					</ul>        		
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