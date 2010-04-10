
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
		<g:render template="/global/javascript/backToListButtonJS" />
		<button id="backToListButton" style="margin-left: 10px;"><g:message code="default.back.to.list" /></button>
		<hr />
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
				<div class="ui-widget">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							${flash.message}
						</p>
					</div>
				</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error" />:</strong>&nbsp;${flash.error}
						</p>
					</div>
				</div>
            </g:if>
            <g:hasErrors bean="${funktionInstance}">
					<div class="ui-widget">
						<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
							<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
								<strong><g:message code="default.error"/>:</strong>
								<br/>
								<g:renderErrors bean="${funktionInstance}" as="list"/>
						</div>
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
