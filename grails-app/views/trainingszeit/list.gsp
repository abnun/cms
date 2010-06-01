
<%@ page import="de.webmpuls.cms.section.Trainingszeit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'trainingszeit.label', default: 'Trainingszeit')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'trainingszeit.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'trainingszeit.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="ort" title="${message(code: 'trainingszeit.ort.label', default: 'Ort')}" />
                        
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${trainingszeitInstanceList}" status="i" var="trainingszeitInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${trainingszeitInstance.id}">${fieldValue(bean: trainingszeitInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: trainingszeitInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: trainingszeitInstance, field: "ort")}</td>
                        
							<td><g:link action="edit" id="${trainingszeitInstance.id}"><g:message code="trainingszeit.edit" default="Bearbeiten" /></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${trainingszeitInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
