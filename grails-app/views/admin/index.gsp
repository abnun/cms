<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
</head>
<body>

	<table>
		<tr>
			<th class="headline_dunkel" colspan="2">
				Administration
			</th>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
		<tr>
			<td align="center">
				<img width="75" src="${resource(dir: 'bilder/icons', file: 'home.png')}" title="Startseitenverwaltung" alt="Startseitenverwaltung" border="0"/>
			</td>
			<td class="copy">
				<ul>
					<li>
						<a href="${createLink(controller: 'aktuelles')}">
							Aktuelles
						</a>
					</li>
					<li>
						<a href="${createLink(controller: 'anzeigen')}">
							Anzeigen
						</a>
					</li>
					%{--<li>
						<a href="${createLink(controller: 'news')}">
							News
						</a>
					</li>--}%
					<li>
						<a href="${createLink(controller: 'termin')}">
							Termine
						</a>
					</li>
				</ul>
			</td>
		</tr>
		</shiro:hasRole>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center">
				<a href="${createLink(controller: 'person')}">
					<img width="75" src="${resource(dir: 'bilder/icons', file: 'user-female.png')}" title="Mitgliederverwaltung" alt="Mitgliederverwaltung" border="0"/><img width="75" src="${resource(dir: 'bilder/icons', file: 'user-male.png')}" alt="Mitgliederverwaltung" title="Mitgliederverwaltung" border="0"/>
				</a>
			</td>
			<td class="copy">
				<ul>
					<li>
						<a href="${createLink(controller: 'person')}">
							Mitgliederverwaltung
						</a>
					</li>
					<li>
						<a href="${createLink(controller: 'abteilung')}">
							Abteilungsverwaltung
						</a>
					</li>
					<li>
						<a href="${createLink(controller: 'funktion')}">
							Tätigkeitenverwaltung
						</a>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		%{--<tr>
			<td align="center">
				<a href="${createLink(controller: 'abteilung')}">
					<img width="75" src="${resource(dir: 'bilder/icons', file: 'home.png')}" title="Abteilungsverwaltung" alt="Abteilungsverwaltung" border="0"/>
				</a>
			</td>
			<td class="copy">
				<a href="${createLink(controller: 'abteilung')}">
					Abteilungsverwaltung
				</a>
			</td>
		</tr>--}%
	</table>
</body>
</html>