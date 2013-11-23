<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<style type="text/css">
<!--

*{margin:0;padding:0;border:0;}
body {
font-family: arial, 宋体, serif;
          font-size:12px;
}


#menuNav {
    line-height: 24px;    list-style-type: none; background:#B0151B;
}

#menuNav a {
display: block; width: 80px; text-align:center;
}

#menuNav a:link    {
color:white; text-decoration:none;
}
#menuNav a:visited    {
color:white;text-decoration:none;
}
#menuNav a:hover    {
color:white;text-decoration:none;font-weight:bold;
}

#menuNav li {
float: left; width: 110px; background:#B0151B; /* 这里调整每一个li的长度 还有 颜色*/
}
#menuNav li a:hover{
background:#999;
}
#menuNav li ul {
line-height: 27px;    list-style-type: none;text-align:left;
left:-999em ;width: 180px; position: absolute; z-index: 9999
}
#menuNav li ul li{
float: left; width: 180px;
background: #F6F6F6; 
}


#menuNav li ul a{
display: block; width: 180px;width: 156px;text-align:left;padding-left:24px;
}

#menuNav li ul a:link    {
color:#666; text-decoration:none;
}
#menuNav li ul a:visited    {
color:#666;text-decoration:none;
}
#menuNav li ul a:hover    {
color:#F3F3F3;text-decoration:none;font-weight:normal;
background:#C00;
}

#menuNav li:hover ul {
left: auto;
}
#menuNav li.sfhover ul {
left: auto;
}
#content {
clear: left; 
}


-->
</style>

<script type=text/javascript><!--//--><![CDATA[//><!--
function menuFix() {
var sfEls = document.getElementById("menuNav").getElementsByTagName("li");
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
	       	   <div class="title">
	       	   </div>
	       	   <div id="menu">
					<ul id="menuNav">
					<li><a href="index.jsp">网站首页</a>
					</li>
					<li><a href="newsList?articleInfoDto.type=xmgg&pageSize=20&pageNo=1">科研动态</a>
					<ul>
					<li><a href="newsList?articleInfoDto.type=xmgg&pageSize=20&pageNo=1">项目公告</a></li>
					<li><a href="newsList?articleInfoDto.type=xsdt&pageSize=20&pageNo=1">项目动态</a></li>
					</ul>
					</li>
					<li><a href="newsList?articleInfoDto.type=xmsm&pageSize=20&pageNo=1">项目介绍</a>
					<ul>
					<li><a href="newsList?articleInfoDto.type=xmsm&pageSize=20&pageNo=1">项目简介</a></li>
					<li><a href="newsList?articleInfoDto.type=xmzgc&pageSize=20&pageNo=1">项目组成</a></li>
					</ul>
					</li>
					<li><a href="newsList?articleInfoDto.type=xglwyje&pageSize=20&pageNo=1">相关知识</a>
					<ul>
					<li><a href="newsList?articleInfoDto.type=xglwyj&pageSize=20&pageNo=1">相关研究论文（中文）</a></li>					
					<li><a href="newsList?articleInfoDto.type=xglwyje&pageSize=20&pageNo=1">相关研究论文（英文）</a></li>
					</ul>
					</li>
					
					<li><a href="newsList?articleInfoDto.type=specialPaper&pageSize=20&pageNo=1">项目进展</a>
					<ul>
					<li><a href="newsList?articleInfoDto.type=specialPaper&pageSize=20&pageNo=1">发表论文</a></li>
					<li><a href="newsList?articleInfoDto.type=workprocess&pageSize=20&pageNo=1">工作进展</a></li>
					</ul>
					</li>
					<li><a href="newsList?articleInfoDto.type=glzd&pageSize=20&pageNo=1">管理制度</a>
					</li>
					<li><a href="newsList?articleInfoDto.type=qjjs&pageSize=20&pageNo=1">轻简技术</a>
					</li>
				    <li><a href="newsList?articleInfoDto.type=zjdw&pageSize=20&pageNo=1">专家队伍</a>
					</li>
					<li><a href="newsList?articleInfoDto.type=lxwm&pageSize=20&pageNo=1">联系我们</a>
					</li>					
					</ul>
					
	       	   </div>
       </div>