
<%@ page import="de.webmpuls.cms.start.Termin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'termin.label', default: 'Termin')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${terminInstance}">
            <div class="errors">
                <g:renderErrors bean="${terminInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datum"><g:message code="termin.datum.label" default="Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'datum', 'errors')}">
                                    <g:datePicker name="datum" precision="day" value="${terminInstance?.datum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="termin.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'inhalt', 'errors')}">
                                    <g:textArea name="inhalt" cols="40" rows="5" value="${terminInstance?.inhalt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="findetStatt"><g:message code="termin.findetStatt.label" default="Findet Statt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'findetStatt', 'errors')}">
                                    <g:checkBox name="findetStatt" value="${terminInstance?.findetStatt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zusatzinfo"><g:message code="termin.zusatzinfo.label" default="Zusatzinfo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'zusatzinfo', 'errors')}">
                                    <g:textArea name="zusatzinfo" cols="40" rows="5" value="${terminInstance?.zusatzinfo}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
