<div id="dialog">

	<g:if test="${select}">
		<h3>Bild auswählen:</h3>
		<table>
			<tr>
				<td align="center" valign="middle">
					<img id="tmpBild" width="110" border="1" src="${item?.bild ? wm_photo_album.pathToImage(picture: item?.bild) : ''}" alt="" ${item?.bild ?: 'style=\" display: none;\"'} align="middle"/>
				</td>
				<td align="center" valign="middle">
					<g:form uri="${callbackUri}" name="PictureSelectForm" method="post">
						<g:select name="bild.id" from="${select}" value="${item?.bild?.URL}" optionKey="URL" noSelection="['':'Bild auswählen']" />
						<input type="hidden" id="picture_select_hidden" name="picture_select_hidden" value="false"/>
					</g:form>
				</td>
			</tr>
		</table>
		<hr/>
	</g:if>

	<h3>Bild hochladen:</h3>

	<g:set var="isMultiUpload" value="${isMultiUpload}"/>

	<g:if test="${!isMultiUpload}">
		<g:uploadForm controller="picture" action="uploadPhotos" name="PictureUploadForm" method="post">
			<g:hiddenField name="album.id" value="${albumId}" />
			<g:hiddenField name="Filename" value="${fileName}" />
			<g:hiddenField name="folder" value="/${de.webmpuls.photo_album.util.MediaUtils.DEFAULT_FOLDER}_${album.toString()}_${albumDate}" />
			<g:hiddenField name="callbackUri" value="${callbackUri}" />

			<p>
				<input type="file" name="fotos" id="fotos"/>
			</p>

		</g:uploadForm>
	</g:if>
	<g:else>
		<p>
			<input type="file" name="albumFotos" id="albumFotos"/>
		</p>
	</g:else>
	<div id="dialog_error" class="ui-widget" style="display: none;">
		<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
			<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
				<strong>Fehler:</strong> Es muss entweder ein Bild aus der Liste ausgewählt oder ein neues Bild hochgeladen werden!</p>
		</div>
	</div>
</div>