
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
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'termin.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="datum" title="${message(code: 'termin.datum.label', default: 'Datum')}" />
                        
                            <g:sortableColumn property="inhalt" title="${message(code: 'termin.inhalt.label', default: 'Inhalt')}" />

							<g:sortableColumn property="ort" title="${message(code: 'termin.ort.label', default: 'Ort')}" />

							<g:sortableColumn property="uhrzeit" title="${message(code: 'termin.uhrzeit.label', default: 'Uhrzeit')}" />

                            <g:sortableColumn property="findetStatt" title="${message(code: 'termin.findetStatt.label', default: 'Findet Statt')}" />
                        
                            <g:sortableColumn property="zusatzinfo" title="${message(code: 'termin.zusatzinfo.label', default: 'Zusatzinfo')}" />

							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${terminInstanceList}" status="i" var="terminInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: terminInstance, field: "id")}</td>
                        
                            <td><g:formatDate date="${terminInstance.datum}" /></td>
                        
                            <td>${fieldValue(bean: terminInstance, field: "inhalt")}</td>

							<td>${fieldValue(bean: terminInstance, field: "ort")}</td>

							<td>${fieldValue(bean: terminInstance, field: "uhrzeit")}</td>

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
