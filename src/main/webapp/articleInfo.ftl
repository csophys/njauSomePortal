
<div  title="文章管理" id="main-body"  style="padding:20px" >
	       		<form id="articleUploadForm" method="post">
		       	    <div style="height:150px;width:100%;">
		       	    	<input type="hidden" name="currentTab" value="0"/>

		       	    	<input type="hidden" name="document.documentId" value="${((document.documentId)!0)?c}" />

		       	    	文章标题： 
		       	    	<input type="text" id="documentTitle" name="document.title" value="${(document.title)!''}" />
						<br /><br />
						文章模块：
						<select name="document.type" id="documentType">
								<option value="xmgg">项目公告</option>
								<option value="xsdt">学术动态</option>
								<option value="xmsm">项目介绍</option>
								<option value="xmzgc">项目组成</option>
								<option value="xglwyj">相关研究论文（中文）</option>
								<option value="xglwyje">相关研究论文（英文）</option>
								<option value="specialPaper">发表论文</option>
								<option value="workprocess">工作进展</option>
								<option value="glzd">管理制度</option>
								<option value="qjjs">轻简技术</option>
								<option value="zjdw">专家队伍</option>
								<option value="lxwm">联系我们</option>	
						</select>
						<!--
						添加日期：
						<input type="text" id="documentAddTime" name="document.addTime" value="${(document.addTime)!''}" onclick="WdatePicker()">
						-->
		       		</div>
		       		<div style="height:360px;width:100%;margin-top:-80px" >
		       			<textarea name="document.content"  id="ckeditor">${(document.content)!''}</textarea>
		       		</div>

		       		<div>
		       			<input class="easyui-linkbutton" id="submitArticle" type="button"  value="提交" />
		       		</div>
	       		</form>
	       		
</div >
<script>
	    $().ready(function (){

	        CKEDITOR.replace( 'ckeditor' );
	        
	        $("#documentType").val("${(document.type)!'xmgg'}");
	
	        if(("${(document.title)!''}")==''){
	        	$("#articleUploadForm").attr("action", "${base}/uploadArticle");
	        }
	        else{
	        	$("#articleUploadForm").attr("action", "${base}/updateArticle");	        	
	        }	

	        
	    	$("#submitArticle").click(function (){
				
	    		if($("#documentTitle").val()!=''&$("#documentAddTime").val()!=''){
	    			$("#articleUploadForm").submit();
	    		}
	    		else{
	    			alert("文章标题或者添加时间不能为空");
	    		}
    			
	    	});	        

	    });
</script>	    
		       	