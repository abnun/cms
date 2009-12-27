
<%@ page import="de.webmpuls.photo_album.Album; de.webmpuls.cms.media.MediaUtils; de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
		<g:javascript base="${resource(dir: '/js/jquery/')}" src="jquery.blockUI.js" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
		<wm_photo_album:uploadify_resources />

		<%
			Album tmpAlbum = de.webmpuls.photo_album.Album.withName(MediaUtils.ALBUM_PERSONEN).list().first()
			String albumId = tmpAlbum.id

			String albumDate = ""
			if(tmpAlbum) {
				albumDate = formatDate(date: tmpAlbum.dateCreated, format: 'ddMMyyyy')
			}

		%>

		<jq:jquery>
			// change message border
			$.blockUI.defaults.css.border = '2px solid #1760a8'; 

			// make fadeOut effect shorter
			$.blockUI.defaults.fadeOut = 100;

			$("#bildUpload").click(function () {
		  		$.blockUI({ message: $('#bildUploadContent') });
		  		$('.blockOverlay').attr('title','Klicken um den Dialog zu schließen.').click($.unblockUI);
			});

			$('#albumFotos').uploadify({
				'uploader'  		: '${resource(dir: '/js/uploadify', file: 'uploadify.swf', plugin: 'photo-album')}',
				'script'    		: '${createLink(controller: 'picture', action: 'uploadPhotos')}',
				'cancelImg' 		: '${resource(dir: '/images', file: 'cancel.png', plugin: 'photo-album')}',
				'auto'      		: false,
				'fileDataName'		: 'fotos',
				'multi'				: false,
				'method'			: 'POST',
				'buttonText'		: 'Bild auswaehlen',
				'fileDesc'			: 'Erlaubte Datei-Typen',
				'fileExt'			: '*.jpg;*.gif;*.JPG;*.jpeg;*.JPEG;*.GIF;*.png;*.PNG;',
				'folder'    		: '/${de.webmpuls.photo_album.util.MediaUtils.DEFAULT_FOLDER}_${tmpAlbum.toString()}_${albumDate}',
				%{--'onComplete'		: function (evt, queueID, fileObj, response, data) { alert("Response: "+response);},--}%
				'onAllComplete'	: function(event, uploadObj) { alert(uploadObj.filesUploaded + ' Bild(er) hochgeladen. Anzahl der Fehler: ' + uploadObj.errors); $.unblockUI(); location.reload();},
				'onError'			: function(event, ID, fileObj, errorObj) { alert("Fehler: "+errorObj.info);}
			});

			$('#startUpload').click(function(){
				var queryString = { 'album.id': '${albumId}', 'rotate': $('#rotate').val() };
				$('#albumFotos').uploadifySettings('scriptData', queryString);
				$('#albumFotos').uploadifyUpload();
			 });

		</jq:jquery>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			<g:render template="/global/menu/admin" />
        </div>
        <div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personInstance}">
            <div class="errors">
                <g:renderErrors bean="${personInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personInstance?.id}" />
                <g:hiddenField name="version" value="${personInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bild"><g:message code="person.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'bild', 'errors')}">
                                    <g:select name="bild.id" from="${de.webmpuls.photo_album.Picture.withAlbumName(MediaUtils.ALBUM_PERSONEN).list()}" optionKey="id" value="${personInstance?.bild?.id}" noSelection="['null': '']" />
									&nbsp;<span><a href="javascript: void(0);" id="bildUpload">Bild hochladen</a></span>
                                </td>
                            </tr>
                        
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
											<li><g:link controller="abteilung" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
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
                                  <label for="funktionen"><g:message code="person.funktionen.label" default="Funktionen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'funktionen', 'errors')}">
                                    <g:select name="funktionen" from="${de.webmpuls.cms.people.Funktion.list()}" multiple="yes" optionKey="id" size="5" value="${personInstance?.funktionen}" />
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
		<div style="display: none;" id="bildUploadContent">
			<g:render template="/global/bilder/upload" model="['albumId': albumId]" />
		</div>
    </body>
</html>
