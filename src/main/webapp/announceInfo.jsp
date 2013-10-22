<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

  <div style="padding:20px">
  		<form id="announceUploadForm" method="post">
   	 	<div style="height:100px;width:100%;">
    		<s:textfield name="announce.title"  id="announceTitle" label="公告标题" cssStyle="width:200px"></s:textfield>
    	    <s:hidden name="announce.id"></s:hidden>
<br /><br />
<s:textfield name="announce.url" label="公告链接" id="announceUrl" cssStyle="width:200px"></s:textfield>
   		</div>
   		<div>
   			<input class="easyui-linkbutton" id="submitAnnounce" type="button"  value="提交" />
   		</div>		       		
		
  		</form>
  </div>
  
  <script type="text/javascript">
	    $().ready(function (){

	        if(("<s:property  value='announce.title'/>")==''){
	        	$("#announceUploadForm").attr("action", "uploadAnnounce");
	        }
	        else{
	        	$("#announceUploadForm").attr("action", "updateAnnounce");	        	
	        }	

	        
	    	$("#submitAnnounce").click(function (){
				
	    		if($("#announceTitle").val()!=''){
	    			$("#announceUploadForm").submit();
	    		}
	    		else{
	    			alert("公告标题不能为空");
	    		}
    			
	    	});	        

	    });
	    
	</script>