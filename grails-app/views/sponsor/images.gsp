<g:if test="${sponsorInstanceList}">
	<g:each var="sponsor" in="${sponsorInstanceList}">
		<img id="sponsor" rel="${sponsor.verlinkung ?: ''}" src="${wm_photo_album.pathToImage(picture: sponsor?.bild)}" alt="${sponsor?.bild?.caption}" width="110" />
	</g:each>
</g:if>
