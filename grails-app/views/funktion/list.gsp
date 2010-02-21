
<%@ page import="de.webmpuls.cms.people.Funktion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'funktion.label', default: 'Funktion')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			<g:render template="/global/menu/admin" />
        </div>
        <div class="body">
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<br/>
			Es sind ${funktionInstanceTotal} Funktionen im System hinterlegt.
			<br/>
			<br/>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th>&nbsp;</th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'funktion.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'funktion.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="vorstand" title="${message(code: 'funktion.vorstand.label', default: 'Vorstand')}" />

							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${funktionInstanceList}" status="i" var="funktionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${funktionInstance.id}">${i + 1}</g:link></td>
                        
                            <td>${fieldValue(bean: funktionInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: funktionInstance, field: "code")}</td>
                        
                            <td><g:formatBoolean boolean="${funktionInstance.vorstand}" /></td>

							<td><g:link action="edit" id="${funktionInstance.id}"><g:message code="funktion.edit" default="Bearbeiten" /></g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${funktionInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
