<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div  title="文章管理" id="main-body"  style="padding:20px" >
	       		<form id="articleUploadForm" action="www.baidu.com" method="post">
		       	    <div style="height:150px;width:100%;">
		       	    	<input type="hidden" name="currentTab" value="0"/>
		       	    	<s:hidden name="document.documentId"></s:hidden>
			       		<s:textfield  id="documentTitle" name="document.title"  label="文章标题"></s:textfield>
						<br /><br />
						<s:select name="document.type" list="#{'新闻资讯':'新闻资讯','专家门诊':'专家门诊','工作快讯':'工作快讯','技术简报':'技术简报','病虫害识别与防控':'病虫害识别与防控'}" label="文章模块"></s:select>
						<!-- 
						<br /><br />	
						<s:radio label="是否置顶" name="document.isTop" list="#{'0':'否','1':'是'}"  >
						</s:radio>
						-->						 
						<!-- 添加时间 -->
						<br /><br/>
						<s:textfield id="documentAddTime" label="添加时间" name="document.addTime" onclick="WdatePicker()"></s:textfield>
		       		</div>
		       		

		       		<div style="height:460px;width:100%" >
		       			<s:textarea name="document.content"  id="ckeditor" rows="" cols=""></s:textarea>
		       		</div>

		       		<div>
		       			<input class="easyui-linkbutton" id="submitArticle" type="button"  value="提交" />
		       			<!-- 
		       			<a href="" class="easyui-linkbutton" id="submitArticle">提交</a>
		       			 -->
		       		</div>
	       		</form>
	       		
</div >
	
	<script type="text/javascript">
		/*
		uploadArticle
		*/
	    $().ready(function (){
	        CKEDITOR.replace( 'ckeditor' );

	        if(("<s:property  value='document.title'/>")==''){
	        	$("#articleUploadForm").attr("action", "uploadArticle");
	        }
	        else{
	        	$("#articleUploadForm").attr("action", "updateArticle");	        	
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