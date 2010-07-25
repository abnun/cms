<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:render template="/global/javascript/morePictureUploadJS" model="['album': album, 'albumDate': albumDate]"/>
	<wm_photo_album:gallery_resources useCustomGalleryJS="true"/>
	<wm_photo_album:uploadify_resources/>
	<wm_photo_album:image_instant_resources/>
	<script type="text/javascript" src="${resource(dir: '/js/highslide', file: 'gallery.js')}"></script>
</head>
<body>
<table width="695" border="0" cellpadding="0" cellspacing="0">
	<tr align="left" valign="top">
		<td><!-- InstanceBeginEditable name="Text" -->
			<table width="614" border="0" align="left" cellspacing="10" style="width: 614px;">
				<tr>
					<td valign="top">
						<span class="headline_dunkel">Bilder zum Bericht '${bericht}' hochladen</span>

						<br/>
						<br/>

						<a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Bild-Auswahl Dialog öffnen</a>
						<button id="showAbteilungButton" style="margin-left: 10px;">Zurück zur Abteilung</button>
						<g:render template="/global/bilder/upload" model="['isMultiUpload': true]"/>
						<hr/>

						<%
							def albumPicturesList = album.pictures
						%>
						<g:if test="${albumPicturesList && !albumPicturesList.isEmpty()}">
							<p class="copy">
								Um die Bilder zu vergrößern einfach drauf klicken. <g:if test="${albumPicturesList.size() > 1}">Nach dem Vergrößern besteht zusätzlich die Möglichkeit eine Art Dia-Show zu starten (dazu muss man den Knopf "Abspielen" klicken).</g:if>
							</p>
							<table>
								<g:each in="${albumPicturesList}" status="i" var="pictureInstance">
									<g:if test="${pictureInstance.exists()}">
										<g:if test="${i % 3 == 0}">
											<tr>
										</g:if>
										<td>
											<div class="highslide-gallery" style="margin: auto">
												<br/>
												<jq:jquery>
													jQuery.preloadImages("${wm_photo_album.mediaPath(albumId: album.id)}${pictureInstance.getThumbNailURL()}", "${wm_photo_album.mediaPath(albumId: album.id)}${pictureInstance.getBigURL()}");
												</jq:jquery>
												<a class='highslide' href='${wm_photo_album.mediaPath(albumId: album.id)}${pictureInstance.getBigURL()}' onclick="return hs.expand(this, { captionText: '${pictureInstance.caption}' })">
													<img class="instant ishadow50 itiltleft historical nocorner itxtalt itxtcol666666" src='${wm_photo_album.mediaPath(albumId: album.id)}${pictureInstance.getThumbNailURL()}' alt='${pictureInstance.caption}'/>
												</a>

												<table>
													<tr>
														<shiro:hasRole name="${ShiroRole.BENUTZER}">
															<td>
																<g:link controller="picture" action="edit" params="[id: pictureInstance.id, albumId: album.id]"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Termin ändern" title="Termin ändern" border="0"/></g:link>
																<jq:jquery>
																		$("#picture_del_${pictureInstance.id}").click(function () {
																			if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
																			{
																				document.forms.PictureDeleteForm_${pictureInstance.id}.submit();
																			}
																		});
																</jq:jquery>
																<a href="javascript: void(0);" id="picture_del_${pictureInstance.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Bild löschen" title="Bild löschen" border="0"/></a>
																<g:form name="PictureDeleteForm_${pictureInstance.id}" method="post" url="${createLink(controller: 'picture', action: 'delete', params: [id: pictureInstance.id, albumId: album.id])}"></g:form>
															</td>
														</shiro:hasRole>
													</tr>
												</table>
											</div>
										</td>
										<g:if test="${i > 1 && i % 3 == 0}">
										</g:if>
									</g:if>
								</g:each>
							</tr>
							</table>
						</g:if>

						<br/>
						<br/>

						<jq:jquery>
	$("#showAbteilungButton").button({
		icons: {
			primary: 'ui-icon-arrowthick-1-e'
		}
	}).click(function() {
		window.location.href = '${createLink(action: 'berichte', params: ['code': bericht?.abteilung?.code], mapping: 'abteilungShow')}';
	});
</jq:jquery>

					</td>
				</tr>
		</table>
		</td>
	</tr>
</table>

</body>
</html>