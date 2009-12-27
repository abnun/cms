
<%@ page import="de.webmpuls.cms.start.Anzeigen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'anzeigen.label', default: 'Anzeigen')}" />
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
                            <td valign="top" class="name"><g:message code="anzeigen.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: anzeigenInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anzeigen.ueberschrift1.label" default="Ueberschrift1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: anzeigenInstance, field: "ueberschrift1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anzeigen.ueberschrift2.label" default="Ueberschrift2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: anzeigenInstance, field: "ueberschrift2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anzeigen.abteilung.label" default="Abteilung" /></td>
                            
                            <td valign="top" class="value"><g:link controller="abteilung" action="show" id="${anzeigenInstance?.abteilung?.id}">${anzeigenInstance?.abteilung?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anzeigen.takeEndDate.label" default="Take End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${anzeigenInstance?.takeEndDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anzeigen.endDatum.label" default="End Datum" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${anzeigenInstance?.endDatum}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anzeigen.inhalt.label" default="Inhalt" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: anzeigenInstance, field: "inhalt")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${anzeigenInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
