<g:if test="${abteilungInstanceList}">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<g:each status="i" var="abteilung" in="${abteilungInstanceList}">
			<tr>
				<g:if test="${i == 0}">
					<td width="4" bgcolor="#1760A8" class="marker"></td>
				</g:if>
				<g:elseif test="${i == 1}">
					<td width="4" rowspan="18">&nbsp;</td>
				</g:elseif>
		  		<td height="20" bgcolor="#D2DFFF" class="unavi">
					<link:abteilungAktuelles code="${abteilung?.code}">
						${abteilung?.name}
					</link:abteilungAktuelles>
		  		</td>
			</tr>
		</g:each>
  	</table>
</g:if>