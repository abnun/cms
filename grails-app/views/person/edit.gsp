
<%@ page import="de.webmpuls.photo_album.util.MediaUtils; de.webmpuls.cms.media.MediaHelper; de.webmpuls.cms.people.Funktion; de.webmpuls.photo_album.Album; de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
		<g:render template="/global/javascript/onePictureUploadJS" model="['album': album, 'albumDate': albumDate]" />
		<wm_photo_album:gallery_resources noGallery="true" />
    </head>
    <body>
        <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
		<g:render template="/global/javascript/backToListButtonJS" />
		<button id="backToListButton" style="margin-left: 10px;"><g:message code="default.back.to.list" /></button>
        <hr />
		<div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
				<div class="ui-widget">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							${flash.message}
						</p>
					</div>
				</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error" />:</strong>&nbsp;${flash.error}
						</p>
					</div>
				</div>
            </g:if>
            <g:hasErrors bean="${personInstance}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:</strong>
							<br/>
							<g:renderErrors bean="${personInstance}" as="list" />
					</div>
				</div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personInstance?.id}" />
                <g:hiddenField name="version" value="${personInstance?.version}" />
                <div class="dialog">
					<table>
						<tbody>

							<tr class="prop">
								<td valign="middle" class="name">
                                  <label for="bild"><g:message code="person.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="middle" class="value ${hasErrors(bean: personInstance, field: 'bild', 'errors')}">
									<div class="highslide-gallery" style="margin: auto">
										<g:if test="${personInstance.bild}">
											<a class='highslide' href='${wm_photo_album.pathToImage(picture: personInstance.bild, size: de.webmpuls.photo_album.util.MediaUtils.BIG)}' onclick="return hs.expand(this, { captionText: '${personInstance.bild?.caption ?: ''}' })">
												<img border="0" src="${wm_photo_album.pathToImage(picture: personInstance.bild, size: MediaUtils.THUMBNAIL)}" title="${message(code: 'picture.show.big.label', 'default': 'Klicken um eine größere Ansicht zu erhalten.')}" align="middle"/>
											</a>
										</g:if>
										&nbsp;<span><a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Bild-Auswahl Dialog öffnen</a></span>
										<br/>
										<br/>
									</div>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vorname"><g:message code="person.vorname.label" default="Vorname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'vorname', 'errors')}">
                                    <g:textField name="vorname" value="${personInstance?.vorname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nachname"><g:message code="person.nachname.label" default="Nachname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'nachname', 'errors')}">
                                    <g:textField name="nachname" value="${personInstance?.nachname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="strasse"><g:message code="person.strasse.label" default="Strasse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'strasse', 'errors')}">
                                    <g:textField name="strasse" value="${personInstance?.strasse}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plz"><g:message code="person.plz.label" default="Plz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'plz', 'errors')}">
                                    <g:textField name="plz" maxlength="5" value="${personInstance?.plz}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ort"><g:message code="person.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" value="${personInstance?.ort}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefon1"><g:message code="person.telefon1.label" default="Telefon1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'telefon1', 'errors')}">
                                    <g:textField name="telefon1" value="${personInstance?.telefon1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefon2"><g:message code="person.telefon2.label" default="Telefon2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'telefon2', 'errors')}">
                                    <g:textField name="telefon2" value="${personInstance?.telefon2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="person.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personInstance?.email}" />
                                </td>
                            </tr>
                        
                            %{--<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bild"><g:message code="person.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'bild', 'errors')}">
                                    <g:select name="bild.id" from="${de.webmpuls.photo_album.Picture.withAlbumName(MediaHelper.ALBUM_PERSONEN).listOrderByBaseName()}" optionKey="id" value="${personInstance?.bild?.id}" noSelection="['null': 'Bild auswählen']" />
                                </td>
                            </tr>--}%
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="steckbrief"><g:message code="person.steckbrief.label" default="Steckbrief" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'steckbrief', 'errors')}">
                                    <g:select name="steckbrief.id" from="${de.webmpuls.cms.people.Steckbrief.list()}" optionKey="id" value="${personInstance?.steckbrief?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="abteilungen"><g:message code="person.abteilungen.label" default="Abteilungen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'abteilungen', 'errors')}">
									<ul>
										<g:each in="${personInstance.abteilungen}" var="a">
											<li><g:link controller="abteilung" action="edit" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="adresseAnzeigen"><g:message code="person.adresseAnzeigen.label" default="Adresse Anzeigen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'adresseAnzeigen', 'errors')}">
                                    <g:checkBox name="adresseAnzeigen" value="${personInstance?.adresseAnzeigen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="funktionen.vorstand"><g:message code="person.funktionen.label" default="Funktionen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'funktionen', 'errors')}">
                                    <g:select name="funktionen.vorstand" from="${Funktion.vorstandsFunktionen().listOrderByName([cache: true])}" multiple="yes" optionKey="id" size="5" value="${personInstance?.funktionen}" />
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="additional.funktionen"><g:message code="person.additional.funktionen.label" default="Weitere Funktionen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'funktionen', 'errors')}">
									<ul>
										<g:each in="${personInstance.funktionen.findAll { Funktion tmpFunktion -> if(tmpFunktion.vorstand == false) {return true} } }" var="f">
											<li><g:link controller="funktion" action="edit" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
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

		<g:set var="select" value="${de.webmpuls.photo_album.Picture.withAlbumName(MediaHelper.ALBUM_PERSONEN).listOrderByBaseName()}" />
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

		<g:set var="callbackUri" value="/person/setPicture/${personInstance.id}" />
		<g:set var="fileName" value="${MediaHelper.formatNameForDisk(personInstance.vorname)}_${MediaHelper.formatNameForDisk(personInstance.nachname)}${de.webmpuls.photo_album.util.MediaUtils.SUFFIX}" />
		<g:render template="/global/bilder/upload" model="['albumId': album.id, 'isMultiUpload': false, 'album': album, 'albumDate': albumDate, select: select, item: personInstance, callbackUri: callbackUri, fileName: fileName]" />

    </body>
</html>
