
<%@ page import="de.webmpuls.cms.section.Abteilung" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
		<g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
		<hr />
        <div class="body">
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
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
			<br/>
			Es sind ${abteilungInstanceTotal} Abteilungen im System hinterlegt.
			<br/>
			<br/>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'abteilung.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'abteilung.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'abteilung.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="anzeigeImMenu" title="${message(code: 'abteilung.anzeigeImMenu.label', default: 'Anzeige Im Menu')}" />
                        
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${abteilungInstanceList}" status="i" var="abteilungInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${abteilungInstance.id}">${fieldValue(bean: abteilungInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: abteilungInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: abteilungInstance, field: "code")}</td>
                        
                            <td><g:formatBoolean boolean="${abteilungInstance.anzeigeImMenu}" /></td>
                        
							<td><g:link action="edit" id="${abteilungInstance.id}"><g:message code="abteilung.edit" default="Bearbeiten" /></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${abteilungInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
