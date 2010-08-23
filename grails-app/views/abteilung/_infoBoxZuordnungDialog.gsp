<%@ page contentType="text/html;charset=UTF-8" %>

<div id="ib_dialog" style="width: 750px; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_highlight-hard_100_f2f5f7_1x100.png') }') repeat-x scroll 50% top #F2F5F7; border:1px solid #DDDDDD;">
	<g:form controller="infoBox" action="createInfoBoxFromAbteilung" method="post" name="InfoBoxZuordnungForm">
	<table style="width: 750px">
		<tr>
			<td valign="top" align="left">
				<label for="ueberschrift">Überschrift:</label>
			</td>
			<td valign="top" align="left">
				<g:textField name="ueberschrift" id="infoBox_ueberschrift" style="width: 200px;"/>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left">
				<label for="inhalt">Inhalt:</label>
			</td>
			<td valign="top" align="left">
				<g:textArea name="inhalt" id="infoBox_inhalt" style="width: 400px; height: 200px;" value="${infoBoxInhalt}"/>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left">
				<label for="position">Position:</label>
			</td>
			<td valign="top" align="left">
				<g:textField name="position" id="infoBox_position" style="width: 40px;"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<br />
				Die Position muss eingegeben werden, damit bei mehreren Boxen die Reihenfolge bestimmt werden kann.
				<br />
				<br />
				Bsp.: Trainer/Betreuer
			</td>
		</tr>
	</table>
	<g:hiddenField name="abteilung.id" value="${abteilungInstance.id}"/>
	</g:form>
	<br/>
	<div id="ib_dialog_error" class="ui-widget" style="display: none;">
		<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
			<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
				<strong>Fehler:</strong> Es müssen alle Felder (Überschrfit, Inhalt, Position) eingegeben werden!</p>
		</div>
	</div>
</div>