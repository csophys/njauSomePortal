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
float: left; width: 120px; background:#B0151B; /* 这里调整每一个li的长度 还有 颜色*/
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
					<li><a href="#">产品介绍</a>
					<ul>
					<li><a href="#">产品一</a></li>
					<li><a href="#">产品一</a></li>
					<li><a href="#">产品一</a></li>
					<li><a href="#">产品一</a></li>
					<li><a href="#">产品一</a></li>
					<li><a href="#">产品一</a></li>
					</ul>
					</li>
					<li><a href="#">服务介绍</a>
					<ul>
					<li><a href="#">服务二</a></li>
					<li><a href="#">服务二</a></li>
					<li><a href="#">服务二</a></li>
					<li><a href="#">服务二服务二</a></li>
					<li><a href="#">服务二服务二服务二</a></li>
					<li><a href="#">服务二</a></li>
					</ul>
					</li>
					<li><a href="#">成功案例</a>
					<ul>
					<li><a href="#">案例三</a></li>
					<li><a href="#">案例</a></li>
					<li><a href="#">案例三案例三</a></li>
					<li><a href="#">案例三案例三案例三</a></li>
					</ul>
					</li>
					<li><a href="#">关于我们</a>
					<ul>
					<li><a href="#">我们四</a></li>
					<li><a href="#">我们四</a></li>
					<li><a href="#">我们四</a></li>
					<li><a href="#">我们四111</a></li>
					</ul>
					</li>
					
					<li><a href="#">在线演示</a>
					<ul>
					<li><a href="#">演示</a></li>
					<li><a href="#">演示</a></li>
					<li><a href="#">演示</a></li>
					<li><a href="#">演示演示演示</a></li>
					<li><a href="#">演示演示演示</a></li>
					<li><a href="#">演示演示</a></li>
					<li><a href="#">演示演示演示</a></li>
					<li><a href="#">演示演示演示演示演示</a></li>
					</ul>
					</li>
					<li><a href="#">联系我们</a>
					<ul>
					<li><a href="#">联系联系联系联系联系</a></li>
					<li><a href="#">联系联系联系</a></li>
					<li><a href="#">联系</a></li>
					<li><a href="#">联系联系</a></li>
					<li><a href="#">联系联系</a></li>
					<li><a href="#">联系联系联系</a></li>
					<li><a href="#">联系联系联系</a></li>
					</ul>
					</li>
					</ul>
	       	   </div>
       </div>