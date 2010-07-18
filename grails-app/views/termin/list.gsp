
<%@ page import="de.webmpuls.cms.start.Termin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'termin.label', default: 'Termin')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            %{--<span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>--}%
            <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
        </div>
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            %{--<g:sortableColumn property="id" title="${message(code: 'termin.id.label', default: 'Id')}" />--}%
                        
                            <g:sortableColumn property="startDatum" title="${message(code: 'termin.startDatum.label', default: 'Von')}" />

							<g:sortableColumn property="endDatum" title="${message(code: 'termin.endDatum.label', default: 'Bis')}" />

                            <g:sortableColumn property="inhalt" title="${message(code: 'termin.inhalt.label', default: 'Inhalt')}" />

							<g:sortableColumn property="ort" title="${message(code: 'termin.ort.label', default: 'Ort')}" />

							<g:sortableColumn property="abteilung" title="${message(code: 'termin.abteilung.label', default: 'Abteilung')}" />

							<g:sortableColumn property="uhrzeit" title="${message(code: 'termin.uhrzeit.label', default: 'Uhrzeit')}" />

                            <g:sortableColumn property="findetStatt" title="${message(code: 'termin.findetStatt.label', default: 'Findet Statt')}" />
                        
                            <g:sortableColumn property="zusatzinfo" title="${message(code: 'termin.zusatzinfo.default.label', default: 'Zusatzinfo')}" />

							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${terminInstanceList}" status="i" var="terminInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            %{--<td>${fieldValue(bean: terminInstance, field: "id")}</td>--}%
                        
                            <td><g:formatDate date="${terminInstance.startDatum}" /></td>

							<td><g:formatDate date="${terminInstance.endDatum}" /></td>

							<td>${fieldValue(bean: terminInstance, field: "uhrzeit")}</td>

                            <td>${fieldValue(bean: terminInstance, field: "inhalt")}</td>

							<td>${fieldValue(bean: terminInstance, field: "ort")}</td>

							<td>${fieldValue(bean: terminInstance, field: "abteilung")}</td>

                            <td><g:formatBoolean boolean="${terminInstance.findetStatt}" /></td>
                        
                            <td>${fieldValue(bean: terminInstance, field: "zusatzinfo")}</td>

							<td><g:link action="edit" id="${terminInstance.id}">Bearbeiten</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${terminInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
