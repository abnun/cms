<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
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
						<div align="left">
							Uhrzeit
						</div>
					</td>
					<td height="20" bgcolor="#D2DFFF" class="wichtig">
						<div align="left">
							Veranstaltung
						</div>
					</td>
					<td height="20" bgcolor="#D2DFFF" class="wichtig">
						<div align="left">
							Ort
						</div>
					</td>
					<shiro:hasRole name="${ShiroRole.BENUTZER}">
						<td height="20" bgcolor="#D2DFFF" class="wichtig">
							&nbsp;
						</td>
					</shiro:hasRole>
				</tr>
				<tr valign="middle" class="copy">
					<td height="20">
						 
					</td>
					<td height="20" align="left">
						
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

							<g:formatDate date="${termin.datum}" format="dd. MMMMM"/>

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

							${termin.inhalt}

							<g:if test="${!findetStatt}">
								</s>
							</g:if>
						</td>
						<td>
							<g:if test="${!findetStatt}">
								<s>
							</g:if>

							${termin.ort}

							<g:if test="${!findetStatt}">
								</s>
								${termin.zusatzinfo}
							</g:if>
						</td>
						<shiro:hasRole name="${ShiroRole.BENUTZER}">
							<td><g:link controller="termin" action="edit" id="${termin.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Termin ändern" title="Termin ändern" border="0"/></g:link></td>
						</shiro:hasRole>
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