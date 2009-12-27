
<%@ page import="de.webmpuls.cms.start.Anzeigen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'anzeigen.label', default: 'Anzeigen')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'anzeigen.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="ueberschrift1" title="${message(code: 'anzeigen.ueberschrift1.label', default: 'Ueberschrift1')}" />
                        
                            <g:sortableColumn property="ueberschrift2" title="${message(code: 'anzeigen.ueberschrift2.label', default: 'Ueberschrift2')}" />
                        
                            <th><g:message code="anzeigen.abteilung.label" default="Abteilung" /></th>
                   	    
                            <g:sortableColumn property="takeEndDate" title="${message(code: 'anzeigen.takeEndDate.label', default: 'Take End Date')}" />
                        
                            <g:sortableColumn property="endDatum" title="${message(code: 'anzeigen.endDatum.label', default: 'End Datum')}" />
                        
                            <g:sortableColumn property="inhalt" title="${message(code: 'anzeigen.inhalt.label', default: 'Inhalt')}" />
                        
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${anzeigenInstanceList}" status="i" var="anzeigenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: anzeigenInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: anzeigenInstance, field: "ueberschrift1")}</td>
                        
                            <td>${fieldValue(bean: anzeigenInstance, field: "ueberschrift2")}</td>
                        
                            <td>${fieldValue(bean: anzeigenInstance, field: "abteilung")}</td>
                        
                            <td><g:formatBoolean boolean="${anzeigenInstance.takeEndDate}" /></td>
                        
                            <td><g:formatDate date="${anzeigenInstance.endDatum}" /></td>
                        
                            <td width="270">${anzeigenInstance?.inhalt}</td>
                        
							<td><g:link action="edit" id="${anzeigenInstance.id}"><g:message code="anzeigen.edit" default="Bearbeiten" /></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${anzeigenInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
