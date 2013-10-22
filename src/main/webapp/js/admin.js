$(function() {

	if ($("#role").text() != "admin") {
		alert("你没有操作本页面的权限！");
		return;
	}
	initCurrentTab();

});

var articleDataGridTable;
function initDocumentSearchArea() {

	articleDataGridTable = createArticleDataGridTable();

	$('#SearchForCondition').bind('click', function() {
		searchDocumentList();
	});

}

function searchDocumentList() {

	var type = $.trim($('#articleTag').combobox('getValue'));

	var queryParams = {
		'articleInfoDto.type' : type
	};

	if (queryParams == null)
		return;

	articleDataGridTable.show(queryParams);

}

function createArticleDataGridTable() {
	var options = {
		fitColumns : true,
		pagination : true,
		singleSelect : true,
		columns : [ [ {
			field : 'title',
			title : '标题',
			width : 200
		}, {
			field : 'type',
			title : '模块',
			width : 100
		}, {
			field : 'addTime',
			title : '添加时间',
			width : 100
		}, {
			field : 'updateTime',
			title : '更新时间',
			width : 100
		} ] ],
		toolbar : [ {
			iconCls : 'icon-add',
			text : "添加",
			handler : function() {
				initArticle("new", "article");
			}
		}, "-", {
			iconCls : 'icon-edit',
			text : "编辑",
			handler : function() {
				initArticle("edit", "article");
			}
		}, "-", {
			iconCls : 'icon-remove',
			text : "删除",
			handler : function() {
				initArticle("delete", "article");
			}
		} ],
		tableId : 'articleDataGrid',
		url : base + 'findDocument'
	};
	return new Pagination(options);
}

function createAnnounceDataGridTable() {
	var options = {
		fitColumns : true,
		pagination : true,
		singleSelect : true,
		columns : [ [ {
			field : 'title',
			title : '标题',
			width : 200
		}, {
			field : 'url',
			title : '链接地址',
			width : 100
		}, {
			field : 'description',
			title : '公告描述',
			width : 100
		}, {
			field : 'addTime',
			title : '添加时间',
			width : 100
		} ] ],
		toolbar : [ {
			iconCls : 'icon-add',
			text : "添加",
			handler : function() {
				initArticle("new", "announce");
			}
		}, "-", {
			iconCls : 'icon-edit',
			text : "编辑",
			handler : function() {
				initArticle("edit", "announce");
			}
		} ],
		tableId : 'announceDataGrid',
		url : base + 'findAnnounce'
	};
	return new Pagination(options);
}

function createImageDataGridTable() {
	var options = {
		fitColumns : true,
		pagination : true,
		singleSelect : true,
		columns : [ [ {
			field : 'title',
			title : '标题',
			width : 150
		}, {
			field : 'filePath',
			title : '图片路径',
			width : 150,
			formatter : formatImageLink
		}, {
			field : 'imageUrl',
			title : '链接地址',
			width : 100
		}, {
			field : 'isShowOnIndex',
			title : '首页展示',
			width : 40,
			formatter : isShowOnIndex
		}, {
			field : 'addTime',
			title : '添加时间',
			width : 100
		} ] ],
		toolbar : [ {
			iconCls : 'icon-add',
			text : "添加",
			handler : function() {
				initArticle("new", "image");
			}
		}, "-", {
			iconCls : 'icon-edit',
			text : "编辑",
			handler : function() {
				initArticle("edit", "image");
			}
		} ],
		tableId : 'imageDataGrid',
		url : base + 'findImage'
	};
	return new Pagination(options);

}

// 表单提交相关设置
function submitForm() {

}

// 初始化当前默认选中的tab
function initCurrentTab() {
	initTabEvent();
	if ($("#currentTab").val() == "") {
		$("#moduleTabs").tabs("select", 0);
	} else {
		$("#moduleTabs").tabs("select", parseInt($("#currentTab").val()));
	}

}

// 初始化所有标签页内的数据
function initTabEvent() {
	$('#moduleTabs').tabs({
		onSelect : function(title) {
			if (title == "文章管理") {
				initDocumentSearchArea();
				searchDocumentList();
			} else if (title == "公告管理") {
				createAnnounceDataGridTable().show(null);
			} else if (title == "图片管理") {
				createImageDataGridTable().show(null);
			}
		}
	});
}

function initArticle(operateType, tabName) {
	var title;
	var urlParam = "";
	var row;
	var height;

	// 判断tabName的值
	if (tabName == "announce") {
		title = "公告";
		height = 300;
		urlParam = "initAnnounce?";
		row = $('#announceDataGrid').datagrid('getSelected');
		if (operateType != "new" && row == null) {
			alert("请选择需要编辑的行");
			return;
		}
		if (operateType == "edit") {
			urlParam += "announce.id=" + row.id;
		}
		if (operateType == "delete") {
			$.messager.confirm('删除公告', '确认删除?', function(r) {
				if (r) {
					var index = $('#announceDataGrid').datagrid('getRowIndex',
							row);
					urlParam = "?announce.id=" + row.id;
					$.ajax({
						url : "deleteAnnounceById" + urlParam,
						async : false
					});
					$('#announceDataGrid').datagrid('deleteRow', index);
				}
			});

			return;
		}
	} else if (tabName == "image") {
		title = "图片";
		height = 400;
		row = $('#imageDataGrid').datagrid('getSelected');
		urlParam = "initImage?";
		if (operateType != "new" && row == null) {
			alert("请选择需要编辑的行");
			return;
		}
		if (operateType == "edit") {
			urlParam += "image.imageId=" + row.imageId;
		}
		if (operateType == "delete") {
			$.messager.confirm('删除文章', '确认删除?', function(r) {
				if (r) {
					var index = $('#imageDataGrid')
							.datagrid('getRowIndex', row);
					urlParam = "?Image.imageId=" + row.imageId;
					$.ajax({
						url : "deleteImageById" + urlParam,
						async : false
					});
					$('#imageDataGrid').datagrid('deleteRow', index);
				}
			});

			return;
		}
	} else {
		title = '文章';
		height = 600;
		row = $('#articleDataGrid').datagrid('getSelected');
		urlParam = "initArticle?";
		if (operateType != "new" && row == null) {
			alert("请选择需要编辑的行");
			return;
		}
		if (operateType == "edit") {
			urlParam += "document.documentId=" + row.documentId;
		}
		if (operateType == "delete") {
			$.messager.confirm('删除文章', '确认删除?', function(r) {
				if (r) {
					var index = $('#articleDataGrid').datagrid('getRowIndex',
							row);
					urlParam = "?document.documentId=" + row.documentId;
					$.ajax({
						url : "deleteDocumentById" + urlParam,
						async : false
					});
					$('#articleDataGrid').datagrid('deleteRow', index);
				}
			});

			return;
		}
	}

	$('#win').window({
		title : title,
		width : 800,
		height : height,
		modal : true
	});
	$('#win').window('refresh', urlParam);
}

/*
 * 给Date对象添加format函数 例子1:var date = new Date(); date.format('y-M-d h:m:s');
 * 例子2:var date1 = new Date();var date2 = new Date(); date1.format(date2,'y-M-d
 * h:m:s');
 */
Date.prototype.format = function(date, format) {
	if (!(date instanceof Date)) {
		format = date;
		date = this;
	}

	var map = {
		'y' : date.getFullYear(), // 月份
		"M" : date.getMonth() + 1, // 月份
		"d" : date.getDate(), // 日
		"h" : date.getHours(), // 小时
		"m" : date.getMinutes(), // 分
		"s" : date.getSeconds()
	// 秒
	};

	format = format.replace(/([yMdhmsqS])+/g, function(all, t) {
		var v = map[t];
		if (v !== undefined) {
			if (all.length > 1) {
				v = '0' + v;
				v = v.substr(v.length - 2);
			}
			return v;
		}

		return all;
	});

	return format;
};

// 转化时间格式
function formatTimeStyle(value, rowData, rowIndex) {
	var date = new Date(value);
	return date.format('y-M-d h:m:s');
}

function isShowOnIndex(value, rowData, rowIndex) {
	if (value == 0) {
		return "否";
	} else {
		return "是";
	}
}

function formatImageLink(value, rowData, rowIndex) {
	var result;
	result = "<a href='" + value + "'>" + value + "</a>";
	return result;
}