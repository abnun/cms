
<%@ page import="de.webmpuls.cms.section.Bericht" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'bericht.label', default: 'Bericht')}" />
        %{--<title><g:message code="default.show.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bericht.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: berichtInstance, field: "id")}</td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"><g:message code="bericht.ueberschrift.label" default="Ueberschrift" /></td>

                            <td valign="top" class="value">${fieldValue(bean: berichtInstance, field: "ueberschrift")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bericht.inhalt.label" default="Inhalt" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: berichtInstance, field: "inhalt")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bericht.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${berichtInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bericht.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${berichtInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bericht.album.label" default="Album" /></td>
                            
                            <td valign="top" class="value"><g:link controller="album" action="show" id="${berichtInstance?.album?.id}">${berichtInstance?.album?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${berichtInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
