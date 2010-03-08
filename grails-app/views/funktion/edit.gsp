
<%@ page import="de.webmpuls.cms.media.MediaHelper; de.webmpuls.cms.people.Funktion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'funktion.label', default: 'Funktion')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
		<hr />
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${funktionInstance}">
            <div class="errors">
                <g:renderErrors bean="${funktionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${funktionInstance?.id}" />
                <g:hiddenField name="version" value="${funktionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="funktion.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funktionInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${funktionInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code"><g:message code="funktion.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funktionInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${funktionInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personen"><g:message code="funktion.personen.label" default="Personen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funktionInstance, field: 'personen', 'errors')}">
									<ul>
										<g:each in="${funktionInstance.personen}" var="p">
											<li><g:link controller="person" action="edit" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vorstand"><g:message code="funktion.vorstand.label" default="Vorstand" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funktionInstance, field: 'vorstand', 'errors')}">
                                    <g:checkBox name="vorstand" value="${funktionInstance?.vorstand}" />
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
