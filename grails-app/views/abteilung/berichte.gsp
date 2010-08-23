<%@ page import="de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.section.Spielplan" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}"/>
	<g:render template="/global/javascript/accordionJS" model="[accordionID: 'accordion']"/>
	<g:render template="/global/css/accordionCSS"/>
	<wm_photo_album:gallery_resources useCustomGalleryJS="true"/>
	<script type="text/javascript" src="${resource(dir: '/js/highslide', file: 'gallery.js')}"></script>
	<style type="text/css">
	.ui-accordion .ui-accordion-header .ui-icon {
		margin-top: -8px;
	}
	</style>

	<jq:jquery>

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
										var iValue = $("textarea[id='inhalt']").val();

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

										if(tValue != "" && uvValue != "" && ubValue != "")
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
										var iValue = $("textarea[id='infoBox_inhalt']").val();
										var ueValue = $("input[id='infoBox_ueberschrift']").val();
										var pValue = $("input[id='infoBox_position']").val();

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

	<g:render template="/global/javascript/buttonJS" model="[dialogLinkId: 'sp_dialog_link', dialogId: 'sp_dialog']" />

	<g:render template="/global/javascript/buttonJS" model="[dialogLinkId: 'tz_dialog_link', dialogId: 'tz_dialog']" />

	<g:render template="/global/javascript/buttonJS" model="[dialogLinkId: 'ib_dialog_link', dialogId: 'ib_dialog']" />

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'sp_dialog_link']" />

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'tz_dialog_link']" />

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'b_dialog_link']" />

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'ib_dialog_link']" />

	<style type="text/css">
	.ui-autocomplete {
		width: 200px;
	}
	</style>

</head>
<body>

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
				<strong><g:message code="default.error"/>:</strong>&nbsp;${flash.error}
			</p>
		</div>
	</div>
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

<table width="695" border="0" cellpadding="0" cellspacing="0">
	<tr align="left" valign="top">
		<td><!-- InstanceBeginEditable name="Text" -->
			<table width="695" border="0" align="left" cellspacing="10" style="width: 695px;">
				<tr>
					<td valign="top" class="copy">
						<table border="0" align="left" cellspacing="10">
							<tr>
								<td></td>
								<td>
									<span class="headline_dunkel">${abteilungInstance?.anzeigeName ?: abteilungInstance?.name}</span>
									<shiro:hasRole name="${ShiroRole.BENUTZER}">
										<span>
											<g:link controller="abteilung" action="edit" id="${abteilungInstance.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Abteilung ändern" title="Abteilung ändern" border="0"/></g:link>
										</span>
									</shiro:hasRole>
								</td>
								<td><img src="${resource(dir: 'bilder/divers', file: 'trenn.gif')}" width="1" height="26"></td>
								<td class="copy">%{--Landesstaffel 1 Bezirk Nord--}%&nbsp;</td>
							</tr>
						</table>
						<p>&nbsp;</p>
					</td>
					<td align="right" valign="top">
						<table border="0" align="right" cellspacing="3">
							<tr valign="middle">
								<td class="copy">Berichte</td>
								<g:if test="${showPortraits}">
								<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
								<td class="rubrik_grau"><a href="${createLink(controller: 'abteilung', action: 'portraits', params: [code: abteilungInstance?.code], mapping: 'abteilungPortraits')}">Portraits</a></td>
								</g:if>
								<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
								<td class="rubrik_grau"><a href="${createLink(controller: 'abteilung', action: 'spielplan', params: [code: abteilungInstance?.code], mapping: 'abteilungSpielplan')}">Spielplan</a></td>
								<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
								<td><a href="${createLink(controller: 'abteilung', action: 'tabelle', params: [code: abteilungInstance?.code], mapping: 'abteilungTabelle')}" class="rubrik_grau"><img src="${resource(dir: 'bilder/divers', file: 'icon_table.jpg')}" width="26" height="26" border="0" alt="Tabelle" title="Tabelle"></a></td>
								<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
								<td><a href="${createLink(controller: 'abteilung', action: 'team', params: [code: abteilungInstance?.code], mapping: 'abteilungTeam')}" class="rubrik_grau"><img src="${resource(dir: 'bilder/divers', file: 'icon_team.jpg')}" width="27" height="26" border="0" alt="Team" title="Team"></a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr align="left" valign="top">
		<td height="227">
			<table width="695" border="0" align="left" cellspacing="10" style="width: 695px;">
				<tr>
					<td colspan="2" valign="top">
						<br>
						<g:if test="${berichte}">
							<div id="accordion">
								<g:each status="i" var="bericht" in="${berichte}">
									<g:render template="/abteilung/bericht" model="['bericht': bericht, 'i': i, 'abteilung': abteilungInstance]"/>
								</g:each>
							</div>
						</g:if>
						<shiro:hasRole name="${ShiroRole.BENUTZER}">
							<br/>
							<span>
								%{--<g:link controller="bericht" action="create" params="[abteilungId: abteilungInstance?.id]">--}%
								<g:link controller="bericht" action="create" params="[abteilungId: abteilungInstance?.id]" elementId="b_dialog_link" class="ui-state-default ui-corner-all" style="border: 1px solid #AED0EA; color: #2779AA; font-weight: bold; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_glass_80_d7ebf9_1x400.png')}') repeat-x scroll 50% 50% #D7EBF9;">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Bericht hinzufügen
									%{--<img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neuer Bericht" border="0"/>&nbsp;Neuer Bericht--}%
									</g:link>
							</span>
						</shiro:hasRole>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top" class="copy">
						<p class="headline">&nbsp;</p>
						<p class="headline">&nbsp;</p>
						<p class="headline">&nbsp;</p>
						<p>&nbsp;</p>
					</td>
				</tr>
			</table>
			<!-- InstanceEndEditable --></td>
		<td width="130"><!-- InstanceBeginEditable name="info" -->
		%{--<g:include controller="abteilung" action="abteilungsLeiter" id="${abteilungInstance.id}"/>--}%

		<g:include controller="abteilung" action="trainingszeiten" id="${abteilungInstance.id}"/>
		<g:include controller="abteilung" action="infoBox" id="${abteilungInstance.id}"/>
			<p style="clear:both;">&nbsp;</p>

			<shiro:hasRole name="${ShiroRole.BENUTZER}">
			<a href="javascript: void(0);" id="sp_dialog_link" class="ui-state-default ui-corner-all" style="border: 1px solid #AED0EA; color: #2779AA; font-weight:bold; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_glass_80_d7ebf9_1x400.png')}') repeat-x scroll 50% 50% #D7EBF9;">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Spielplan&nbsp;hinzufügen</a>
			<br/>
			<br/>
			<a href="javascript: void(0);" id="tz_dialog_link" class="ui-state-default ui-corner-all" style="border: 1px solid #AED0EA; color: #2779AA; font-weight:bold; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_glass_80_d7ebf9_1x400.png')}') repeat-x scroll 50% 50% #D7EBF9;">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Trainingszeiten&nbsp;hinzufügen</a>

			<br/>
			<br/>
			<a href="javascript: void(0);" id="ib_dialog_link" class="ui-state-default ui-corner-all" style="border: 1px solid #AED0EA; color: #2779AA; font-weight:bold; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_glass_80_d7ebf9_1x400.png')}') repeat-x scroll 50% 50% #D7EBF9;">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Sonstiges&nbsp;hinzufügen</a>

			<g:render template="/abteilung/spielplanZuordnungDialog" model="[abteilungInstance: abteilungInstance, spielplanInhalt: spielplanInhalt]" />
			<g:render template="/abteilung/trainingszeitenZuordnungDialog" model="[abteilungInstance: abteilungInstance]" />
			<g:render template="/abteilung/infoBoxZuordnungDialog" model="[abteilungInstance: abteilungInstance, infoBoxInhalt: infoBoxInhalt]" />
			</shiro:hasRole>
			<!-- InstanceEndEditable --></td>
	</tr>
</table>

</body>
</html>