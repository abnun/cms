
<%@ page import="de.webmpuls.cms.section.InfoBox" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'infoBox.label', default: 'InfoBox')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'infoBox.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="ueberschrift" title="${message(code: 'infoBox.ueberschrift.label', default: 'Ueberschrift')}" />
                        
                            <g:sortableColumn property="inhalt" title="${message(code: 'infoBox.inhalt.label', default: 'Inhalt')}" />
                        
                            <g:sortableColumn property="position" title="${message(code: 'infoBox.position.label', default: 'Position')}" />
                        
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${infoBoxInstanceList}" status="i" var="infoBoxInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${infoBoxInstance.id}">${fieldValue(bean: infoBoxInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: infoBoxInstance, field: "ueberschrift")}</td>
                        
                            <td>${fieldValue(bean: infoBoxInstance, field: "inhalt")}</td>
                        
                            <td>${fieldValue(bean: infoBoxInstance, field: "position")}</td>
                        
							<td>
								<g:link action="edit" id="${infoBoxInstance.id}"><g:message code="infoBox.edit" default="Bearbeiten" /></g:link>
								&nbsp;|&nbsp;
								<jq:jquery>
										$("#del_${fieldValue(bean: infoBoxInstance, field: "id")}").click(function () {
											if(confirm("><g:message code="default.button.delete.confirm.message" default="Are you sure?" />'))
											{
												document.forms.DeleteForm_${fieldValue(bean: infoBoxInstance, field: "id")}.submit();
											}
										});
								</jq:jquery>
								<a href="javascript: void(0);" id="del_${fieldValue(bean: infoBoxInstance, field: 'id')}"><g:message code="infoBox.delete" default="Löschen" /></a>
								<g:form name="DeleteForm_${fieldValue(bean: infoBoxInstance, field: 'id')}" method="post" url="${createLink(action: 'delete', id: fieldValue(bean: infoBoxInstance, field: 'id'))}"></g:form>
						</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${infoBoxInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
