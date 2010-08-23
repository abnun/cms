
<%@ page import="de.webmpuls.cms.section.Trainingstag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'trainingstag.label', default: 'Trainingstag')}" />
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
            <g:hasErrors bean="${trainingstagInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingstagInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${trainingstagInstance?.id}" />
                <g:hiddenField name="version" value="${trainingstagInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tag"><g:message code="trainingstag.tag.label" default="Tag" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingstagInstance, field: 'tag', 'errors')}">
                                    <g:select name="tag" from="${de.webmpuls.cms.section.Tag?.values()}" value="${trainingstagInstance?.tag}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="uhrzeiten"><g:message code="trainingstag.uhrzeiten.label" default="Uhrzeiten" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingstagInstance, field: 'uhrzeiten', 'errors')}">
                                    <g:textField name="uhrzeiten" value="${trainingstagInstance?.uhrzeiten}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ort"><g:message code="trainingstag.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingstagInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" value="${trainingstagInstance?.ort}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="trainingszeit"><g:message code="trainingstag.trainingszeit.label" default="Trainingszeit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingstagInstance, field: 'trainingszeit', 'errors')}">
                                    <g:select name="trainingszeit.id" from="${de.webmpuls.cms.section.Trainingszeit.list()}" optionKey="id" value="${trainingstagInstance?.trainingszeit?.id}"  />
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
