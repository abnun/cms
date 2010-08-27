
<%@ page import="de.webmpuls.cms.section.Spielplan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'spielplan.label', default: 'Spielplan')}" />
        %{--<title><g:message code="default.show.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
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
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: spielplanInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.abteilungKuerzel.label" default="Abteilung Kuerzel" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: spielplanInstance, field: "abteilungKuerzel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.spieldatum.label" default="Spieldatum" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${spielplanInstance?.spieldatum}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.heimmannschaft.label" default="Heimmannschaft" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: spielplanInstance, field: "heimmannschaft")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.gastmannschaft.label" default="Gastmannschaft" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: spielplanInstance, field: "gastmannschaft")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.anstoss.label" default="Anstoss" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: spielplanInstance, field: "anstoss")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="spielplan.vermerk.label" default="Vermerk" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: spielplanInstance, field: "vermerk")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${spielplanInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
