  	<%    
		String path = request.getContextPath();    
		String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
	%> 
	
       <div id="header" data-options="region:'north'">
       		<div data-options="fit:true">
	       	   <div id="banner">
	       	   </div>
	       	   <div id="menu" >
	       	   <script type='text/javascript' src='<%=base %>js/quickmenu.js'></script>
	       	   </div>
       	   </div>
       </div>