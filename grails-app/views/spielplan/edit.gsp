
<%@ page import="de.webmpuls.cms.section.Spielplan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'spielplan.label', default: 'Spielplan')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        %{--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>--}%
		<shiro:hasRole name="administrator">
		<g:render template="/global/javascript/createButtonJS"/>
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]"/></button>

		<g:render template="/global/javascript/backToListButtonJS" />
		<button id="backToListButton" style="margin-left: 10px;"><g:message code="default.back.to.list" /></button>
		<hr/>
		</shiro:hasRole>
        <div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
				<div class="ui-widget">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							${flash.message}
						</p>
					</div>
				</div>
				<br />
			</g:if>
			<g:if test="${flash.error}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:<br /><br /></strong>${flash.error}
						</p>
					</div>
				</div>
				<br />
			</g:if>
			<g:hasErrors bean="${spielplanInstance}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:</strong>
							<br/>
							<g:renderErrors bean="${spielplanInstance}" as="list"/>
					</div>
				</div>
			</g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${spielplanInstance?.id}" />
                <g:hiddenField name="version" value="${spielplanInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="abteilungKuerzel"><g:message code="spielplan.abteilungKuerzel.label" default="Abteilung Kuerzel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'abteilungKuerzel', 'errors')}">
                                    <g:textField name="abteilungKuerzel" value="${spielplanInstance?.abteilungKuerzel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="spieldatum"><g:message code="spielplan.spieldatum.label" default="Spieldatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'spieldatum', 'errors')}">
                                    <g:datePicker name="spieldatum" precision="day" value="${spielplanInstance?.spieldatum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="heimmannschaft"><g:message code="spielplan.heimmannschaft.label" default="Heimmannschaft" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'heimmannschaft', 'errors')}">
                                    <g:textField name="heimmannschaft" value="${spielplanInstance?.heimmannschaft}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gastmannschaft"><g:message code="spielplan.gastmannschaft.label" default="Gastmannschaft" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'gastmannschaft', 'errors')}">
                                    <g:textField name="gastmannschaft" value="${spielplanInstance?.gastmannschaft}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="anstoss"><g:message code="spielplan.anstoss.label" default="Anstoss" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'anstoss', 'errors')}">
                                    <g:textField name="anstoss" value="${spielplanInstance?.anstoss}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vermerk"><g:message code="spielplan.vermerk.label" default="Vermerk" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'vermerk', 'errors')}">
                                    <g:textField name="vermerk" value="${spielplanInstance?.vermerk}" />
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
