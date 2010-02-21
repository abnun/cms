
<%@ page import="de.webmpuls.cms.media.MediaUtils; de.webmpuls.cms.section.Sponsor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
		<g:render template="/global/javascript/bildUploadJS" model="['album': album, 'albumDate': albumDate]" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
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
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="sponsor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${sponsorInstance?.name}" />
									<g:if test="${sponsorInstance.bild}">&nbsp;<span><img width="110" border="0" src="${wm_photo_album.pathToImage(picture: sponsorInstance.bild)}"/></span></g:if>
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bild"><g:message code="sponsor.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'bild', 'errors')}">
                                    <g:select name="bild.id" from="${de.webmpuls.photo_album.Picture.withAlbumName(MediaUtils.ALBUM_SPONSOREN).listOrderByBaseName()}" optionKey="id" value="${sponsorInstance?.bild?.id}" noSelection="['null': '']" />
									&nbsp;<span><a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Bild-Upload Dialog öffnen</a></span>
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

		<g:render template="/global/bilder/upload" model="['albumId': album.id]" />
    </body>
</html>
