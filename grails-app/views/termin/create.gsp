
<%@ page import="de.webmpuls.cms.start.Termin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'termin.label', default: 'Termin')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="body">
            %{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
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
            <g:hasErrors bean="${terminInstance}">
					<div class="ui-widget">
						<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
							<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
								<strong><g:message code="default.error"/>:</strong>
								<br/>
								<g:renderErrors bean="${terminInstance}" as="list"/>
						</div>
					</div>
            	</g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <jq:jquery>
						$(":checkbox[name='findetStatt']").change(function() {
							$('#zusatzInfoSPAN1').slideToggle('slow');
							$('#zusatzInfoSPAN2').slideToggle('slow');
						});
                    </jq:jquery>
					<table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datum"><g:message code="termin.datum.label" default="Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'datum', 'errors')}">
                                    <g:datePicker name="datum" precision="day" value="${terminInstance?.datum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="termin.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'inhalt', 'errors')}">
                                    <g:textArea name="inhalt" cols="40" rows="5" value="${terminInstance?.inhalt}" />
                                </td>
                            </tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="ort"><g:message code="termin.ort.label" default="Ort"/></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'ort', 'errors')}">
									<g:textField name="ort" value="${terminInstance?.ort}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="uhrzeit"><g:message code="termin.uhrzeit.label" default="Uhrzeit"/></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'uhrzeit', 'errors')}">
									<g:textField name="uhrzeit" value="${terminInstance?.uhrzeit}" />&nbsp;Uhr
								</td>
							</tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="findetStatt"><g:message code="termin.findetStatt.label" default="Findet Statt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'findetStatt', 'errors')}">
                                    <g:checkBox name="findetStatt" value="${terminInstance?.findetStatt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <span id="zusatzInfoSPAN1" style="display: none;">
										<label for="zusatzinfo"><g:message code="termin.zusatzinfo.label" default="Zusatzinfo" /></label>
									</span>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: terminInstance, field: 'zusatzinfo', 'errors')}">
                                    <span id="zusatzInfoSPAN2" style="display: none;">
										<g:textArea name="zusatzinfo" cols="40" rows="5" value="${terminInstance?.zusatzinfo}" />
									</span>
								</td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
