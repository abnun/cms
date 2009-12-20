
<%@ page import="de.webmpuls.cms.section.Abteilung" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <g:render template="/global/admin/menu" />
        </div>
        <div class="body">
            %{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${abteilungInstance}">
            <div class="errors">
                <g:renderErrors bean="${abteilungInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="abteilung.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${abteilungInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="abteilung.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${abteilungInstance?.code}" />
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