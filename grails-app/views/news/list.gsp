
<%@ page import="de.webmpuls.cms.start.News" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'news.label', default: 'News')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'news.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="lastModified" title="${message(code: 'news.lastModified.label', default: 'Last Modified')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'news.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${newsInstanceList}" status="i" var="newsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${newsInstance.id}">${fieldValue(bean: newsInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${newsInstance.lastModified}" /></td>
                        
                            <td><g:formatDate date="${newsInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${newsInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
