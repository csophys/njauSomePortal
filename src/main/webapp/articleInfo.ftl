
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
							<option value="项目公告">项目公告</option>
							<option value="学术动态">学术动态</option>
							<option value="图片新闻">图片新闻</option>
							<option value="项目说明">项目说明</option>
							<option value="项目组构成">项目组构成</option>
							<option value="相关研究论文">相关研究论文</option>
							<option value="研究队伍">研究队伍</option>
							<option value="相关研究论文">相关研究论文 (英文)</option>
							<option value="水稻细菌性病害研究论文">水稻细菌性病害研究论文(中文)</option>
							<option value="水稻细菌性病害学位论文">水稻细菌性病害学位论文 (中文) </option>
							<option value="标注">标注(nyhyzx07-056)支持的论文</option>
							<option value="工作进展">工作进展</option>
							<option value="图文诊断">图文诊断</option>
							<option value="视频诊断">视频诊断</option>
							<option value="其他诊断">其他诊断</option>
							<option value="专家答疑">专家答疑</option>
							<option value="专家队伍">专家队伍</option>
							<option value="联系我们">联系我们</option>
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
	        
	        $("#documentType").val("${(document.type)!'项目公告'}");
	
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
		       	