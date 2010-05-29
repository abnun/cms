<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<g:render template="/global/javascript/accordionJS" model="[accordionID: 'accordion']" />
<g:render template="/global/css/accordionCSS" />

<table width="270" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_hblau.jpg')}" class="headline_dunkel">SVL
		Anzeigenmarkt
			<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
			<span>
				<g:link controller="anzeigen" action="list">
					<img src="${resource(dir: '/images/skin', file: 'database_table.png')}" alt="Übersicht Anzeigen" title="Übersicht Anzeigen" border="0"/>
				</g:link>
			</span>
			</shiro:hasRole>
		</td>
	</tr>
</table>
<g:if test="${anzeigenList}">
	<table width="27" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFCC">
		<tr>
			<td class="copy">
				<div id="accordion" style="width: 270px;">
					<g:each status="i" var="anzeige" in="${anzeigenList}">
						<g:if test="${anzeige?.takeEndDate}">
							<g:if test="${anzeige?.endDatum && ((Date)anzeige?.endDatum)?.after(new Date() - 1)}">
								<g:render template="/inhalt/start/anzeige" model="['anzeige': anzeige, 'i': i]" />
							</g:if>
						</g:if>
						<g:else>
							<g:render template="/inhalt/start/anzeige" model="['anzeige': anzeige, 'i': i]" />
						</g:else>
					</g:each>
				</div>
			</td>
		</tr>
	</table>
</g:if>
<g:else>
	<p class="copy">
		Derzeit sind keine Anzeigen vorhanden.
	</p>
</g:else>
<shiro:hasRole name="${ShiroRole.BENUTZER}">
<br />
<br/>
<span>
	<g:link controller="anzeigen" action="create">
		<img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neue Anzeige" border="0"/>&nbsp;Neue Anzeige
	</g:link>
</span>
</shiro:hasRole>
<p>&nbsp;</p>