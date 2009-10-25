
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
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'funktion.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'funktion.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'funktion.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="vorstand" title="${message(code: 'funktion.vorstand.label', default: 'Vorstand')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${funktionInstanceList}" status="i" var="funktionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${funktionInstance.id}">${fieldValue(bean: funktionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: funktionInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: funktionInstance, field: "code")}</td>
                        
                            <td><g:formatBoolean boolean="${funktionInstance.vorstand}" /></td>
                        
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
