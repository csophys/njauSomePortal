$(document).ready(function() {

	$('.edit').editable('case/updateFieldByCaseId', {
		indicator : "保存中…",
		tooltip : "双击修改...",
		style : "inherit",
		cancel : '取消',
		submitdata : function(value, settings) {
			return {
				"cscCase.id" : 12
			};
		},
		type : 'select',
		event : 'dblclick',
		data : "{'1':'普通','2':'紧急'}",
		callback : function(value, settings) {
			$("#priority").text("sfs");
		}
	});

	$(".editImgIcon").bind("dblclick", function() {
		$(this).prev().trigger("dblclick");
	});

	$('#uploadify').uploadify({
		'swf' : 'uploadify/uploadify.swf',
		'buttonText' : '选择一张图片',// 浏览按钮
		'uploader' : 'uploadFile',
		'width' : '100',
		'height' : '32',
		'fileObjName' : 'uploadify',
		'fileSizeLimit' : '8000KB',
		'fileTypeDesc' : '请选择图片文件',
		'fileTypeExts' : '*.jpg;*.png;*.bmp;*.gif',
		'auto' : true,
		'multi' : false,
		'onUploadSuccess' : function(file, data, response) {
			// $("#imagePreview").html("<img src='"+data+"'><img>");
			$("#imagePath").val(data);

		}

	});

});