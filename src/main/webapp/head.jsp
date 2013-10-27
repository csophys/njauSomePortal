<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<style type="text/css">
<!--

*{margin:0;padding:0;border:0;}
body {
font-family: arial, 宋体, serif;
          font-size:12px;
}


#nav {
    line-height: 24px;    list-style-type: none; background:#B0151B;
}

#nav a {
display: block; width: 80px; text-align:center;
}

#nav a:link    {
color:white; text-decoration:none;
}
#nav a:visited    {
color:white;text-decoration:none;
}
#nav a:hover    {
color:white;text-decoration:none;font-weight:bold;
}

#nav li {
float: left; width: 110px; background:#B0151B; /* 这里调整每一个li的长度 还有 颜色*/
}
#nav li a:hover{
background:#999;
}
#nav li ul {
line-height: 27px;    list-style-type: none;text-align:left;
left: -999em; width: 180px; position: absolute; 
}
#nav li ul li{
float: left; width: 180px;
background: #F6F6F6; 
}


#nav li ul a{
display: block; width: 180px;width: 156px;text-align:left;padding-left:24px;
}

#nav li ul a:link    {
color:#666; text-decoration:none;
}
#nav li ul a:visited    {
color:#666;text-decoration:none;
}
#nav li ul a:hover    {
color:#F3F3F3;text-decoration:none;font-weight:normal;
background:#C00;
}

#nav li:hover ul {
left: auto;
}
#nav li.sfhover ul {
left: auto;
}
#content {
clear: left; 
}


-->
</style>

<script type=text/javascript><!--//--><![CDATA[//><!--
function menuFix() {
var sfEls = document.getElementById("nav").getElementsByTagName("li");
for (var i=0; i<sfEls.length; i++) {
    sfEls[i].onmouseover=function() {
    this.className+=(this.className.length>0? " ": "") + "sfhover";
    }
    sfEls[i].onMouseDown=function() {
    this.className+=(this.className.length>0? " ": "") + "sfhover";
    }
    sfEls[i].onMouseUp=function() {
    this.className+=(this.className.length>0? " ": "") + "sfhover";
    }
    sfEls[i].onmouseout=function() {
    this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),

"");
    }
}
}
window.onload=menuFix;

//--><!]]>
</script>	

       <div id="header">
	       	   <div id="banner">
	       	   </div>
	       	   <div id="menu" style="text-align:center;" >
					<ul id="nav">
					<li><a href="index.jsp">网站首页</a>
					</li>
					<li><a href="#">科研动态</a>
					<ul>
					<li><a href="#">项目公告</a></li>
					<li><a href="#">学术动态</a></li>
					<li><a href="#">图片新闻</a></li>
					</ul>
					</li>
					<li><a href="#">项目介绍</a>
					<ul>
					<li><a href="#">项目说明</a></li>
					<li><a href="#">项目组构成</a></li>
					<li><a href="#">相关研究论文</a></li>
					<li><a href="#">研究队伍</a></li>
					</ul>
					</li>
					<li><a href="#">相关知识</a>
					<ul>
					<li><a href="#">相关研究论文（英文）</a></li>
					<li><a href="#">水稻细菌性病害研究论文（中文）</a></li>
					<li><a href="#">水稻细菌性病害学位论文（中文）</a></li>
					</ul>
					</li>
					
					<li><a href="#">项目进展</a>
					<ul>
					<li><a href="#">标注（nyhyzx07-056)支持的论文</a></li>
					<li><a href="#">工作进展</a></li>
					</ul>
					</li>
					<li><a href="#">远程诊断</a>
					<ul>
					<li><a href="#">图文诊断</a></li>
					<li><a href="#">视频诊断</a></li>
					<li><a href="#">其他诊断</a></li>
					</ul>
					</li>
					<li><a href="#">专家答疑</a>
					</li>
				    <li><a href="#">专家队伍</a>
					</li>
					<li><a href="#">联系我们</a>
					</li>					
					</ul>
					
	       	   </div>
       </div>