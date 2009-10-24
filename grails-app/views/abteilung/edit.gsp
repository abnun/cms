
<%@ page import="de.webmpuls.cms.section.Abteilung" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${abteilungInstance}">
            <div class="errors">
                <g:renderErrors bean="${abteilungInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${abteilungInstance?.id}" />
                <g:hiddenField name="version" value="${abteilungInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personen"><g:message code="abteilung.personen.label" default="Personen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'personen', 'errors')}">
                                    <g:select name="personen" from="${de.webmpuls.cms.people.Person.list()}" multiple="yes" optionKey="id" size="5" value="${abteilungInstance?.personen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unterabteilungen"><g:message code="abteilung.unterabteilungen.label" default="Unterabteilungen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'unterabteilungen', 'errors')}">
                                    <g:select name="unterabteilungen" from="${de.webmpuls.cms.section.Abteilung.list()}" multiple="yes" optionKey="id" size="5" value="${abteilungInstance?.unterabteilungen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mitarbeiterfunktionen"><g:message code="abteilung.mitarbeiterfunktionen.label" default="Mitarbeiterfunktionen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'mitarbeiterfunktionen', 'errors')}">
                                    <g:select name="mitarbeiterfunktionen" from="${de.webmpuls.cms.people.Funktion.list()}" multiple="yes" optionKey="id" size="5" value="${abteilungInstance?.mitarbeiterfunktionen}" />
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
