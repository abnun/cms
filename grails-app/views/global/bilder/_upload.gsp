<jq:jquery>
	$('#startUpload').click(function(){
		var queryString = { 'album.id': '${albumId}', 'rotate': $('#rotate').val() };
		$('#albumFotos').uploadifySettings('scriptData', queryString);
		$('#albumFotos').uploadifyUpload();
	 });

</jq:jquery>
<br />
<input type="file" name="albumFotos" id="albumFotos" />
<br />
<a id="startUpload" href="javascript:void(0);">Upload starten</a>&nbsp;|&nbsp;<a href="javascript:$('#albumFotos').uploadifyClearQueue();">Warteschlange löschen</a>&nbsp;|&nbsp;<a href="javascript:$.unblockUI();">Fenster schließen</a>