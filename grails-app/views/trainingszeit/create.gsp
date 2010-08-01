
<%@ page import="de.webmpuls.cms.section.Trainingszeit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'trainingszeit.label', default: 'Trainingszeit')}" />
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
            <g:hasErrors bean="${trainingszeitInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingszeitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bezeichnung"><g:message code="trainingszeit.bezeichnung.label" default="Bezeichnung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'bezeichnung', 'errors')}">
                                    <g:textField name="bezeichnung" value="${trainingszeitInstance?.bezeichnung}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ort"><g:message code="trainingszeit.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" value="${trainingszeitInstance?.ort}" />
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
