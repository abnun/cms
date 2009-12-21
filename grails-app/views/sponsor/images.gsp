<g:if test="${pictureList}">
	<g:each var="picture" in="${pictureList}">
		<img src="${wm_photo_album.mediaPath(albumId: album.id)}${picture.getThumbNailURL()}" alt="${picture.caption}" width="110" />
	</g:each>
</g:if>
