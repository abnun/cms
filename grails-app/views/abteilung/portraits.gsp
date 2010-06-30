<%@ page import="de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.section.Spielplan" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
	<g:render template="/global/javascript/accordionJS" model="[accordionID: 'accordion']" />
	<g:render template="/global/css/accordionCSS" />
</head>
<body>
<table width="614" border="0" cellpadding="0" cellspacing="0" style="width: 614px;">
		<tr align="left" valign="top">
			<td height="227"><!-- InstanceBeginEditable name="Text" -->
				<table width="614" border="0" align="left" cellspacing="10" style="width: 614px;">
					<tr>
						<td valign="top" class="copy">
							<table border="0" cellpadding="0" cellspacing="3">
								<tr>
									<td></td>
									<td><span class="headline_dunkel">${abteilungInstance?.anzeigeName ?: abteilungInstance?.name}</span></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn.gif')}" width="1" height="26"></td>
									<td class="copy">%{--Landesstaffel 1 Bezirk Nord--}%</td>
								</tr>
							</table>
							<p>&nbsp;</p></td>
						<td align="right" valign="top">
							<table border="0" cellpadding="0" cellspacing="3">
								<tr valign="middle">
									<td class="rubrik_grau"><a href="${createLink(controller: 'abteilung', action: 'show', params: [code: abteilungInstance?.code], mapping: 'abteilungShow')}">Berichte</a></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td class="copy">Portraits</td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td class="rubrik_grau"><a href="${createLink(controller: 'abteilung', action: 'spielplan', id: abteilungInstance?.id)}">Spielplan</a></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td><a href="#" class="rubrik_grau"><img src="${resource(dir: 'bilder/divers', file: 'icon_table.jpg')}" width="26" height="26" border="0"></a></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td><a href="#" class="rubrik_grau"><img src="${resource(dir: 'bilder/divers', file: 'icon_team.jpg')}" width="27" height="26" border="0"></a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br />
				<g:render template="/global/section/portraits/${abteilungInstance.code}_portraits" /> 
				<!-- InstanceEndEditable --></td>
			<td width="130"><!-- InstanceBeginEditable name="info" -->
			<g:include controller="abteilung" action="abteilungsLeiter" id="${abteilungInstance.id}" />
			<p>&nbsp;</p>
			<!-- InstanceEndEditable --></td>
		</tr>
	</table>
</body>
</html>