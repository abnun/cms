<%@ page import="de.webmpuls.cms.section.Abteilung; de.webmpuls.cms.start.News; de.webmpuls.cms.people.ShiroRole" %>
<table width="270" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_dblau.jpg')}" class="headline_dunkel">
			<font color="#FFFFFF">Newsticker</font>
			<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
				<span>
					<g:link controller="news" action="list">
						<img src="${resource(dir: '/images/skin', file: 'database_table.png')}" alt="Übersicht News" title="Übersicht News" border="0"/>
					</g:link>
				</span>
			</shiro:hasRole>
		</td>
	</tr>
</table>
<table border="0" cellspacing="0" class="copy">
						<tr valign="middle">
							<td height="10" colspan="3"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="270" height="3"></td>
						</tr>
<g:if test="${newsMap}">
	<g:each status="i" var="newsEntry" in="${newsMap}">
		<tr>
			<%
				Abteilung tmpAbteilung = Abteilung.get(((Map.Entry)newsEntry)?.getKey())
				String abteilungCode = tmpAbteilung?.oberAbteilung == null ? tmpAbteilung.code : tmpAbteilung?.oberAbteilung?.code
				String abteilungName = tmpAbteilung?.oberAbteilung == null ? tmpAbteilung.name : tmpAbteilung?.oberAbteilung?.name
			%>
			<td valign="top"><link:abteilungAktuelles code="${abteilungCode}"><img src="${resource(dir: 'bilder/aktuell', file: 'p_' + abteilungCode + '.jpg')}" width="32" height="32" border="0"></link:abteilungAktuelles></td>
			<td valign="top">&nbsp;</td>
			<td height="25" valign="top">
				<link:abteilungAktuelles code="${abteilungCode}">${abteilungName}</link:abteilungAktuelles>
				<br />
				<g:each status="count" var="news" in="${((Map.Entry)newsEntry)?.getValue()}">
					<p style="margin-top: 0px; margin-bottom: 3px;">
						<a href="${createLink(controller: 'abteilung', action: 'berichte', params: [code: news?.abteilung?.code], mapping: 'abteilungShow',  fragment: 'bericht_' + news?.id)}" style="text-decoration: none;"> > <span class="copy">${news.ueberschrift ? news.ueberschrift : (news.inhalt[0..60] + (news.inhalt.size() > 60 ? '[...]' : ''))}</span></a>
					</p>
				</g:each>
			</td>
		</tr>
		<tr valign="middle">
			<td height="10" colspan="3"><img src="${resource(dir: 'bilder/divers', file: 'linie_grau.png')}" width="270" height="3"></td>
		</tr>
	</g:each>
</g:if>
<g:else>
	<tr>
		<td valign="top">
			Derzeit sind keine News vorhanden.
		</td>
	</tr>
</g:else>