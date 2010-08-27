
<%@ page import="de.webmpuls.cms.section.Spielplan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'spielplan.label', default: 'Spielplan')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        %{--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>--}%
		<shiro:hasRole name="administrator">
		<g:render template="/global/javascript/createButtonJS"/>
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]"/></button>

		<g:render template="/global/javascript/backToListButtonJS" />
		<button id="backToListButton" style="margin-left: 10px;"><g:message code="default.back.to.list" /></button>
		<hr/>
		</shiro:hasRole>
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
				<br />
			</g:if>
			<g:if test="${flash.error}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:<br /><br /></strong>${flash.error}
						</p>
					</div>
				</div>
				<br />
			</g:if>
			<g:hasErrors bean="${propertyName}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:</strong>
							<br/>
							<g:renderErrors bean="${propertyName}" as="list"/>
					</div>
				</div>
			</g:hasErrors>
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
                        
                            <g:sortableColumn property="vermerk" title="${message(code: 'spielplan.vermerk.label', default: 'Vermerk')}" />
                        
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
                        
                            <td>${fieldValue(bean: spielplanInstance, field: "vermerk")}</td>
                        
							<td>
								<g:link action="edit" id="${spielplanInstance.id}"><g:message code="spielplan.edit" default="Bearbeiten" /></g:link>
								&nbsp;|&nbsp;
								<jq:jquery>
										$("#del_${fieldValue(bean: spielplanInstance, field: "id")}").click(function () {
											if(confirm("><g:message code="default.button.delete.confirm.message" default="Are you sure?" />'))
											{
												document.forms.DeleteForm_${fieldValue(bean: spielplanInstance, field: "id")}.submit();
											}
										});
								</jq:jquery>
								<a href="javascript: void(0);" id="del_${fieldValue(bean: spielplanInstance, field: 'id')}"><g:message code="spielplan.delete" default="Löschen" /></a>
								<g:form name="DeleteForm_${fieldValue(bean: spielplanInstance, field: 'id')}" method="post" url="${createLink(action: 'delete', id: fieldValue(bean: spielplanInstance, field: 'id'))}"></g:form>
						</td>
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
