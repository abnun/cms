
<%@ page import="de.webmpuls.cms.start.Aktuelles" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'aktuelles.label', default: 'Aktuelles')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            %{--<span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>--}%
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'aktuelles.id.label', default: 'Id')}" />
                        	<th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${aktuellesInstanceList}" status="i" var="aktuellesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: aktuellesInstance, field: "id")}</td>

							<td><g:link action="edit" id="${aktuellesInstance.id}">Bearbeiten</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${aktuellesInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
