<%@ page import="de.webmpuls.cms.people.Funktion" contentType="text/html;charset=UTF-8" %>

<div id="dialog" style="width: 750px; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_highlight-hard_100_f2f5f7_1x100.png') }') repeat-x scroll 50% top #F2F5F7; border:1px solid #DDDDDD;">
	<g:form controller="abteilung" action="update" method="post" name="PersonenZuordnungForm">
	<table style="width: 750px">
		<tr>
			<td valign="top" align="left">
				<label for="person">Person:</label>
			</td>
			<td valign="top" align="left">
				<g:textField name="person" id="person" style="width: 200px;"/>
			</td>
			%{--<td valign="top" align="left">
				<label for="funktion">Funktion:</label>
			</td>
			<td valign="top" align="left">
				<g:textField name="funktion" id="funktion" style="width: 200px;"/>
			</td>--}%
			<g:hiddenField name="funktion" id="funktion" value="${Funktion.findByCode(Funktion.ABTEILUNGSLEITER)?.name}" />
		</tr>
		<tr>
			<td>
				Bereits beim Tippen macht das System Vorschläge für Personen, die in der Datenbank gespeichert sind. 
			</td>
		</tr>
	</table>
		<g:hiddenField name="personen" value=""/>
		<g:hiddenField name="funktionen" value=""/>
		<g:hiddenField name="action" value="${params.action}"/>
		<g:hiddenField name="id" value="${abteilungInstance?.id}"/>
	</g:form>
	<br/>
	<div id="dialog_error" class="ui-widget" style="display: none;">
		<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
			<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
				<strong>Fehler:</strong> Es muss sowohl eine Person als auch eine Funktion gewählt sein!</p>
		</div>
	</div>
</div>