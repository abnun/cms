<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
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
<g:if test="${newsList}">
	<g:each status="i" var="news" in="${newsList}">
		<tr>
			<td valign="top"><link:abteilungShow code="${news.abteilung?.code}"><img src="${resource(dir: 'bilder/aktuell', file: 'p_' + news.abteilung.code + '.jpg')}" width="32" height="32" border="0"></link:abteilungShow></td>
			<td valign="top">&nbsp;</td>
			<td height="25" valign="top"><link:abteilungShow code="${news.abteilung?.code}">${news.ueberschrift ?: news.abteilung?.name}</link:abteilungShow><br><span class="copy">${news.inhalt[0..60]}${news.inhalt.size() > 60 ? '[...]' : ''}</span></td>
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