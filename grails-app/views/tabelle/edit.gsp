
<%@ page import="de.webmpuls.cms.result.Tabelle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'tabelle.label', default: 'Tabelle')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            %{--<span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>--}%
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:hasErrors bean="${tabelleInstance}">
					<div class="ui-widget">
						<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
							<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
								<strong><g:message code="default.error"/>:</strong>
								<br/>
								<g:renderErrors bean="${tabelleInstance}" as="list"/>
						</div>
					</div>
            	</g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tabelleInstance?.id}" />
                <g:hiddenField name="version" value="${tabelleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="spieldatum"><g:message code="tabelle.spieldatum.label" default="Spieldatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'spieldatum', 'errors')}">
                                    <g:datePicker name="spieldatum" precision="day" value="${tabelleInstance?.spieldatum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="spielkennung"><g:message code="tabelle.spielkennung.label" default="Spielkennung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'spielkennung', 'errors')}">
                                    <g:textField name="spielkennung" value="${tabelleInstance?.spielkennung}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="heimmannschaft"><g:message code="tabelle.heimmannschaft.label" default="Heimmannschaft" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'heimmannschaft', 'errors')}">
                                    <g:textField name="heimmannschaft" value="${tabelleInstance?.heimmannschaft}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gastmannschaft"><g:message code="tabelle.gastmannschaft.label" default="Gastmannschaft" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'gastmannschaft', 'errors')}">
                                    <g:textField name="gastmannschaft" value="${tabelleInstance?.gastmannschaft}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="anstoss"><g:message code="tabelle.anstoss.label" default="Anstoss" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'anstoss', 'errors')}">
                                    <g:textField name="anstoss" value="${tabelleInstance?.anstoss}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tore"><g:message code="tabelle.tore.label" default="Tore" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'tore', 'errors')}">
                                    <g:textField name="tore" value="${tabelleInstance?.tore}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="spielklasse"><g:message code="tabelle.spielklasse.label" default="Spielklasse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'spielklasse', 'errors')}">
                                    <g:textField name="spielklasse" value="${tabelleInstance?.spielklasse}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="typ"><g:message code="tabelle.typ.label" default="Typ" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'typ', 'errors')}">
                                    <g:textField name="typ" value="${tabelleInstance?.typ}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="spielbericht"><g:message code="tabelle.spielbericht.label" default="Spielbericht" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabelleInstance, field: 'spielbericht', 'errors')}">
                                    <g:textArea name="spielbericht" cols="40" rows="5" value="${tabelleInstance?.spielbericht}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
