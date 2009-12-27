<g:if test="${sponsorInstanceList}">
	<g:each var="sponsor" in="${sponsorInstanceList}">
		<g:if test="${sponsor.verlinkung && !sponsor.verlinkung.contains('@')}">
			<g:set var="link" value="${sponsor.verlinkung}" />
		</g:if>
		<g:else>
			<g:set var="link" value="" />
		</g:else>
		<img id="sponsor" rel="${link ?: ''}" src="${wm_photo_album.pathToImage(picture: sponsor?.bild)}" alt="${sponsor?.bild?.caption}" title="${sponsor?.bild?.caption}" width="110" />
	</g:each>
</g:if>