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
	<link rel="stylesheet" type="text/css" href="<%=base %>css/newIndex.css">
	
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=base %>js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=base %>js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="<%=base %>js/pagination.js"></script> 	 
	<script type="text/javascript" src="<%=base %>js/My97DatePicker/WdatePicker.js"></script> 	
	<script type="text/Javascript" src="<%=base %>js/jquery.slides.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		 $(".preHide").show();
		 $("#imageArea").slidesjs({
			 	height:850,
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
	</head>
	<body>
		<div class="all">
		<jsp:include page="head.jsp"></jsp:include>
		<!-- 
<div class="title"></div>
<ol class="nav">
         <li class="zx-nav"><a href="index.do"><font color="#00830c">首页</font></a></li>
         <li><a href="news.do?method=showAll&amp;firstType=项目动态&amp;type=项目动态">项目动态</a></li>
         <li><a href="news.do?method=showAll&amp;firstType=通知通告&amp;type=通知通告">通知通告</a></li>
         <li><a href="news.do?method=showAll&amp;firstType=制度办法&amp;type=制度办法">制度办法</a></li>
         <li><a href="news.do?method=showAll&amp;firstType=科技成果&amp;type=科技成果">科技成果</a></li>
         <li><a href="news/txdtMore-new.jsp?firstType=体系动态">体系动态</a></li>
         <li style="background:none;"><a href="project.do?method=siteList">项目网站</a></li>
</ol>
 -->
<div class="left preHide"  style="display:none">
       	 	<div class="loginArea" style="width:100%;margin:10px 0 10px 0;text-align:center;">
       	 	<div class="bt-left">用户登陆</div> 
	       	 	<form id="login" class="preHide" action="adminManagement.jsp" method="post" >
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
		              <td><input type="button"  class="sfbutton" id="loginButton" value="登陆" /><input type="button" style="margin-left:10px" class="sfbutton" id="regButton" value="注册"/></td>
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
	       	 	 <input type="button" style="margin-top:20px;" class="sfbutton"  id="loginOutButton" value="退出" />
	       	 	</s:else>
		              
            	</table>
            	<!-- 
				<map name="Map"><area shape="rect" coords="3,3,36,19" onclick="document.getElementById('login').submit()"><area shape="rect" coords="40,3,78,18" onclick="document.getElementById('login').reset()"></map>            	
	       	 	 -->
	       	 	</form>
	       	 	</div>
<!-- 
<div class="welcomeuser">欢迎您，刘凤权、陈功友。 <input name="" type="button" value="退出平台" class="button04" onclick="logout()"></div>
 -->	
<div class="tztg">
          <div class="bt-left">项目公告</div>  
          <div class="more"><a href="news.do?method=showAll&amp;firstType=通知通告&amp;type=通知通告">更多&gt;&gt;</a></div> 
          <ul>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=4233" title="关于开展2009年度公益性行业（农业）科研专项经费项目验收工作的通知" target="_blank">关于开展2009年度公益性行业（农业）科研专项经费项目验收工作的通知</a><span>(10-28)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=3812" title="关于压减公益性行业（农业）科研专项2013年中央财政经费的预备通知" target="_blank">关于压减公益性行业（农业）科研专项2013年中央财政经费的预备通知</a><span>(07-12)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=3649" title="关于报送2009—2011年度公益性行业（农业）科研专项项目执行情况报告的通知" target="_blank">关于报送2009—2011年度公益性行业（农业）科研专项项目执行情况报告的通知</a><span>(06-08)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=3566" title="《2012年度农业轻简化实用技术汇编》一书已经正式出版发行" target="_blank">《2012年度农业轻简化实用技术汇编》一书已经正式出版发行</a><span>(05-16)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=3387" title="关于报送2013年度公益性行业（农业）科研专项项目执行专家组的通知" target="_blank">关于报送2013年度公益性行业（农业）科研专项项目执行专家组的通知</a><span>(04-08)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=2909" title="关于报送相关材料的通知" target="_blank">关于报送相关材料的通知</a><span>(01-16)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=2656" title="关于报送公益性行业（农业）科研专项2013年度任务书的通知" target="_blank">关于报送公益性行业（农业）科研专项2013年度任务书的通知</a><span>(12-13)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=2587" title="关于召开2013年度公益性行业（农业）科研专项启动会议的通知" target="_blank">关于召开2013年度公益性行业（农业）科研专项启动会议的通知</a><span>(11-29)</span></li>
          
              <li><a href="news.do?method=indexshow&amp;type=通知通告&amp;id=2496" title="关于报送2013年度公益性行业（农业）科研专项项目支出预算的通知" target="_blank">关于报送2013年度公益性行业（农业）科研专项项目支出预算的通知</a><span>(11-17)</span></li>
          
          </ul>                 
    </div>

<div class="cyjs" style="border-top: 1px dashed gray;">
          <div class="bt-left">项目进展</div>  
          <div class="more"><a href="news/txdtMore-new.jsp?firstType=体系动态">更多&gt;&gt;</a></div> 
          <ul>
                    
               <li><a href="news/txdtView-new.jsp?id=24931" title="河北省淡水养殖创新团队与国家产业技术体系对接暨淡水养殖创新技术培训班在廊坊召开" target="_blank">河北省淡水养殖创新团队与国家产业技术体系对接暨淡水养殖创新技术培训班在廊坊召开</a><span>(11-08)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24911" title="国家肉鸡产业技术体系与山东省家禽产业创新团队对接合作" target="_blank">国家肉鸡产业技术体系与山东省家禽产业创新团队对接合作</a><span>(11-05)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24883" title="花生联合收获技术研发取得新突破——创制出高效四行半喂入花生联合收获技术装备" target="_blank">花生联合收获技术研发取得新突破——创制出高效四行半喂入花生联合收获技术装备</a><span>(10-31)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24862" title="国家绒毛用羊产业技术体系细毛羊育种工作会议纪要" target="_blank">国家绒毛用羊产业技术体系细毛羊育种工作会议纪要</a><span>(10-28)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24837" title="兔体系专家积极指导应对台风灾害和灾后重建" target="_blank">兔体系专家积极指导应对台风灾害和灾后重建</a><span>(10-21)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24683" title="《农业首席科学家十人谈》节目访谈奶牛体系首席访谈录" target="_blank">《农业首席科学家十人谈》节目访谈奶牛体系首席访谈录</a><span>(09-18)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24631" title="林菌生态间作奇葩在玛纳斯绽放" target="_blank">林菌生态间作奇葩在玛纳斯绽放</a><span>(09-06)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24630" title="国家食用菌产业技术体系第二届产业技术交流会在南宁召开" target="_blank">国家食用菌产业技术体系第二届产业技术交流会在南宁召开</a><span>(09-06)</span></li>
                     
               <li><a href="news/txdtView-new.jsp?id=24517" title="霉心病研究新思路" target="_blank">霉心病研究新思路</a><span>(08-19)</span></li>
           
          </ul>                 
    </div>
</div>
<div class="right preHide" style="display:none">
     <div class="news" >
       		<div id="imageArea" style="height:100%;width:100%;float:left;">
				
	       	  		<img src="images/newsImages/1.jpg" height="100%" />
	       	  		<img src="images/newsImages/2.jpg" height="100%"/>
	       	  		<img src="images/newsImages/3.jpg" height="100%"/>
	       	  		<img src="images/newsImages/4.jpg" height="100%"/>
 
       		</div>
     </div>
    <div class="yfdt">
        <div class="bt-left">项目动态</div> 
        <div class="more"><a href="news.do?method=showAll&amp;firstType=项目动态&amp;type=项目动态">更多&gt;&gt;</a></div> 
		<ul>
			
				<li><span class="date">[2013-10-08]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=4098" title="“苜蓿饲草料生产机械化关键工艺及装备的研发与示范”项目组赴美国南达科他州考察" target="_blank">“苜蓿饲草料生产机械化关键工艺及装备的研发与示范”项目组赴美国南达科他州考察</a></span></li>
			
				<li><span class="date">[2013-09-09]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=4046" title="DUS测试品种信息DNA测试技术研究2013年8月份项目动态" target="_blank">DUS测试品种信息DNA测试技术研究2013年8月份项目动态</a></span></li>
			
				<li><span class="date">[2013-09-06]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=4025" title="公益性行业（农业）科研专项“主要农畜产品品质安全快速检测关键技术与装备研究示范”项目”两项成果通过教育部科技成果鉴定" target="_blank">公益性行业（农业）科研专项“主要农畜产品品质安全快速检测关键技术与装备研究示范”项目”两项成果通过教育部科技成果鉴定</a></span></li>
			
				<li><span class="date">[2013-09-05]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=4015" title="公益性行业（农业）科研专项“农产品产供安全过程管控技术研究与示范项目”云南会议纪要" target="_blank">公益性行业（农业）科研专项“农产品产供安全过程管控技术研究与示范项目”云南会议纪要</a></span></li>
			
				<li><span class="date">[2013-09-02]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=4005" title="《蓖麻产业技术研究与试验示范》项目2013年上半年工作总结会在吉林白城召开" target="_blank">《蓖麻产业技术研究与试验示范》项目2013年上半年工作总结会在吉林白城召开</a></span></li>
			
				<li><span class="date">[2013-08-30]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=3999" title="公益性行业（农业）科研专项“北方旱地合理耕层构建技术及配套耕作机具研究与示范”开展田间观摩交流暨检查活动" target="_blank">公益性行业（农业）科研专项“北方旱地合理耕层构建技术及配套耕作机具研究与示范”开展田间观摩交流暨检查活动</a></span></li>
			
				<li><span class="date">[2013-08-28]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=3897" title="2013年7月工作总结" target="_blank">2013年7月工作总结</a></span></li>
			
				<li><span class="date">[2013-08-26]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=3988" title="行业科技“干制辣椒”项目育成的两个雄性不育系通过云南省种子管理站组织的专家鉴定" target="_blank">行业科技“干制辣椒”项目育成的两个雄性不育系通过云南省种子管理站组织的专家鉴定</a></span></li>
			
				<li><span class="date">[2013-08-24]</span><span class="t"><a href="news.do?method=indexshow&amp;type=研发动态&amp;id=3983" title="公益性行业（农业）科研专项“作物细菌性病害防控技术研究与示范”现场会在江苏泗阳召开" target="_blank">公益性行业（农业）科研专项“作物细菌性病害防控技术研究与示范”现场会在江苏泗阳召开</a></span></li>
			
		</ul>
    </div>
    <div class="xmwz documentList">
    <div class="bt-left">相关知识</div> 
    <div class="more"><a href="project.do?method=siteList">更多&gt;&gt;</a></div>
    <div >
    <!-- 
    <marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="2" direction="up" width="100%" height="160px">
 	-->      
      <table width="99%" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    
    <td width="50%">
          <div class="wzl1">
          <ul>
          
              <li><a href="http://shrimp.fishinfo.cn/default.asp" title="对虾养殖管理信息系统研究与建立" target="_blank">对虾养殖管理信息系统研究与建立</a></li>
					
              <li><a href="http://phy.njau.edu.cn:8017/" title="重要农作物疫病菌主要致病型及其分布" target="_blank">重要农作物疫病菌主要致病型及其分布</a></li>
					
              <li><a href="http://xjfkxz.njau.edu.cn" title="白叶枯病菌和条斑病菌小种与寄主品种抗性鉴定" target="_blank">白叶枯病菌和条斑病菌小种与寄主品种抗性鉴定</a></li>
					
              <li><a href="http://www.mushroomsci.org/" title="食用菌菌种质量评价与菌种信息系统研究与建立" target="_blank">食用菌菌种质量评价与菌种信息系统研究与建立</a></li>
					
              <li><a href="http://www.chinaoat.com" title="优质燕麦生产与加工技术研究" target="_blank">优质燕麦生产与加工技术研究</a></li>
					
              <li><a href="http://www.forage.org.cn/" title="人工草地优质牧草生产技术研究与示范" target="_blank">人工草地优质牧草生产技术研究与示范</a></li>
					
              <li><a href="http://www.chinablueberry.com" title="小浆果品种筛选及标准化生产技术研究" target="_blank">小浆果品种筛选及标准化生产技术研究</a></li>
					
              <li><a href="http://www.948litchi.cn" title="荔枝果园改造及保鲜、加工技术研究" target="_blank">荔枝果园改造及保鲜、加工技术研究</a></li>
					
              <li><a href="http://www.flatfishfarming.ac.cn" title="鮃鰈类全雌苗种大规模培育技术研究" target="_blank">鮃鰈类全雌苗种大规模培育技术研究</a></li>
					
              <li><a href="http://www.crabinfo.org/index.jsp" title="优质蟹种规模化繁育与养殖示范" target="_blank">优质蟹种规模化繁育与养殖示范</a></li>
					
              <li><a href="http://www.dbmcn.org" title="小菜蛾可持续防控技术研究与示范" target="_blank">小菜蛾可持续防控技术研究与示范</a></li>
					
              <li><a href="http://dfsfk.hzau.edu.cn/" title="水稻褐飞虱综合防控技术研究" target="_blank">水稻褐飞虱综合防控技术研究</a></li>
					
              <li><a href="http://www.fruit-borer.com/" title="北方果树食心虫监测和防控新技术研究与示范" target="_blank">北方果树食心虫监测和防控新技术研究与示范</a></li>
					
              <li><a href="http://pig.njau.edu.cn" title="猪流行性乙型脑炎防控技术研究与示范" target="_blank">猪流行性乙型脑炎防控技术研究与示范</a></li>
					
              <li><a href="http://www.chinasscontrol.com" title="猪链球菌病生物灾害防控技术研究与示范" target="_blank">猪链球菌病生物灾害防控技术研究与示范</a></li>
					
              <li><a href="http://www.sdqbxb.ccoo.cn/" title="鸡白血病流行病学和防控措施的示范性研究" target="_blank">鸡白血病流行病学和防控措施的示范性研究</a></li>
					
              <li><a href="http://www.thrips.com.cn" title="外来入侵害虫西花蓟马防控技术研究与示范" target="_blank">外来入侵害虫西花蓟马防控技术研究与示范</a></li>
					
              <li><a href="http://www.cnnm.org.cn/" title="最佳养分管理技术研究与应用" target="_blank">最佳养分管理技术研究与应用</a></li>
					
              <li><a href="http://www.tyxxh.cn" title="主要农作物调优栽培信息化技术" target="_blank">主要农作物调优栽培信息化技术</a></li>
					
              <li><a href="http://www.pausal.org.cn/" title="盐碱地农业高效利用配套技术模式研究与示范" target="_blank">盐碱地农业高效利用配套技术模式研究与示范</a></li>
					
              <li><a href="http://www.climag.com/" title="气候变化对农业生产的影响及应对技术研究" target="_blank">气候变化对农业生产的影响及应对技术研究</a></li>
					
              <li><a href="http://cb.natesc.gov.cn/sites/cb/List_28092_137108.html" title="主要农作物有害生物种类与发生危害特点研究" target="_blank">主要农作物有害生物种类与发生危害特点研究</a></li>
					
              <li><a href="http://www.ysfri.ac.cn/fisheryenhancement/" title="黄渤海生物资源调查与养护技术研究" target="_blank">黄渤海生物资源调查与养护技术研究</a></li>
					
              <li><a href="http://www.webcrop.cn/" title="小麦苗情数字远程监控与诊断管理关键技术" target="_blank">小麦苗情数字远程监控与诊断管理关键技术</a></li>
					
              <li><a href="http://www.caastcs.com/zgmp/" title="不同生态区优质珍贵毛皮生产关键技术研究" target="_blank">不同生态区优质珍贵毛皮生产关键技术研究</a></li>
					
          </ul>
          </div>
    </td>
	<td>
         <div class="wzl1">
          <ul>
			
              <li><a href="http://www.chinacarrot.net" title="新型胡萝卜产业化技术体系研发及示范" target="_blank">新型胡萝卜产业化技术体系研发及示范</a></li>
					
              <li><a href="http://www.chinaavf.com/hykj.asp" title="水生蔬菜产业技术体系研究与示范" target="_blank">水生蔬菜产业技术体系研究与示范</a></li>
					
              <li><a href="http://www.cncjs.org/" title="葱姜蒜产业发展关键技术研究与开发" target="_blank">葱姜蒜产业发展关键技术研究与开发</a></li>
					
              <li><a href="http://www.greatlocust.com/" title="我国迁移性蝗害绿色防控技术研究与示范" target="_blank">我国迁移性蝗害绿色防控技术研究与示范</a></li>
					
              <li><a href="http://www.xlrdzwy.com/zhiwuyuan/Xshow.asp?mb=yjs&amp;pid=1020&amp;id=115" title="热带特色香辛饮料作物产业技术研究与示范" target="_blank">热带特色香辛饮料作物产业技术研究与示范</a></li>
					
              <li><a href="http://www.pearl-chn.com/" title="珍珠养殖技术研究与示范" target="_blank">珍珠养殖技术研究与示范</a></li>
					
              <li><a href="http://www.mtpest.cn/" title="入境台湾果蔬危险性有害生物防控新技术研究与示范" target="_blank">入境台湾果蔬危险性有害生物防控新技术研究与示范</a></li>
					
              <li><a href="http://www.fishbreeding.org/hyzx" title="水产分子育种共性技术的建立与应用" target="_blank">水产分子育种共性技术的建立与应用</a></li>
					
              <li><a href="http://www.tephritid.com" title="果树实蝇类害虫监测与防控技术研究" target="_blank">果树实蝇类害虫监测与防控技术研究</a></li>
					
              <li><a href="http://www.qlsd.org" title="丘陵山地小型农机具技术研究与示范" target="_blank">丘陵山地小型农机具技术研究与示范</a></li>
					
              <li><a href="http://www.greenpesticide.com/web/htm/hy/" title="生物源农药创制与技术集成及产业化开发" target="_blank">生物源农药创制与技术集成及产业化开发</a></li>
					
              <li><a href="http://www.ieprcm.org" title="根茎类作物生产机械化关键技术提升与装备优化研究" target="_blank">根茎类作物生产机械化关键技术提升与装备优化研究</a></li>
					
              <li><a href="http://spidermite.njau.edu.cn/" title="作物叶螨综合防控技术研究与示范推广" target="_blank">作物叶螨综合防控技术研究与示范推广</a></li>
					
              <li><a href="http://www.cnnm.org.cn/" title="农作物最佳养分管理技术研究与应用" target="_blank">农作物最佳养分管理技术研究与应用</a></li>
					
              <li><a href="http://www.cymyw.cn/" title="牧区生态高效草原牧养技术模式研究与示范" target="_blank">牧区生态高效草原牧养技术模式研究与示范</a></li>
					
              <li><a href="http://pd.jaas.ac.cn/" title="灰飞虱传播的病毒病综合防控技术研究与示范" target="_blank">灰飞虱传播的病毒病综合防控技术研究与示范</a></li>
					
              <li><a href="http://www.mybacteria.cn" title="西甜瓜种传细菌性果斑病综合防控技术研究与示范" target="_blank">西甜瓜种传细菌性果斑病综合防控技术研究与示范</a></li>
					
              <li><a href="http://ccr.ynau.edu.cn/" title="十字花科作物根肿病防控技术研究与示范" target="_blank">十字花科作物根肿病防控技术研究与示范</a></li>
					
              <li><a href="http://www.bovinedc.com/jxsc/index.asp" title="家畜生产运输过程中环境应激响应及调控技术研究" target="_blank">家畜生产运输过程中环境应激响应及调控技术研究</a></li>
					
              <li><a href="http://www.hrfri.ac.cn/lengshuiyu/index.asp" title="冷水性鱼类养殖产业化研究与示范" target="_blank">冷水性鱼类养殖产业化研究与示范</a></li>
					
              <li><a href="http://ranch.scsfri.ac.cn/" title="人工海洋牧场高效利用配套技术模式研究与示范" target="_blank">人工海洋牧场高效利用配套技术模式研究与示范</a></li>
					
              <li><a href="http://sycy.yangtzeu.edu.cn/index.asp" title="鳝鱼产业技术研究与试验示范" target="_blank">鳝鱼产业技术研究与试验示范</a></li>
					
              <li><a href="http://www.ndpbrf.com/" title="大宗农作物产地污染物阻控关键技术研究与示范" target="_blank">大宗农作物产地污染物阻控关键技术研究与示范</a></li>
					
              <li><a href="http://www.aquaticanimal.org" title="珍稀水生动物繁育与物种保护技术研究" target="_blank">珍稀水生动物繁育与物种保护技术研究</a></li>
					
              <li><a href="http://www.bayberry.com.cn/" title="杨梅产业化关键技术研究与示范" target="_blank">杨梅产业化关键技术研究与示范</a></li>
					
          </ul>
          </div>
    </td>
			
    </tr>
    </tbody></table>
    
  <!-- 
    </marquee>
 -->   			   	    
    </div>
    </div>
    <div class="zdbf">
     <div class="bt-left">管理制度</div> 
    <div class="more"><a href="news.do?method=showAll&amp;firstType=制度办法&amp;type=制度办法">更多&gt;&gt;</a></div>
	<ul class="keep">
		
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=制度办法&amp;id=315" title="公益性行业（农业）科研专项信用评价办法（试行）" target="_blank">公益性行业（农业）科研专项信用评价办法（试行）</a></li>
		
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=制度办法&amp;id=318" title="公益性行业（农业）科研专项经费管理实施细则" target="_blank">公益性行业（农业）科研专项经费管理实施细则</a></li>
		
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=制度办法&amp;id=317" title="公益性行业科研专项经费管理试行办法" target="_blank">公益性行业科研专项经费管理试行办法</a></li>
		
	</ul>
    </div>
     <div class="kjcg">
     <div class="bt-left">轻简技术</div> 
    <div class="more"><a href="news.do?method=showAll&amp;firstType=科技成果&amp;type=科技成果">更多&gt;&gt;</a></div>
    <ul class="keep">
	
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=科技成果&amp;id=456" title="十一五成果--农业资源环境保护与可持续利用技术" target="_blank">十一五成果--农业资源环境保护与可持续利用技术</a></li>
	
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=科技成果&amp;id=455" title="十一五成果--动植物病虫害防控技术" target="_blank">十一五成果--动植物病虫害防控技术</a></li>
	
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=科技成果&amp;id=454" title="十一五成果--轻简高效种养技术" target="_blank">十一五成果--轻简高效种养技术</a></li>
	
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=科技成果&amp;id=453" title="十一五成果--动植物新品种选育与应用" target="_blank">十一五成果--动植物新品种选育与应用</a></li>
	
		<li><span>[2010-12-16]</span><a href="news.do?method=indexshow&amp;type=科技成果&amp;id=452" title="十一五农业行业科技创新成果汇编前言及目录" target="_blank">十一五农业行业科技创新成果汇编前言及目录</a></li>
	
    </ul>
    </div>
</div>
 	<jsp:include page="bottom.jsp"></jsp:include>
</div>
	</body>
</html>