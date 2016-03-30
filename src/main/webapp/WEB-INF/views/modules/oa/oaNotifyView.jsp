<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知管理</title>
	<meta name="decorator" content="default"/>
		
	<script src="${ctxStatic}/markdown/markdown.js" type="text/javascript"></script>
	<script src="${ctxStatic}/markdown/markdown-editor.js" type="text/javascript"></script>
	<script src="${ctxStatic}/markdown/markdown-editor.zh.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#content').html(markdown2html($('#content').html()));
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/oa/oaNotify/">通知列表</a></li>
		<li class="active"><a href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}">通知查看</a></li>
	</ul><br/>
	<form:form id="viewForm" modelAttribute="oaNotify" action="/" method="get" class="form-horizontal">
		<div class="control-group">
			<label class="control-label">类型：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge required" disabled="true">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				${oaNotify.title}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<p id="content">
					${oaNotify.content}
				</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="files" type="files" uploadPath="/oa/notify" selectMultiple="true" readonly="true" />
			</div>
		</div>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>