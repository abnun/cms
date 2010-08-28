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
				<g:formatDate date="${new Date()}" format="yyyy" />
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

							<g:if test="${termin.startDatum == termin.endDatum}">
								<g:formatDate date="${termin.startDatum}" format="dd. MMMMM"/>
							</g:if>
							<g:elseif test="${termin.endDatum == termin.startDatum.next()}">
								<g:formatDate date="${termin.startDatum}" format="dd."/>/<g:formatDate date="${termin.endDatum}" format="dd."/><br/><g:formatDate date="${termin.endDatum}" format="MMMMM"/>
							</g:elseif>
							<g:else>
								<g:formatDate date="${termin.startDatum}" format="dd."/> - <g:formatDate date="${termin.endDatum}" format="dd."/><br/><g:formatDate date="${termin.endDatum}" format="MMMMM"/>
							</g:else>

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

							${termin.inhalt}<g:if test="${termin.abteilung}">&nbsp;(${termin.abteilung})</g:if> 

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
							<td>
								<g:link controller="termin" action="edit" id="${termin.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Termin ändern" title="Termin ändern" border="0"/></g:link>
								<jq:jquery>
										$("#termin_del_${termin.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												$.post("${createLink(controller: 'termin', action: 'delete', id: termin.id)}");
												location.reload();
											}
										});
								</jq:jquery>
								<a href="javascript: void(0);" id="termin_del_${termin.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Termin löschen" title="Termin löschen" border="0"/></a>
							</td>
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