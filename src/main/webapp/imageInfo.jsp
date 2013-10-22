<%@ taglib prefix="s" uri="/struts-tags" %>

	<link rel="stylesheet" type="text/css" href="js/uploadify/uploadify.css">
 	<script type="text/javascript" src="js/uploadify/jquery.uploadify.min.js"></script>

<div  style="padding:20px">
	       		<form id="imageUploadForm" action="" method="post">
		       	 	<div style="height:150px;width:100%;">
		       	 		<s:hidden name="image.imageId"></s:hidden>
			       		<s:textfield name="image.title" label="图片标题" id="imageTitle" cssStyle="width:200px"></s:textfield>
						<br /><br />
						<!-- 
						<s:select name="image.imageTag" list="#{'0':'新闻','1':'展示'}" label="图片标签"></s:select>
						<br /><br />
 						-->						
						<s:radio label="首页展示" name="image.isShowOnIndex" list="%{#{'0':'否','1':'是'}}"  >
						</s:radio>
						<br/><br />			
						<s:textfield name="image.imageUrl" label="图片链接"  cssStyle="width:200px"></s:textfield>
						<br /><br />
						<s:textfield name="image.filePath" id="imagePath" readonly="true"  cssStyle="width:300px" label="图片路径" ></s:textfield>								
		       		</div>
	       			<div style="float:left;margin-right: 30px">
	       				<input type="file" name="uploadify" id="uploadify"  />
	       			</div>
		   		<div>
		   			<input class="easyui-linkbutton" id="submitImage" type="button"  value="提交" />
		   		</div>	       			
	       		</form>
	       		<div id = "imagePreview">
	       		</div>
</div>

<script>
	$(function(){
		uploadImageEvent();		
        if(("<s:property  value='image.title'/>")==''){
        	$("#imageUploadForm").attr("action", "uploadImage");
        }
        else{
        	$("#imageUploadForm").attr("action", "updateImage");	        	
        }
	})
	
	//上传图片事件相关
function uploadImageEvent(){
	
    $("#submitImage").click(function(){
		if($("#imageTitle").val()!=''){
			$("#imageUploadForm").submit();			
		}
		else{
			alert("标题不能为空");
		}

    	return false;
    });
    
    
    $('#uploadify').uploadify({
        'swf'      : 'js/uploadify/uploadify.swf',
        'buttonText' : '选择图片',//浏览按钮
        'uploader' : 'uploadFile',
        'width':'100',
        'height':'32',
        'fileObjName':'uploadify',
        'fileSizeLimit':'8000KB',
        'fileTypeDesc':'请选择图片文件',
        'fileTypeExts':'*.jpg;*.png;*.bmp;*.gif',
        'auto':true,
        'multi':false,
        'onUploadSuccess' : function(file, data, response) {
            //$("#imagePreview").html("<img src='"+data+"'><img>");
            $("#imagePath").val(data);

        }        
        
    });
}

</script>