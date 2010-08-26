<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>${abteilungInstance.oberAbteilung ? abteilungInstance.oberAbteilung + ' | ' : ''}${abteilungInstance?.anzeigeName ?: abteilungInstance?.name} | Aktuelles</title>
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
					title: 'Abteilungsleiter zuordnen',
					bgiframe: true,
					autoOpen: false,
					closeOnEscape: true,
					modal: true,
					resizable: false,
					hide: 'explode',
					width: 760,
					buttons: {
						"speichern": function() {
							var pValue = $("input[name='person']").val();
							var fValue = $("input[name='funktion']").val();

							if(pValue != "" && fValue != "")
							{
								$("input[name='personen']").val(pValue);
								$("input[name='funktionen']").val(fValue);
								$("#PersonenZuordnungForm").submit();
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

	<g:render template="/global/css/buttonCSS" model="[dialogLinkId: 'b_dialog_link']" />

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
		<td height="227"><!-- InstanceBeginEditable name="Text" -->
			<table border="0" align="left" cellspacing="10">
				<tr>
					<td valign="top" class="copy">
						<abteilungns:aktuelleErgebnisse ergebnisse="${ergebnisse}" />
						<p>&nbsp;</p>
					<td valign="top" class="copy">
						<abteilungns:vorschau vorschau="${vorschau}" />
						<p>&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top" class="copy">
						<br>
						<g:if test="${berichte}">
							<div id="accordion">
								<g:each status="i" var="bericht" in="${berichte}">
									<g:render template="/abteilung/bericht" model="['bericht': bericht, 'i': i, 'abteilung': bericht.abteilung]"/>
								</g:each>
							</div>
						</g:if>
						<shiro:hasRole name="${ShiroRole.BENUTZER}">
							<br/>
							<span>
								%{--<g:link controller="bericht" action="create" params="[abteilungId: abteilungInstance?.id]">--}%
								<g:link controller="bericht" action="create" params="[abteilungId: abteilungInstance?.id]" elementId="b_dialog_link" class="ui-state-default ui-corner-all" style="border: 1px solid #AED0EA; color: #2779AA; font-weight: bold; font-size: 100%; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_glass_80_d7ebf9_1x400.png')}') repeat-x scroll 50% 50% #D7EBF9;">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Bericht hinzufügen
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
						<p>&nbsp;</p></td>
				</tr>
			</table>
			<!-- InstanceEndEditable --></td>
		<td width="130"><!-- InstanceBeginEditable name="info" -->
		<g:include controller="abteilung" action="abteilungsLeiter" id="${abteilungInstance.id}"/>

		%{--<g:include controller="abteilung" action="trainingszeiten" id="${abteilungInstance.id}"/>--}%
			<p style="clear:both;">&nbsp;</p>

			<shiro:hasRole name="${ShiroRole.BENUTZER}">

			<g:if test="${abteilungInstance.personen.isEmpty()}">
			<a href="javascript: void(0);" id="dialog_link" class="ui-state-default ui-corner-all" style="border: 1px solid #AED0EA; color: #2779AA; font-weight:bold; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_glass_80_d7ebf9_1x400.png')}') repeat-x scroll 50% 50% #D7EBF9;">%{--<span class="ui-icon ui-icon-newwin"></span>--}%Abteilungsleiter&nbsp;hinzufügen</a>
			</g:if>

			<g:render template="/abteilung/personenZuordnungDialog" model="[abteilungInstance: abteilungInstance]" />
			</shiro:hasRole>
		<!-- InstanceEndEditable --></td>
	</tr>
</table>

</body>
</html>