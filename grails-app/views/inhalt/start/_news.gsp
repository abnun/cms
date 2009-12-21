<table width="270" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_dblau.jpg')}" class="headline_dunkel">
			<font color="#FFFFFF">Newsticker</font>
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
			<td valign="top"><link:abteilungShow code="${news.abteilung?.code}"><img src="${resource(dir: 'bilder/aktuell', file: 'p_' + news.abteilung.code + '.gif')}" width="32" height="32" border="0"></link:abteilungShow></td>
			<td valign="top">&nbsp;</td>
			<td height="25" valign="top"><link:abteilungShow code="${news.abteilung?.code}">${news.ueberschrift ?: news.abteilung?.name}</link:abteilungShow><br><span class="copy">${news.inhalt}</span></td>
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