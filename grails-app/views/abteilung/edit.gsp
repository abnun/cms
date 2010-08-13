<%@ page import="de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.section.Spielplan; de.webmpuls.cms.people.Funktion; de.webmpuls.cms.people.Person; de.webmpuls.cms.section.Abteilung" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>

	<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}"/>
	%{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
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
								title: 'Zuordnung',
								bgiframe: true,
								autoOpen: false,
								closeOnEscape: true,
								modal: true,
								resizable: false,
								hide: 'explode',
								width: 760,
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

		$('#sp_dialog').dialog( {
								title: 'Spielplan',
								bgiframe: true,
								autoOpen: ${spielplanInhalt ? 'true' : 'false'},
								closeOnEscape: true,
								modal: true,
								resizable: false,
								hide: 'explode',
								width: 760,
								buttons: {
									"Spielplan erstellen": function() {
										var iValue = $("textarea[name='inhalt']").val();

										if(iValue != "")
										{
											$("#SpielplanForm").submit();
										}
										else
										{
											$("#sp_dialog_error").slideDown("slow");
										}

							},
							"abbrechen": function() {
								$(this).dialog('close');
							}
						}
				});

		$('#tz_dialog').dialog( {
								title: 'Trainingszeiten',
								bgiframe: true,
								autoOpen: false,
								closeOnEscape: true,
								modal: true,
								resizable: false,
								hide: 'explode',
								width: 760,
								buttons: {
									"Trainingszeiten zuweisen": function() {
										var nValue = $("input[name='bezeichnung']").val();
										var tValue = $("input[name='tag']").val();
										var uvValue = $("input[name='von']").val();
										var ubValue = $("input[name='bis']").val();

										if(nValue != "" && tValue != "" && uvValue != "" && ubValue != "")
										{
											$("#TrainingszeitForm").submit();
										}
										else
										{
											$("#tz_dialog_error").slideDown("slow");
										}

							},
							"abbrechen": function() {
								$(this).dialog('close');
							}
						}
				});

		$('#ib_dialog').dialog( {
								title: 'Sonstiges',
								bgiframe: true,
								autoOpen: false,
								closeOnEscape: true,
								modal: true,
								resizable: false,
								hide: 'explode',
								width: 760,
								buttons: {
									"erstellen": function() {
										var iValue = $("textarea[name='infoBox_inhalt']").val();
										var ueValue = $("input[name='infoBox_ueberschrift']").val();
										var pValue = $("input[name='infoBox_position']").val();

										if(iValue != "" && ueValue != "" && pValue != "")
										{
											$("#InfoBoxZuordnungForm").submit();
										}
										else
										{
											$("#ib_dialog_error").slideDown("slow");
										}

							},
							"abbrechen": function() {
								$(this).dialog('close');
							}
						}
				});

		if(${spielplanInhalt ? 'true' : 'false'})
		{
			$("#sp_dialog_error2").slideDown("slow");
		}

		if(${infoBoxInhalt ? 'true' : 'false'})
		{
			$("#ib_dialog_error").slideDown("slow");
		}
	</jq:jquery>

	<g:render template="/global/javascript/buttonJS"/>

	<g:render template="/global/javascript/buttonJS" model="[dialogLinkId: 'sp_dialog_link', dialogId: 'sp_dialog']" />

	<g:render template="/global/javascript/buttonJS" model="[dialogLinkId: 'tz_dialog_link', dialogId: 'tz_dialog']" />

	<g:render template="/global/javascript/buttonJS" model="[dialogLinkId: 'ib_dialog_link', dialogId: 'ib_dialog']" />

	<g:render template="/global/css/buttonCSS"/>

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'sp_dialog_link']" />

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'tz_dialog_link']" />

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'ib_dialog_link']" />

	<style type="text/css">
	.ui-autocomplete {
		width: 200px;
	}
	</style>
</head>
<body>
<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
<g:render template="/global/javascript/createButtonJS"/>
<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]"/></button>

<g:render template="/global/javascript/backToListButtonJS" />
<button id="backToListButton" style="margin-left: 10px;"><g:message code="default.back.to.list" /></button>
</shiro:hasRole>
<jq:jquery>
	$("#showAbteilungButton").button({
		icons: {
			primary: 'ui-icon-arrowthick-1-e'
		}
	}).click(function() {
		<g:if test="${abteilungInstance.hasUnterAbteilungen()}">
			window.location.href = '${createLink(action: 'aktuelles', params: ['code': abteilungInstance.code], mapping: 'abteilungAktuelles')}';
		</g:if>
		<g:else>
			window.location.href = '${createLink(action: 'berichte', params: ['code': abteilungInstance.code], mapping: 'abteilungShow')}';
		</g:else>
	});
</jq:jquery>
<button id="showAbteilungButton" style="margin-left: 10px;"><g:message code="abteilung.show" /></button>
<hr/>
<div class="body">
%{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
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
	<g:hasErrors bean="${abteilungInstance}">
		<div class="ui-widget">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
					<strong><g:message code="default.error"/>:</strong>
					<br/>
					<g:renderErrors bean="${abteilungInstance}" as="list"/>
			</div>
		</div>
	</g:hasErrors>
	<g:form method="post" name="AbteilungForm">
		<g:hiddenField name="id" value="${abteilungInstance?.id}"/>
		<g:hiddenField name="version" value="${abteilungInstance?.version}"/>
		<div class="dialog">
			<table>
				<tbody>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="name"><g:message code="abteilung.name.label" default="Name"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'name', 'errors')}">
						<g:textField name="name" value="${abteilungInstance?.name}"/>
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="anzeigeName"><g:message code="abteilung.anzeigeName.label" default="Anzeigename"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'anzeigeName', 'errors')}">
						<g:textField name="anzeigeName" value="${abteilungInstance?.anzeigeName}"/>
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="name"><g:message code="abteilung.kuerzel.label" default="Kuerzel"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'kuerzel', 'errors')}">
						<g:textField name="kuerzel" value="${abteilungInstance?.kuerzel}"/>
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="oberAbteilung"><g:message code="abteilung.oberAbteilung.label" default="Oberabteilung"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'oberAbteilung', 'errors')}">
						<g:select name="oberAbteilung.id" from="${de.webmpuls.cms.section.Abteilung.listOrderByName([cache: true])}" optionKey="id" value="${abteilungInstance?.oberAbteilung?.id}" noSelection="['null': '']" />
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
						<label for="anzeigeImMenu"><g:message code="abteilung.anzeigeImMenu.label" default="Anzeige Im Menü"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'anzeigeImMenu', 'errors')}">
						<g:checkBox name="anzeigeImMenu" value="${abteilungInstance?.anzeigeImMenu}"/>
					</td>
				</tr>

				<tr>
					<td valign="top" align="left" class="name">
						<g:message code="abteilung.unterabteilungen.label" default="Unterabteilungen"/>
					</td>
					<td valign="top" align="left">
						%{--<g:select name="personen" from="${abteilungInstance.personen}" multiple="yes" optionKey="id" size="${abteilungInstance.personen.size()}" value="${abteilungInstance?.personen}" disabled="disabled"/>--}%
						<ul>
							<g:each in="${abteilungInstance.unterabteilungen}" var="ua">
								<li>
									<table>
										<tr>
											<td valign="top" align="left" width="300">
												<g:link controller="abteilung" action="edit" id="${ua.id}">${ua?.encodeAsHTML()}</g:link>
											</td>
											<td valign="top" align="left">
												<g:link controller="abteilung" action="removeUnterAbteilung" params="['abteilung.id': ua.id, 'id': abteilungInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="ui-icon ui-icon-circle-minus" title="${ua?.encodeAsHTML()} löschen"></span></g:link>
											</td>
										</tr>
									</table>
								</li>
							</g:each>
						</ul>
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

											<tr>
												<td valign="top" align="left" class="name">
													<g:message code="abteilung.spielplaene.label" default="Spielpläne"/>
												</td>
												<td valign="top" align="left">
													%{--<g:select name="personen" from="${abteilungInstance.personen}" multiple="yes" optionKey="id" size="${abteilungInstance.personen.size()}" value="${abteilungInstance?.personen}" disabled="disabled"/>--}%
													<ul>
														<g:each in="${abteilungInstance.spielplaene.sort{ Spielplan a, Spielplan b -> a.spieldatum <=> b.spieldatum } }" var="sp">
															<li>
																<table>
																	<tr>
																		<td valign="top" align="left" width="300">
																			<g:link controller="spielplan" action="edit" id="${sp.id}">${sp?.encodeAsHTML()}</g:link>
																		</td>
																		<td valign="top" align="left">
																			<g:link controller="abteilung" action="removeSpielplan" params="['spielplan.id': sp.id, 'id': abteilungInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="ui-icon ui-icon-circle-minus" title="${sp?.encodeAsHTML()} löschen"></span></g:link>
																		</td>
																	</tr>
																</table>
															</li>
														</g:each>
													</ul>
												</td>
											</tr>

											<tr>
												<td valign="top" align="left" class="name">
													<g:message code="abteilung.trainingszeiten.label" default="Trainingszeiten"/>
												</td>
												<td valign="top" align="left">
													%{--<g:select name="personen" from="${abteilungInstance.personen}" multiple="yes" optionKey="id" size="${abteilungInstance.personen.size()}" value="${abteilungInstance?.personen}" disabled="disabled"/>--}%
													<ul>
														<g:each in="${abteilungInstance.trainingszeiten}" var="tz">
															<li>
																<table>
																	<tr>
																		<td valign="top" align="left" width="300">
																			<g:link controller="trainingszeit" action="edit" id="${tz.id}">${tz?.encodeAsHTML()}</g:link>
																		</td>
																		<td valign="top" align="left">
																			<g:link controller="trainingszeit" action="removeTrainingszeit" params="['trainingszeit.id': tz.id, 'id': abteilungInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="ui-icon ui-icon-circle-minus" title="${tz?.encodeAsHTML()} löschen"></span></g:link>
																		</td>
																	</tr>
																</table>
															</li>
														</g:each>
													</ul>
												</td>
											</tr>
										</table>
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" colspan="2">
										<br/>
										<a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Personen-Zuordnungen&nbsp;hinzufügen</a>
										<br/>
										<br/>
										<a href="javascript: void(0);" id="sp_dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Spielplan&nbsp;hinzufügen</a>
										<br/>
										<br/>
										<a href="javascript: void(0);" id="tz_dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Trainingszeiten&nbsp;hinzufügen</a>
										<br/>
										<br/>
										<a href="javascript: void(0);" id="ib_dialog_link" class="ui-state-default ui-corner-all">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Sonstiges&nbsp;hinzufügen</a>
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


		<g:render template="/abteilung/personenZuordnungDialog" /> 
		<g:render template="/abteilung/spielplanZuordnungDialog" model="[abteilungInstance: abteilungInstance, spielplanInhalt: spielplanInhalt]" />
		<g:render template="/abteilung/trainingszeitenZuordnungDialog" model="[abteilungInstance: abteilungInstance]" />
		<g:render template="/abteilung/infoBoxZuordnungDialog" model="[abteilungInstance: abteilungInstance, infoBoxInhalt: infoBoxInhalt]" />

    </body>
</html>
