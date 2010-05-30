
<%@ page import="de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.people.Person; de.webmpuls.cms.people.Funktion; de.webmpuls.cms.section.Abteilung" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
		<g:render template="/global/javascript/accordionJS" model="[accordionID: 'accordion']" />
		<g:render template="/global/css/accordionCSS" />
    </head>
    <body>
	<table width="614" border="0" cellpadding="0" cellspacing="0">
		<tr align="left" valign="top">
			<td height="227"><!-- InstanceBeginEditable name="Text" -->
				<table border="0" align="left" cellspacing="10">
					<tr>
						<td valign="top" class="copy">
							<table border="0" cellpadding="0" cellspacing="3">
								<tr>
									<td></td>
									<td><span class="headline_dunkel">${abteilungInstance?.anzeigeName ?: abteilungInstance?.name}</span></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn.gif')}" width="1" height="26"></td>
									<td class="copy">Landesstaffel 1 Bezirk Nord</td>
								</tr>
							</table>
							<p>&nbsp;</p></td>
						<td align="right" valign="top">
							<table border="0" cellpadding="0" cellspacing="3">
								<tr valign="middle">
									<td class="copy">Berichte</td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td><a href="#" class="rubrik_grau">Portraits</a></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td class="rubrik_grau"><a href="#">Spielplan</a></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td><a href="#" class="rubrik_grau"><img src="${resource(dir: 'bilder/divers', file: 'icon_table.jpg')}" width="26" height="26" border="0"></a></td>
									<td><img src="${resource(dir: 'bilder/divers', file: 'trenn_grau.png')}" width="3" height="20"></td>
									<td><a href="#" class="rubrik_grau"><img src="${resource(dir: 'bilder/divers', file: 'icon_team.jpg')}" width="27" height="26" border="0"></a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2" valign="top" class="copy">
							<br>
							<g:if test="${abteilungInstance?.berichte}">
								<div id="accordion">
									<g:each status="i" var="bericht" in="${abteilungInstance?.berichte/*.sort{a, b -> a.ueberschrift <=> b.ueberschrift}*/}">
										<g:render template="/abteilung/bericht" model="['bericht': bericht, 'i': i, 'abteilung': abteilungInstance]"/>
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
				<g:each var="abteilungsLeiter" in="${abteilungsLeiterCollection}">
					<p>
						<g:render template="/global/section/head" model="[head: abteilungsLeiter, section: abteilungInstance]"/>
					</p>
				</g:each>
				<p>&nbsp;</p>
				<!-- InstanceEndEditable --></td>
		</tr>
	</table>
    </body>
</html>