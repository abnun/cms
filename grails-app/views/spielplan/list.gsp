
<%@ page import="de.webmpuls.cms.section.Spielplan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'spielplan.label', default: 'Spielplan')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'spielplan.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="abteilungKuerzel" title="${message(code: 'spielplan.abteilungKuerzel.label', default: 'Abteilung Kuerzel')}" />
                        
                            <g:sortableColumn property="spieldatum" title="${message(code: 'spielplan.spieldatum.label', default: 'Spieldatum')}" />
                        
                            <g:sortableColumn property="heimmannschaft" title="${message(code: 'spielplan.heimmannschaft.label', default: 'Heimmannschaft')}" />
                        
                            <g:sortableColumn property="gastmannschaft" title="${message(code: 'spielplan.gastmannschaft.label', default: 'Gastmannschaft')}" />
                        
                            <g:sortableColumn property="anstoss" title="${message(code: 'spielplan.anstoss.label', default: 'Anstoss')}" />
                        
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${spielplanInstanceList}" status="i" var="spielplanInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${spielplanInstance.id}">${fieldValue(bean: spielplanInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: spielplanInstance, field: "abteilungKuerzel")}</td>
                        
                            <td><g:formatDate date="${spielplanInstance.spieldatum}" /></td>
                        
                            <td>${fieldValue(bean: spielplanInstance, field: "heimmannschaft")}</td>
                        
                            <td>${fieldValue(bean: spielplanInstance, field: "gastmannschaft")}</td>
                        
                            <td>${fieldValue(bean: spielplanInstance, field: "anstoss")}</td>
                        
							<td><g:link action="edit" id="${spielplanInstance.id}"><g:message code="spielplan.edit" default="Bearbeiten" /></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${spielplanInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
