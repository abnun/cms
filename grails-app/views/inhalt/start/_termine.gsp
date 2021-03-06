<%@ page import="de.webmpuls.cms.start.Termin; de.webmpuls.cms.people.ShiroRole" %>
<table width="270" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="25" colspan="3" valign="top"><p>&nbsp;</p>
			<table width="270" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_hblau.jpg')}" class="headline_dunkel">
						SVL Terminvorschau
						<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
						<span>
							<g:link controller="termin" action="list">
								<img src="${resource(dir: '/images/skin', file: 'database_table.png')}" alt="Übersicht Termine" title="Übersicht Termine" border="0"/>
							</g:link>
						</span>
						</shiro:hasRole>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="270" border="0" cellspacing="0" cellpadding="0">
	<g:if test="${terminList}">
		<tr>
			<td width="90" class="headline_dunkel">&nbsp;</td>
			<td class="headline_dunkel"><span class="wichtig"></span></td>
		</tr>
		<g:each status="i" var="termin" in="${terminList}">
			<g:set var="terminMonth" value="${((Date)termin.startDatum).getMonth()}" />
			%{--<%
			    boolean sameMonth = true
				for(Termin tmpTermin in terminList)
				{
					if(((Date)tmpTermin.startDatum).getMonth() != terminMonth)
					{
						sameMonth = false
					}
				}
			%>--}%
			<g:if test="${terminMonth != ((Date)terminList[i - 1].startDatum).getMonth()}">
				<tr valign="top" class="copy">
					<td colspan="2" bgcolor="d2dfff" class="wichtig"><g:formatDate date="${termin.startDatum}" format="MMMMM"/></td>
				</tr>
			</g:if>
			%{--<g:elseif test="${sameMonth}">
				<tr valign="top" class="copy">
					<td colspan="2" bgcolor="d2dfff" class="wichtig"><g:formatDate date="${termin.startDatum}" format="MMMMM"/></td>
				</tr>
			</g:elseif>--}%
			<g:else>
				%{--<tr>
					<td width="90" class="headline_dunkel">&nbsp;</td>
				</tr>--}%
			</g:else>
			<tr valign="top" class="copy">
				<g:if test="${termin.startDatum == termin.endDatum}">
					<td class="copy"><g:formatDate date="${termin.startDatum}" format="dd. MMMMM"/></td>
				</g:if>
				<g:elseif test="${termin.endDatum == termin.startDatum.next()}">
					<td class="copy"><g:formatDate date="${termin.startDatum}" format="dd."/>/<g:formatDate date="${termin.endDatum}" format="dd."/><br /><g:formatDate date="${termin.endDatum}" format="MMMMM"/></td>
				</g:elseif>
				<g:else>
					<td class="copy"><g:formatDate date="${termin.startDatum}" format="dd."/> - <g:formatDate date="${termin.endDatum}" format="dd."/><br /><g:formatDate date="${termin.endDatum}" format="MMMMM"/></td>
				</g:else>
				<td><span class="wichtig"><g:if test="${!termin.findetStatt}"><s></g:if>${termin.inhalt}<g:if test="${!termin.findetStatt}"></s></g:if><br/></span><span class="copy">
				<g:if test="${termin.abteilung}">(${termin.abteilung})<br/></g:if></span><g:if test="${!termin.findetStatt}"><span class="copy">${termin.zusatzinfo ?: message(code: 'termin.canceled.text')}</span></g:if></td>
				<shiro:hasRole name="${ShiroRole.BENUTZER}">
					<td>
						<g:link controller="termin" action="edit" id="${termin.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Termin ändern" title="Termin ändern" border="0"/></g:link>
						<jq:jquery>
								$("#termin_del_${termin.id}").click(function () {
									if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
									{
										document.forms.TerminDeleteForm_${termin.id}.submit();
									}
								});
						</jq:jquery>
						<a href="javascript: void(0);" id="termin_del_${termin.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Termin löschen" title="Termin löschen" border="0"/></a>
						<g:form action="delete" controller="termin" id="${termin.id}" name="TerminDeleteForm_${termin.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
					</td>
				</shiro:hasRole>
			</tr>
		</g:each>
	</g:if>
	<g:else>
		<tr>
			<td height="30" class="copy" colspan="2">
				Derzeit sind keine Termine vorhanden.
			</td>
		</tr>
	</g:else>
	<tr>
		<td height="30" class="copy" colspan="2">
			<shiro:hasRole name="${ShiroRole.BENUTZER}">
			<span>
				<g:link controller="termin" action="create">
					<img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neuer Termin" border="0"/>&nbsp;Neuer Termin
				</g:link>
			</span>
			</shiro:hasRole>
		</td>
	</tr>
	<tr valign="top" class="copy">
		<td width="90" height="20">&nbsp;</td>
		<td height="20">&nbsp;</td>
	</tr>
</table>