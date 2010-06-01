
<%@ page import="de.webmpuls.cms.section.Trainingszeit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'trainingszeit.label', default: 'Trainingszeit')}" />
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
            <g:hasErrors bean="${trainingszeitInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingszeitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${trainingszeitInstance?.id}" />
                <g:hiddenField name="version" value="${trainingszeitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="trainingszeit.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${trainingszeitInstance?.name}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="trainingstage"><g:message code="trainingszeit.trainingstage.label" default="Trainingstage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'trainingstage', 'errors')}">
                                    <g:select name="trainingstage" from="${de.webmpuls.cms.section.Trainingstag.list()}" multiple="yes" optionKey="id" size="5" value="${trainingszeitInstance?.trainingstage}" />
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
    </body>
</html>
