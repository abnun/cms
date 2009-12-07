<html>
<head>
	<title><g:layoutTitle default="(( (  Sportverein Leingarten  ) ))"/></title>
	%{--<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />--}%
	<link href="${resource(dir: 'css', file: 'navi.css')}" rel="stylesheet" type="text/css" />
	<link href="${resource(dir: 'css', file: 'rubrik.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'text.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'sparte.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'tabelle.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'message.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'menu.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'buttons.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'dialog.css')}" rel="stylesheet" type="text/css"/>
	<link href="${resource(dir: 'css', file: 'boxes.css')}" rel="stylesheet" type="text/css"/>
	<wm_photo_album:static_resources />
	<link rel="shortcut icon" href="${resource(dir: 'bilder', file: 'svl.ico')}" type="image/x-icon"/>
	<g:layoutHead/>
	<g:javascript library="application"/>
</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
	<img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
</div>
<g:layoutBody/>
</body>
</html>