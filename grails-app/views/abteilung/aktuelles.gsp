<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}"/>
	<g:render template="/global/javascript/accordionJS" model="[accordionID: 'accordion']"/>
	<g:render template="/global/css/accordionCSS"/>
	<wm_photo_album:gallery_resources />
	<style type="text/css">
	.ui-accordion .ui-accordion-header .ui-icon {
		margin-top: -8px;
	}
	</style>
</head>
<body>

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
								<g:link controller="bericht" action="create" params="[abteilungId: abteilungInstance?.id]">
									<img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neuer Bericht" border="0"/>&nbsp;Neuer Bericht
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
			<p>&nbsp;</p>
		<!-- InstanceEndEditable --></td>
	</tr>
</table>

</body>
</html>