<%@ page import="de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.section.Sponsor" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}"/>
	%{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
	<style type="text/css">
		#sponsor p {
			margin: 0;
		}
	</style>
</head>
<body>
<table width="570" cellspacing="5" border="0" align="left">
	<tbody>
	<tr valign="top">
		<td height="90" align="center" class="headline" colspan="2">
			<table width="100%" cellspacing="0" border="0">
				<g:if test="${sponsorInstanceList}">
					<g:each status="i" var="sponsor" in="${sponsorInstanceList}">
						<g:if test="${i == 0}">
							<tr>
						</g:if>
						<g:if test="${i > 1 && i % 3 == 0}">
							</tr>
							<tr>
						</g:if>
						<td valign="top">
							<g:render template="show" model="['sponsor': sponsor]"/>
						</td>
						</g:each>
				</g:if>
				<tr>
					<td class="copy">
						<shiro:hasRole name="${ShiroRole.BENUTZER}">
							<span class="copy">
								<g:link controller="sponsor" action="create"><img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neuen Sponsor anlegen" title="Neuen Sponsor anlegen" border="0"/>&nbsp;Neuer Sponsor</g:link>
							</span>
						</shiro:hasRole>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td height="90" align="center" class="copy"> </td>
		<td height="90" align="center"> </td>
	</tr>
	</tbody>
</table>
</body>
</html>