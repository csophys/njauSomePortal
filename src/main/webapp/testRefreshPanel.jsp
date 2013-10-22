<%@ taglib prefix="s" uri="/struts-tags" %>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css">
	<script type="text/javascript" src="js/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<div id="win" >

</div>
<a href="" id="test" class="easyui-linkbutton" >加载windows</a>

<script>
	$(function (){	
		$("#test").click(function(){
			$('#win').window({
			    width:600,
			    height:400,
			    modal:true
			});
			$('#win').window('refresh', 'http://localhost:8080/maveEclipseDemo/initArticle');
			return false;
		});
		
	})
	
</script>