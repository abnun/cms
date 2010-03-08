
<%@ page import="de.webmpuls.cms.media.MediaHelper; de.webmpuls.cms.section.Sponsor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
		<g:render template="/global/javascript/onePictureUploadJS" model="['album': album, 'albumDate': albumDate]" />
		<wm_photo_album:gallery_resources noGallery="true" />
    </head>
    <body>
        <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
		<hr />
        <div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sponsorInstance?.id}" />
                <g:hiddenField name="version" value="${sponsorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

							<tr class="prop">
								<td valign="middle" class="name">
                                  <label for="bild"><g:message code="sponsor.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="middle" class="value ${hasErrors(bean: sponsorInstance, field: 'bild', 'errors')}">
									<div class="highslide-gallery" style="margin: auto">
										<g:if test="${sponsorInstance?.bild}">
											<a class='highslide' href='${wm_photo_album.pathToImage(picture: sponsorInstance.bild, size: de.webmpuls.photo_album.util.MediaUtils.BIG)}' onclick="return hs.expand(this, { captionText: '${sponsorInstance.bild?.caption ?: ''}' })">
												<img width="110" border="0" src="${wm_photo_album.pathToImage(picture: sponsorInstance.bild)}" title="${message(code: 'picture.show.big.label', 'default': 'Klicken um eine größere Ansicht zu erhalten.')}" align="middle"/>
											</a>
										</g:if>
										&nbsp;<span><a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Bild-Auswahl Dialog öffnen</a></span>
										<br/>
										<br/>
									</div>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="sponsor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${sponsorInstance?.name}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="beschreibung"><g:message code="sponsor.beschreibung.label" default="Beschreibung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'beschreibung', 'errors')}">
                                    %{--<g:textArea name="beschreibung" cols="40" rows="5" value="${sponsorInstance?.beschreibung}" />--}%
									<g:render template="/global/ckeditor/editor" model="['inhalt': sponsorInstance?.beschreibung, 'name': 'beschreibung']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="verlinkung"><g:message code="sponsor.verlinkung.label" default="Verlinkung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'verlinkung', 'errors')}">
                                    <g:textField name="verlinkung" value="${sponsorInstance?.verlinkung}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>

		<g:set var="select" value="${de.webmpuls.photo_album.Picture.withAlbumName(MediaHelper.ALBUM_SPONSOREN).listOrderByBaseName()}" />
		<g:if test="${select}">
			<jq:jquery>
				$("select[name='bild.id']").change(function() {
					$("input[name='picture_select_hidden']").val("true");
					var mediaPath = '${wm_photo_album.mediaPath(albumId: album.id)}';
				    $("#tmpBild").attr("src", mediaPath + $("select[name='bild.id']").val());
				   	$("#tmpBild").show();
				   	$("#dialog_error:visible").slideUp("slow");
				 });

				$("input[name='fotos']").change(function() {
					$("#dialog_error:visible").slideUp("slow");
				 });
			</jq:jquery>
		</g:if>

		<g:set var="callbackUri" value="/sponsor/setPicture/${sponsorInstance.id}" />
		<g:set var="fileName" value="${MediaHelper.formatNameForDisk(sponsorInstance.name.toLowerCase() + de.webmpuls.photo_album.util.MediaUtils.SUFFIX)}" />
		<g:render template="/global/bilder/upload" model="['albumId': album.id, 'isMultiUpload': false, 'album': album, 'albumDate': albumDate, select: select, item: sponsorInstance, callbackUri: callbackUri, fileName: fileName]" />
    </body>
</html>
