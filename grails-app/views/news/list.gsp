
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
                        
                            %{--<g:sortableColumn property="id" title="${message(code: 'news.id.label', default: 'Id')}" />--}%
                        
                            <g:sortableColumn property="ueberschrift" title="${message(code: 'news.ueberschrift.label', default: 'Ueberschrift')}" />
                        
                            <th><g:message code="news.abteilung.label" default="Abteilung" /></th>
                   	    
                            <g:sortableColumn property="inhalt" title="${message(code: 'news.inhalt.label', default: 'Inhalt')}" />
                        
                            %{--<g:sortableColumn property="dateCreated" title="${message(code: 'news.dateCreated.label', default: 'Date Created')}" />--}%
                        
                            %{--<g:sortableColumn property="lastModified" title="${message(code: 'news.lastModified.label', default: 'Last Modified')}" />--}%
                        
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${newsInstanceList}" status="i" var="newsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            %{--<td>${fieldValue(bean: newsInstance, field: "id")}</td>--}%
                        
                            <td>${fieldValue(bean: newsInstance, field: "ueberschrift")}</td>
                        
                            <td>${fieldValue(bean: newsInstance, field: "abteilung")}</td>
                        
                            <td width="270">${newsInstance?.inhalt}</td>
                        
                            %{--<td><g:formatDate date="${newsInstance.dateCreated}" /></td>--}%
                        
                            %{--<td><g:formatDate date="${newsInstance.lastModified}" /></td>--}%
                        
							<td><g:link action="edit" id="${newsInstance.id}"><g:message code="news.edit" default="Bearbeiten" /></g:link></td>
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
