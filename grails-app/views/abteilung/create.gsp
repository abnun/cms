<%@ page import="de.webmpuls.cms.section.Abteilung" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}"/>
	%{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
</head>
<body>
<div class="body">
%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
	<g:if test="${flash.message}">
		<div class="ui-widget">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
					${flash.message}
			</div>
		</div>
	</g:if>
	<g:if test="${flash.error}">
		<div class="ui-widget">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
					<strong><g:message code="default.error"/>:</strong>&nbsp;${flash.error}
			</div>
		</div>
	</g:if>
	<g:hasErrors bean="${abteilungInstance}">
					<div class="ui-widget">
						<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
							<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
								<strong><g:message code="default.error"/>:</strong>
								<br/>
								<g:renderErrors bean="${abteilungInstance}" as="list"/>
						</div>
					</div>
            	</g:hasErrors>
	<g:form action="save" method="post">
		<div class="dialog">
			<table>
				<tbody>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="name"><g:message code="abteilung.name.label" default="Name"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'name', 'errors')}">
						<g:textField name="name" value="${abteilungInstance?.name}"/>
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="anzeigeName"><g:message code="abteilung.anzeigeName.label" default="Anzeigename"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'anzeigeName', 'errors')}">
						<g:textField name="anzeigeName" value="${abteilungInstance?.anzeigeName}"/>
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">
						<label for="oberAbteilung"><g:message code="abteilung.oberAbteilung.label" default="Oberabteilung"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'oberAbteilung', 'errors')}">
						<g:select name="oberAbteilung.id" from="${de.webmpuls.cms.section.Abteilung.hauptAbteilungen().listOrderByName([cache: true])}" optionKey="id" value="${abteilungInstance?.oberAbteilung?.id}" noSelection="['null': '']" />
					</td>
				</tr>

				%{--<tr class="prop">
												<td valign="top" class="name">
													<label for="code"><g:message code="abteilung.code.label" default="Code" /></label>
												</td>
												<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'code', 'errors')}">
													<g:textField name="code" value="${abteilungInstance?.code}" />
												</td>
											</tr>--}%

				<tr class="prop">
					<td valign="top" class="name">
						<label for="anzeigeImMenu"><g:message code="abteilung.anzeigeImMenu.label" default="Anzeige Im Menu"/></label>
					</td>
					<td valign="top" class="value ${hasErrors(bean: abteilungInstance, field: 'anzeigeImMenu', 'errors')}">
						<g:checkBox name="anzeigeImMenu" value="${abteilungInstance?.anzeigeImMenu}"/>
					</td>
				</tr>

				</tbody>
			</table>
		</div>
		<div class="buttons">
			<span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
		</div>
	</g:form>
</div>
</body>
</html>
