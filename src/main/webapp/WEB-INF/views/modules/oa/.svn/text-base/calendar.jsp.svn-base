<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的日程</title>
	<meta name="decorator" content="default"/>
	
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/bootstrap-calendar-master/css/calendar.min.css">
	<style type="text/css">
		.form-horizontal {
			margin: 0 10px 0 78px;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function() {

			"use strict";
		
			var options = {
				events_source: '${ctxStatic}/bootstrap/bootstrap-calendar-master/events.json',
				view: 'month',
				tmpl_path: '${ctxStatic}/bootstrap/bootstrap-calendar-master/tmpls/',
				tmpl_cache: false,
				day: '2013-03-12',
				onAfterEventsLoad: function(events) {
					if(!events) {
						return;
					}
					var list = $('#eventlist');
					list.html('');
		
					$.each(events, function(key, val) {
						$(document.createElement('li'))
							.html('<a href="' + val.url + '">' + val.title + '</a>')
							.appendTo(list);
					});
				},
				onAfterViewLoad: function(view) {
					$('.page-header h3').text(this.getTitle());
					$('.btn-group button').removeClass('active');
					$('button[data-calendar-view="' + view + '"]').addClass('active');
				},
				classes: {
					months: {
						general: 'label'
					}
				}
			};
		
			var calendar = $('#calendar').calendar(options);
		
			$('.btn-group button[data-calendar-nav]').each(function() {
				var $this = $(this);
				$this.click(function() {
					calendar.navigate($this.data('calendar-nav'));
				});
			});
		
			// 监听动作：年月周日视图
			$('.btn-group button[data-calendar-view]').each(function() {
				var $this = $(this);
				$this.click(function() {
					calendar.view($this.data('calendar-view'));
				});
			});
		
			$('#first_day').change(function(){
				var value = $(this).val();
				value = value.length ? parseInt(value) : null;
				calendar.setOptions({first_day: value});
				calendar.view();
			});
		
			$('#language').change(function(){
				calendar.setLanguage($(this).val());
				calendar.view();
			});
			calendar.setLanguage($('#language').val());
			calendar.view();
		
			$('#events-in-modal').change(function(){
				var val = $(this).is(':checked') ? $(this).val() : null;
				calendar.setOptions({modal: val});
			});
			$('#format-12-hours').change(function(){
				var val = $(this).is(':checked') ? true : false;
				calendar.setOptions({format12: val});
				calendar.view();
			});
			$('#show_wbn').change(function(){
				var val = $(this).is(':checked') ? true : false;
				calendar.setOptions({display_week_numbers: val});
				calendar.view();
			});
			$('#show_wb').change(function(){
				var val = $(this).is(':checked') ? true : false;
				calendar.setOptions({weekbox: val});
				calendar.view();
			});
			$('#events-modal .modal-header, #events-modal .modal-footer').click(function(e){
				//e.preventDefault();
				//e.stopPropagation();
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/oa/oaNotify/calendar">日历</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/calendar" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	

		<div class="page-header">
	
			<div class="pull-right form-inline">
				<div class="btn-group">
					<button class="btn btn-primary" data-calendar-nav="prev" onclick="return false;"><< 前</button>
					<button class="btn" data-calendar-nav="today" onclick="return false;">回到今天</button>
					<button class="btn btn-primary" data-calendar-nav="next" onclick="return false;">后 >></button>
				</div>
				<div class="btn-group">
					<button class="btn btn-warning" data-calendar-view="year" onclick="return false;">年</button>
					<button class="btn btn-warning active" data-calendar-view="month" onclick="return false;">月</button>
					<button class="btn btn-warning" data-calendar-view="week" onclick="return false;">周</button>
					<button class="btn btn-warning" data-calendar-view="day" onclick="return false;">日</button>
				</div>
			</div>
	
			<h3></h3>
			<small>静态数据测试查看时间，2013年3月</small>
		</div>
	
		<div class="row">
			<div class="span9">
				<div id="calendar"></div>
			</div>
			<div class="span3">
				<div class="row-fluid">
					<span>Options</span>
					<select id="first_day" class="span12">
						<option value="" selected="selected">每周第一天(绑定语言)</option>
						<option value="2">周日是每周第一天</option>
						<option value="1">周一是每周第一天</option>
					</select>
					<select id="language" class="span12">
						<option value="zh-CN">语言选择（默认：简体中文）</option>
						<option value="bg-BG">Bulgarian</option>
						<option value="nl-NL">Dutch</option>
						<option value="fr-FR">French</option>
						<option value="de-DE">German</option>
						<option value="el-GR">Greek</option>
						<option value="hu-HU">Hungarian</option>
						<option value="id-ID">Bahasa Indonesia</option>
						<option value="it-IT">Italian</option>
						<option value="pl-PL">Polish</option>
						<option value="pt-BR">Portuguese (Brazil)</option>
						<option value="ro-RO">Romania</option>
						<option value="es-CO">Spanish (Colombia)</option>
						<option value="es-MX">Spanish (Mexico)</option>
						<option value="es-ES">Spanish (Spain)</option>
						<option value="ru-RU">Russian</option>
						<option value="sk-SR">Slovak</option>
						<option value="sv-SE">Swedish</option>
						<option value="zh-CN">简体中文</option>
						<option value="zh-TW">繁體中文</option>
						<option value="ko-KR">한국어</option>
						<option value="th-TH">Thai (Thailand)</option>
					</select>
					<label>
						<input type="checkbox" value="#events-modal" id="events-in-modal"> Open events in modal window
					</label>
					<label>
						<input type="checkbox" id="format-12-hours"> 12 Hour format
					</label>
					<label>
						<input type="checkbox" id="show_wb" checked> Show week box
					</label>
					<label>
						<input type="checkbox" id="show_wbn" checked> Show week box number
					</label>
				</div>
	
				<h4>事件列表</h4>
				<small>动态填充的事件列表</small>
				<ul id="eventlist" class="nav nav-list"></ul>
			</div>
		</div>
		
	    <script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/components/underscore/underscore-min.js"></script>
	    <script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/components/jstimezonedetect/jstz.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/bg-BG.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/nl-NL.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/fr-FR.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/de-DE.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/el-GR.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/it-IT.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/hu-HU.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/pl-PL.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/pt-BR.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/ro-RO.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/es-CO.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/es-MX.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/es-ES.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/ru-RU.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/sk-SR.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/sv-SE.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/zh-CN.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/cs-CZ.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/ko-KR.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/zh-TW.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/id-ID.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/language/th-TH.js"></script>
		<script type="text/javascript" src="${ctxStatic}/bootstrap/bootstrap-calendar-master/js/calendar.min.js"></script>
	</form:form>
</body>
</html>