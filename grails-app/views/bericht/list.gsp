
<%@ page import="de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.section.Bericht" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'bericht.label', default: 'Bericht')}" />
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

							<g:sortableColumn property="id" title="${message(code: 'bericht.id.label', default: 'Id')}"/>

							<g:sortableColumn property="ueberschrift" title="${message(code: 'bericht.ueberschrift.label', default: 'Ueberschrift')}"/>

							<g:sortableColumn property="inhalt" title="${message(code: 'bericht.inhalt.label', default: 'Inhalt')}"/>

							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
								<g:sortableColumn property="dateCreated" title="${message(code: 'bericht.dateCreated.label', default: 'Date Created')}"/>

								<g:sortableColumn property="lastUpdated" title="${message(code: 'bericht.lastUpdated.label', default: 'Last Updated')}"/>
							</shiro:hasRole>

                            <th><g:message code="bericht.album.label" default="Album" /></th>
                   	    
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${berichtInstanceList}" status="i" var="berichtInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${berichtInstance.id}">${fieldValue(bean: berichtInstance, field: "id")}</g:link></td>

							<td>${fieldValue(bean: berichtInstance, field: "ueberschrift")}</td>

							<td>${fieldValue(bean: berichtInstance, field: "inhalt")}</td>

							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
								<td><g:formatDate date="${berichtInstance.dateCreated}"/></td>

								<td><g:formatDate date="${berichtInstance.lastUpdated}"/></td>
							</shiro:hasRole>

                            <td>${fieldValue(bean: berichtInstance, field: "album")}</td>
                        
							<td><g:link action="edit" id="${berichtInstance.id}"><g:message code="bericht.edit" default="Bearbeiten" /></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${berichtInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
