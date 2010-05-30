
<%@ page import="de.webmpuls.cms.section.Bericht" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'bericht.label', default: 'Bericht')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${berichtInstance}">
            <div class="errors">
                <g:renderErrors bean="${berichtInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${berichtInstance?.id}" />
                <g:hiddenField name="version" value="${berichtInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift"><g:message code="bericht.ueberschrift.label" default="Ueberschrift" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: berichtInstance, field: 'ueberschrift', 'errors')}">
                                    <g:textField name="ueberschrift" value="${berichtInstance?.ueberschrift}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="bericht.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: berichtInstance, field: 'inhalt', 'errors')}">
                                    %{--<g:textField name="inhalt" value="${berichtInstance?.inhalt}" />--}%
									<g:render template="/global/ckeditor/editor" model="['inhalt': berichtInstance?.inhalt]" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="album"><g:message code="bericht.album.label" default="Album" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: berichtInstance, field: 'album', 'errors')}">
                                    <g:select name="album.id" from="${de.webmpuls.photo_album.Album.list()}" optionKey="id" value="${berichtInstance?.album?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
				<g:hiddenField name="abteilungId" value="${params.abteilungId}" />
            </g:form>
        </div>
    </body>
</html>
