<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<wm_photo_album:uploadify_resources />
	<link type="text/css" href="${resource(dir: 'css/cupertino', file: 'jquery-ui-1.7.2.custom.css')}" rel="stylesheet" />
	<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery-ui-1.7.2.custom.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.bgiframe.min.js')}"></script>
	<jq:jquery>

		$('#dialog').dialog( {
			title: 'Upload-Dialog',
			bgiframe: true,
			autoOpen: false,
			closeOnEscape: true,
			modal: true,
			resizable: false,
			show: 'clip',
			hide: 'clip',
			width: 450,
			buttons: {
				"Warteschlange löschen": function() {
					$('#albumFotos').uploadifyClearQueue();
				},
				"Upload starten": function() {
					var queryString = { 'album.id': '${album.id}', 'rotate': $('#rotate').val() };
					$('#albumFotos').uploadifySettings('scriptData', queryString);
					$('#albumFotos').uploadifyUpload();
				}
			}
		});

		$('#dialog_link').click(function() {
			$('#dialog').dialog('open');
			$('#dialog').dialog('moveToTop')
			return false;
		});

		$('#dialog_link, ul#icons li').hover(
			function() { $(this).addClass('ui-state-hover'); },
			function() { $(this).removeClass('ui-state-hover'); }
		);


		$('#albumFotos').uploadify({
			'uploader'  		: '${resource(dir: '/js/uploadify', file: 'uploadify.swf', plugin: 'photo-album')}',
			'script'    		: '${createLink(controller: 'picture', action: 'uploadPhotos')}',
			'cancelImg' 		: '${resource(dir: '/images', file: 'cancel.png', plugin: 'photo-album')}',
			//'buttonImg' 		: '${resource(dir: '/images', file: 'cancel.png', plugin: 'photo-album')}',
			'auto'      		: false,
			'fileDataName'		: 'fotos',
			'multi'				: false,
			'method'			: 'POST',
			'buttonText'		: 'Bild auswaehlen',
			'fileDesc'			: 'Erlaubte Datei-Typen',
			'fileExt'			: '*.jpg;*.gif;*.JPG;*.jpeg;*.JPEG;*.GIF;*.png;*.PNG;',
			'folder'    		: '/${de.webmpuls.photo_album.util.MediaUtils.DEFAULT_FOLDER}_${album.toString()}_${albumDate}',
			%{--'onComplete'		: function (evt, queueID, fileObj, response, data) { alert("Response: "+response);},--}%
			'onAllComplete'	: function(event, uploadObj) { alert(uploadObj.filesUploaded + ' Bild(er) hochgeladen. Anzahl der Fehler: ' + uploadObj.errors); $('#dialog').dialog('close'); location.reload();},
			'onError'			: function(event, ID, fileObj, errorObj) { alert("Fehler: "+errorObj.info);}
		});

	</jq:jquery>

	<style type="text/css">
		/*demo page css*/
		#dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative; font-size:65%;}
		#dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
		span.ui-icon {float: left; margin: 0 4px;}
	</style>
</shiro:hasRole>