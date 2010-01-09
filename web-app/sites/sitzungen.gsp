<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
</head>
<table width="570" border="0" align="left" cellspacing="5">
	<tbody>
	<tr valign="top">
		<td class="copy">
			<p class="headline">
				Sitzungen und andere Termine
				2009
			</p>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				<tr valign="middle">
					<td width="100" height="20" bgcolor="#D2DFFF" class="wichtig">
						<div align="left">
							Datum
						</div>
					</td>
					<td height="20" align="left" bgcolor="#D2DFFF" class="wichtig">
						<div align="center">
							Uhrzeit
						</div>
					</td>
					<td height="20" bgcolor="#D2DFFF" class="wichtig">
						Veranstaltung
					</td>
					<td height="20" bgcolor="#D2DFFF" class="wichtig">
						Ort
					</td>
				</tr>
				<tr valign="middle" class="copy">
					<td height="20">
						 
					</td>
					<td height="20" align="left">
						<div align="center"/>
					</td>
					<td height="20">
						 
					</td>
					<td height="20">
						 
					</td>
				</tr>
				<g:each var="termin" in="${terminList}">

					<tr class="copy">
						<td height="20">
							<g:set var="findetStatt" value="${termin.findetStatt}" />
							<g:if test="${!findetStatt}">
								<s>
							</g:if>

							<g:formatDate date="${termin.datum}" format="MMMMM"/>

							<g:if test="${!findetStatt}">
								</s>
							</g:if>
						</td>
						<td align="left">
							<g:if test="${termin.uhrzeit}">
								<g:if test="${!findetStatt}">
									<s>
								</g:if>

								${termin.uhrzeit}

								<g:if test="${!findetStatt}">
									</s>
								</g:if>
							</g:if>
						</td>
						<td>
							<g:if test="${!findetStatt}">
								<s>
							</g:if>

							${termin.name}

							<g:if test="${!findetStatt}">
								</s>
							</g:if>
						</td>
						<td>
							<g:if test="${!findetStatt}">
								<s>
							</g:if>

							${termin.uhrzeit}

							<g:if test="${!findetStatt}">
								</s>
								${termin.zusatzinfo}
							</g:if>
						</td>
					</tr>

				</g:each>
				</tbody>
			</table>
			<p>
				 
			</p>
			<p>
				<br/>
				<br/>
				<br/>
				<br/>
			</p>
		</td>
	</tr>
	</tbody>
</table>

</html>