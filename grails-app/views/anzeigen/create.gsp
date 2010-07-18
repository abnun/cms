
<%@ page import="de.webmpuls.cms.start.Anzeigen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'anzeigen.label', default: 'Anzeigen')}" />
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
            <g:hasErrors bean="${anzeigenInstance}">
					<div class="ui-widget">
						<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
							<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
								<strong><g:message code="default.error"/>:</strong>
								<br/>
								<g:renderErrors bean="${anzeigenInstance}" as="list"/>
						</div>
					</div>
            	</g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift1"><g:message code="anzeigen.ueberschrift1.label" default="Ueberschrift1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'ueberschrift1', 'errors')}">
                                    <g:textField name="ueberschrift1" value="${anzeigenInstance?.ueberschrift1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift2"><g:message code="anzeigen.ueberschrift2.label" default="Ueberschrift2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'ueberschrift2', 'errors')}">
                                    <g:textField name="ueberschrift2" value="${anzeigenInstance?.ueberschrift2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abteilung"><g:message code="anzeigen.abteilung.label" default="Abteilung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'abteilung', 'errors')}">
                                    <g:select name="abteilung.id" from="${de.webmpuls.cms.section.Abteilung.list().sort{a,b -> a.toString().toLowerCase() <=> b.toString().toLowerCase()}}" optionKey="id" value="${anzeigenInstance?.abteilung?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="anzeigen.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'inhalt', 'errors')}">
                                    %{--<g:textField name="inhalt" value="${anzeigenInstance?.inhalt}" />--}%
									<g:render template="/global/ckeditor/editor" model="['inhalt': anzeigenInstance?.inhalt]" />
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="takeEndDate"><g:message code="anzeigen.takeEndDate.label" default="Take End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'takeEndDate', 'errors')}">
                                    <g:checkBox name="takeEndDate" value="${anzeigenInstance?.takeEndDate}" />
                                </td>
                            </tr>

						<jq:jquery>
							$(":checkbox[name='takeEndDate']").change(function() {
							   $("#endDatumSPAN1").slideToggle('slow');
							   $("#endDatumSPAN2").slideToggle('slow');
						   	});

							<g:if test="${anzeigenInstance?.takeEndDate}">
								$("#endDatumSPAN1").slideToggle('slow');
							 	$("#endDatumSPAN2").slideToggle('slow');
							</g:if>
						</jq:jquery>

                            <tr class="prop">
                                <td valign="top" class="name">
									<span id="endDatumSPAN1" style="display: none;">
										<label for="endDatum"><g:message code="anzeigen.endDatum.label" default="End Datum" /></label>
									</span>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'endDatum', 'errors')}">
                                    <span id="endDatumSPAN2" style="display: none;">
										<g:datePicker name="endDatum" precision="day" value="${anzeigenInstance?.endDatum}" noSelection="['': '']" />
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
