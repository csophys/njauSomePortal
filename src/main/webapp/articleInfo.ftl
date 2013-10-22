
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
							<option value="新闻资讯">新闻资讯</option>
							<option value="专家门诊">专家门诊</option>
							<option value="工作快讯">工作快讯</option>
							<option value="技术简报">技术简报</option>
							<option value="病虫害识别与防控">病虫害识别与防控</option>
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
	        
	        $("#documentType").val("${(document.type)!'新闻资讯'}");
	
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
		       	