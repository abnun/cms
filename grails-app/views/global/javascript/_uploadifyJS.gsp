<%@ page contentType="text/html;charset=UTF-8" %>

<jq:jquery>
$('#albumFotos').uploadify({
			'uploader'  		: '${resource(dir: '/js/uploadify', file: 'uploadify.swf', plugin: 'photo-album')}',
			'script'    		: '${createLink(controller: 'picture', action: 'uploadPhotos')}',
			'cancelImg' 		: '${resource(dir: '/images', file: 'cancel.png', plugin: 'photo-album')}',
			//'buttonImg' 		: '${resource(dir: '/images', file: 'cancel.png', plugin: 'photo-album')}',
			'auto'      		: false,
			'fileDataName'		: 'fotos',
			'multi'				: true,
			'method'			: 'POST',
			'buttonText'		: 'Auswaehlen',
			'fileDesc'			: 'Erlaubte Datei-Typen',
			'fileExt'			: '*.jpg;*.gif;*.JPG;*.jpeg;*.JPEG;*.GIF;*.png;*.PNG;',
			'folder'    		: '/${de.webmpuls.photo_album.util.MediaUtils.DEFAULT_FOLDER}_${album.toString()}_${albumDate}',
		%{--'onComplete'		: function (evt, queueID, fileObj, response, data) { alert("Response: "+response);},--}%
				'onAllComplete'	: function(event, uploadObj) { alert(uploadObj.filesUploaded + ' Bild(er) hochgeladen. Anzahl der Fehler: ' + uploadObj.errors); $('#dialog').dialog('close'); location.reload();},
		   	'onError'			: function(event, ID, fileObj, errorObj) { alert("Fehler: "+errorObj.info);}
});
</jq:jquery>