
<%@ page import="de.webmpuls.cms.section.InfoBox" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'infoBox.label', default: 'InfoBox')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${infoBoxInstance}">
            <div class="errors">
                <g:renderErrors bean="${infoBoxInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift"><g:message code="infoBox.ueberschrift.label" default="Ueberschrift" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: infoBoxInstance, field: 'ueberschrift', 'errors')}">
                                    <g:textField name="ueberschrift" value="${infoBoxInstance?.ueberschrift}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="infoBox.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: infoBoxInstance, field: 'inhalt', 'errors')}">
                                    <g:textField name="inhalt" value="${infoBoxInstance?.inhalt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position"><g:message code="infoBox.position.label" default="Position" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: infoBoxInstance, field: 'position', 'errors')}">
                                    <g:textField name="position" value="${fieldValue(bean: infoBoxInstance, field: 'position')}" />
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