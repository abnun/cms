
<%@ page import="de.webmpuls.cms.section.Trainingstag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'trainingstag.label', default: 'Trainingstag')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'trainingstag.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="tag" title="${message(code: 'trainingstag.tag.label', default: 'Tag')}" />
                        
                            <g:sortableColumn property="uhrzeiten" title="${message(code: 'trainingstag.uhrzeiten.label', default: 'Uhrzeiten')}" />
                        
                            <g:sortableColumn property="ort" title="${message(code: 'trainingstag.ort.label', default: 'Ort')}" />
                        
                            <th><g:message code="trainingstag.trainingszeit.label" default="Trainingszeit" /></th>
                   	    
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${trainingstagInstanceList}" status="i" var="trainingstagInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${trainingstagInstance.id}">${fieldValue(bean: trainingstagInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: trainingstagInstance, field: "tag")}</td>
                        
                            <td>${fieldValue(bean: trainingstagInstance, field: "uhrzeiten")}</td>
                        
                            <td>${fieldValue(bean: trainingstagInstance, field: "ort")}</td>
                        
                            <td>${fieldValue(bean: trainingstagInstance, field: "trainingszeit")}</td>
                        
							<td>
								<g:link action="edit" id="${trainingstagInstance.id}"><g:message code="trainingstag.edit" default="Bearbeiten" /></g:link>
								&nbsp;|&nbsp;
								<g:link action="delete" id="${trainingstagInstance.id}"><g:message code="trainingstag.delete" default="Löschen" /></g:link>
								<jq:jquery>
										$("#del_${fieldValue(bean: trainingstagInstance, field: "id")}").click(function () {
											if(confirm("><g:message code="default.button.delete.confirm.message" default="Are you sure?" />'))
											{
												document.forms.DeleteForm_${fieldValue(bean: trainingstagInstance, field: "id")}.submit();
											}
										});
								</jq:jquery>
								<a href="javascript: void(0);" id="del_${fieldValue(bean: trainingstagInstance, field: 'id')}"><g:message code="trainingstag.delete" default="Löschen" /></a>
								<g:form name="DeleteForm_${fieldValue(bean: trainingstagInstance, field: 'id')}" method="post" url="${createLink(action: 'delete', id: fieldValue(bean: trainingstagInstance, field: 'id'))}"></g:form>
						</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${trainingstagInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
