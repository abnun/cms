<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:render template="/global/javascript/morePictureUploadJS" model="['album': album, 'albumDate': albumDate]" />
	<wm_photo_album:gallery_resources noGallery="true" />
	<wm_photo_album:uploadify_resources />
</head>
<body>
<span class="headline_dunkel">Bilder zum Bericht '${bericht}' hochladen</span>

<br />
<br />

<span><a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Bild-Auswahl Dialog öffnen</a></span>

<g:render template="/global/bilder/upload" model="['isMultiUpload': true]" />



</body>
</html>