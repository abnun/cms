
<%@ page import="de.webmpuls.cms.people.Funktion; de.webmpuls.cms.people.Person; de.webmpuls.cms.section.Abteilung" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
		
			<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
				%{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
			<g:render template="/global/javascript/jQueryUIJS" />

		<jq:jquery>
			var personArray = [${pBuilder}];
			$('#person').autocomplete({
				source: personArray
			});

			var funktionArray = [${fBuilder}];
			$('#funktion').autocomplete({
				source: funktionArray
			});
		</jq:jquery>

		<jq:jquery>

			$('#dialog').dialog( {
						title: 'Zuordnung-Dialog',
						bgiframe: true,
						autoOpen: false,
						closeOnEscape: true,
						modal: true,
						resizable: false,
						hide: 'explode',
						width: 600,
						buttons: {
							"Zuordnung erstellen": function() {
								var pValue = $("input[name='person']").val();
								var fValue = $("input[name='funktion']").val();

								if(pValue != "" && fValue != "")
								{
									$("input[name='personen']").val(pValue);
									$("input[name='funktionen']").val(fValue);
									$("#AbteilungForm").attr("action", '${createLink(action: 'update')}');
									$("#AbteilungForm").submit();
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

		<g:render template="/global/javascript/buttonJS" />

		<g:render template="/global/css/buttonCSS" />

		<style type="text/css">
			.ui-autocomplete {
				width: 200px;
			}
		</style>
	</head>
		<body>
			<div class="nav">
				<span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
				<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
				%{--<g:render template="/global/menu/admin" />--}%
			</div>
			<div class="body">
				%{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
				<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${abteilungInstance}">
				<div class="errors">
					<g:renderErrors bean="${abteilungInstance}" as="list" />
				</div>
				</g:hasErrors>
				<g:form method="post" name="AbteilungForm">
					<g:hiddenField name="id" value="${abteilungInstance?.id}" />
					<g:hiddenField name="version" value="${abteilungInstance?.version}" />
					<div class="dialog">
						<table>
							<tbody>

								<tr class="prop">
									<td valign="top" class="name">
									  <label for="name"><g:message code="abteilung.name.label" default="Name" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'name', 'errors')}">
										<g:textField name="name" value="${abteilungInstance?.name}" />
									</td>
								</tr>

								%{--<tr class="prop">
									<td valign="top" class="name">
									  <label for="code"><g:message code="abteilung.code.label" default="Code" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'code', 'errors')}">
										<g:textField name="code" value="${abteilungInstance?.code}" />
									</td>
								</tr>--}%

								<tr class="prop">
									<td valign="top" class="name">
									  <label for="anzeigeImMenu"><g:message code="abteilung.anzeigeImMenu.label" default="Anzeige Im Menu" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'anzeigeImMenu', 'errors')}">
										<g:checkBox name="anzeigeImMenu" value="${abteilungInstance?.anzeigeImMenu}" />
									</td>
								</tr>

								%{--<tr class="prop">
									<td valign="top" class="name">
									  <label for="unterabteilungen"><g:message code="abteilung.unterabteilungen.label" default="Unterabteilungen" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'unterabteilungen', 'errors')}">
										<g:select name="unterabteilungen" from="${de.webmpuls.cms.section.Abteilung.list()}" multiple="yes" optionKey="id" size="5" value="${abteilungInstance?.unterabteilungen}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
									  <label for="mitarbeiterfunktionen"><g:message code="abteilung.mitarbeiterfunktionen.label" default="Mitarbeiterfunktionen" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'mitarbeiterfunktionen', 'errors')}">
										<g:select name="mitarbeiterfunktionen" from="${de.webmpuls.cms.people.Funktion.list()}" multiple="yes" optionKey="id" size="5" value="${abteilungInstance?.mitarbeiterfunktionen}" />
									</td>
								</tr>--}%

								<tr class="prop">
									<td colspan="2" valign="top">
										<table>
											<tr>
												<td valign="top" align="left" class="name">
													<g:message code="abteilung.personen.label" default="Personen"/>
												</td>
												<td valign="top" align="left">
													%{--<g:select name="personen" from="${abteilungInstance.personen}" multiple="yes" optionKey="id" size="${abteilungInstance.personen.size()}" value="${abteilungInstance?.personen}" disabled="disabled"/>--}%
													<ul>
														<g:each in="${abteilungInstance.personen}" var="p">
															<%
																Collection tmpFunktionen = p?.funktionen?.findAll
																{
																	Funktion tmpFunktion ->

																	if(abteilungInstance.mitarbeiterfunktionen?.contains(tmpFunktion))
																	{
																		return true
																	}
																}
															%>
															<li>
																<table>
																	<tr>
																		<td valign="top" align="left" width="300">
																			<g:link controller="person" action="edit" id="${p.id}">${p?.encodeAsHTML()} ${tmpFunktionen ?: ''}</g:link>
																		</td>
																		<td valign="top" align="left">
																			<g:link controller="abteilung" action="removePerson" params="['person.id': p.id, 'id': abteilungInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="ui-icon ui-icon-circle-minus" title="${p?.encodeAsHTML()} löschen"></span></g:link>
																		</td>
																	</tr>
																</table>
															</li>
														</g:each>
													</ul>
												</td>
												%{--<td valign="top" align="left">
													<g:message code="abteilung.funktionen.label" default="Funktionen"/>
												</td>
												<td valign="top" align="left">--}%
													%{--<g:select name="personen" from="${abteilungInstance.personen}" multiple="yes" optionKey="id" size="${abteilungInstance.personen.size()}" value="${abteilungInstance?.personen}" disabled="disabled"/>--}%
													%{--<ul>
														<g:each in="${abteilungInstance.mitarbeiterfunktionen}" var="f">
															<li><g:link controller="funktion" action="edit" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
														</g:each>
													</ul>
												</td>--}%
											</tr>
										</table>
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" colspan="2">
										<br/>
										<a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Zuordnungen&nbsp;hinzufügen</a>
										<br/>
										<br/>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="buttons">
						<span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
				<g:hiddenField name="personen" value="" />
				<g:hiddenField name="funktionen" value="" />
            </g:form>
        </div>

		<div id="dialog">
			<table>
				<tr>
					<td valign="top" align="left">
						<label for="person">Person:</label>
					</td>
					<td valign="top" align="left">
						<g:textField name="person" id="person" style="width: 200px;"/>
					</td>
					<td valign="top" align="left">
						<label for="funktion">Funktion:</label>
					</td>
					<td valign="top" align="left">
						<g:textField name="funktion" id="funktion" style="width: 200px;"/>
					</td>
				</tr>
			</table>
			<br/>
			<div id="dialog_error" class="ui-widget" style="display: none;">
				<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
					<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
						<strong>Fehler:</strong> Es muss sowohl eine Person als auch eine Funktion gewählt sein!</p>
				</div>
			</div>
		</div>
    </body>
</html>
