
<%@ page import="de.webmpuls.cms.section.Sponsor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
        %{--<title><g:message code="default.show.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            %{--<span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>--}%
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
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
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sponsor.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sponsor.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sponsor.beschreibung.label" default="Beschreibung" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: "beschreibung")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sponsor.verlinkung.label" default="Verlinkung" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: "verlinkung")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sponsor.bild.label" default="Bild" /></td>
                            
                            <td valign="top" class="value"><g:link controller="picture" action="show" id="${sponsorInstance?.bild?.id}">${sponsorInstance?.bild?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${sponsorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
