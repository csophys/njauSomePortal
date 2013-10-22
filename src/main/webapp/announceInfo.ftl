  <div style="padding:20px">
    		<form id="announceUploadForm" method="post">
   	 	<div style="height:100px;width:100%;">
   	    	文章标题： 
   	    	<input type="text" id="announceTitle" name="announce.title" style="width:200px" value="${(announce.title)!''}" />

		    <input type="hidden" name="announce.id" value="${((announce.id)!0)?c}" />    	    
		<br /><br />
    	公告链接： 
    	<input type="text" id="announceUrl" name="announce.url" style="width:200px" value="${(announce.url)!''}" />
    	
   		</div>
   		<div>
   			<input class="easyui-linkbutton" id="submitAnnounce" type="button"  value="提交" />
   		</div>		       		
		
  		</form>
  </div>
  
  <script type="text/javascript">
	    $().ready(function (){

	        if(("${(announce.title)!''}")==''){
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
