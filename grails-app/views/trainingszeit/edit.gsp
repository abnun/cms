
<%@ page import="de.webmpuls.cms.section.Trainingszeit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'trainingszeit.label', default: 'Trainingszeit')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
		<jq:jquery>
			$('#dialog').dialog( {
								title: 'Trainingstag-Dialog',
								bgiframe: true,
								autoOpen: false,
								closeOnEscape: true,
								modal: true,
								resizable: false,
								hide: 'explode',
								width: 760,
								buttons: {
									"Trainingstage hinzufügen": function() {
										var tValue = $("input[name='tag']").val();
										var uvValue = $("input[name='von']").val();
										var ubValue = $("input[name='bis']").val();

										if(tValue != "" && uvValue != "" && ubValue != "")
										{
											$("#TrainingstagForm").submit();
										}
										else
										{
											$("#dialog_error").slideDown("slow");
										}

							},
							"abbrechen": function() {
								$(this).dialog('close');
							}
						}
				});
		</jq:jquery>

		<g:render template="/global/javascript/buttonJS"/>

		<g:render template="/global/css/buttonCSS"/>

		<style type="text/css">
		.ui-autocomplete {
			width: 200px;
		}
		</style>
    </head>
    <body>
        <g:render template="/global/javascript/backToListButtonJS" />
		<button id="backToListButton" style="margin-left: 10px;"><g:message code="default.back.to.list" /></button>
		<hr/>
        <div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${trainingszeitInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingszeitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${trainingszeitInstance?.id}" />
                <g:hiddenField name="version" value="${trainingszeitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bezeichnung"><g:message code="trainingszeit.bezeichnung.label" default="Bezeichnung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'bezeichnung', 'errors')}">
                                    <g:textField name="bezeichnung" value="${trainingszeitInstance?.bezeichnung}" />
                                </td>
                            </tr>
                        
                            %{--<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ort"><g:message code="trainingszeit.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" value="${trainingszeitInstance?.ort}" />
                                </td>
                            </tr>--}%



                            %{--<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="trainingstage"><g:message code="trainingszeit.trainingstage.label" default="Trainingstage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingszeitInstance, field: 'trainingstage', 'errors')}">
                                    <g:select name="trainingstage" from="${de.webmpuls.cms.section.Trainingstag.list()}" multiple="yes" optionKey="id" size="5" value="${trainingszeitInstance?.trainingstage}" />
                                </td>
                            </tr>--}%
						<tr>
							<td valign="top" align="left" class="name">
								<g:message code="trainingszeit.trainingstage.label" default="Trainingstage"/>
							</td>
							<td valign="top" align="left">
								<ul>
									<g:each in="${trainingszeitInstance.trainingstage}" var="tt">
										<li>
											<table>
												<tr>
													<td valign="top" align="left" width="300">
														<g:link controller="trainingstag" action="edit" id="${tt.id}">${tt?.encodeAsHTML()}</g:link>
													</td>
													<td valign="top" align="left">
														<g:link controller="trainingszeit" action="removeTrainingstag" params="['trainingstag.id': tt.id, 'id': trainingszeitInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="ui-icon ui-icon-circle-minus" title="${tt?.encodeAsHTML()} löschen"></span></g:link>
													</td>
												</tr>
											</table>
										</li>
									</g:each>
								</ul>
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" colspan="2">
								<br/>
								<a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Trainingstage&nbsp;hinzufügen</a>
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

	<div id="dialog" style="width: 750px">
		<g:form controller="trainingszeit" action="createTrainingstagFromTrainingszeit" method="post" name="TrainingstagForm">
		<table style="width: 750px">
			<tr>
				<td valign="middle" align="left">
					<label for="tag">Tag:</label>
				</td>
				<td valign="middle" align="left">
					<g:select name="tag" from="${de.webmpuls.cms.section.Tag?.values()}"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="left">Uhrzeiten</td>
			</tr>
			<tr>
				<td colspan="2">
					<table cellspacing="5" cellpadding="5">
						<tr>
							<td valign="middle" align="left">
								<label for="von">Von:</label>
							</td>
							<td valign="middle" align="left">
								<g:textField name="von" id="von" style="width: 60px;"/>&nbsp;Uhr
							</td>
							<td valign="middle" align="left">
								<label for="bis">Bis:</label>
							</td>
							<td valign="middle" align="left">
								<g:textField name="bis" id="bis" style="width: 60px;"/>&nbsp;Uhr
							</td>
						</tr>
					</table>
				</td>
				<td>
					(z.B. 13.30 bis 15.00)
				</td>
			</tr>
			<tr>
				<td valign="middle" align="left">
					<label for="ort">Ort:</label>
				</td>
				<td valign="middle" align="left">
					<select name="ort" size="1">
						<option value="">Auswählen</option>
						<option>am Beachfeld</option>
						<option>in der Eichbotthalle</option>
						<option>in der Festhalle</option>
						<option>im Freibad</option>
						<option>im Gymnastikraum</option>
						<option>im Hallenbad</option>
						<option>im Heuchelbergstadion</option>
						<option>im SVL-Sportheim</option>
						<option>im SVS-Sportheim</option>
						<option>im Leintalstadion</option>
						<option>in der Tennisanlage</option>
						<option>am Trim-Dich-Pfad</option>
						<option>an der Reitanlage</option>
					</select>
				</td>
				<td></td>
			</tr>
		</table>
			<g:hiddenField name="trainingszeit.id" value="${trainingszeitInstance.id}"/>
		</g:form>
		<br/>
		<div id="dialog_error" class="ui-widget" style="display: none;">
			<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
				<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
					<strong>Fehler:</strong> Es muss sowohl ein Tag als auch eine Uhrzeit ausgewählt sein!</p>
			</div>
		</div>
	</div>
	
    </body>
</html>
