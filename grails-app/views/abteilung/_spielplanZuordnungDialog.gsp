<%@ page contentType="text/html;charset=UTF-8" %>
<div id="sp_dialog" style="width: 750px; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_highlight-hard_100_f2f5f7_1x100.png') }') repeat-x scroll 50% top #F2F5F7; border:1px solid #DDDDDD;">
	<g:form controller="spielplan" action="createSpielplanFromAbteilung" method="post" name="SpielplanForm">
		<table style="width: 750px">
			<tr>
				<td valign="top" align="left">
					<label for="inhalt">Spielplan:</label>
				</td>
				<td valign="top" align="left">
					<g:textArea name="inhalt" id="inhalt" style="width: 400px; height: 200px;" value="${spielplanInhalt}"/>
				</td>
			</tr>
		</table>
		<br/>
		<p>
			Bsp.: <b>${abteilungInstance.kuerzel} 10.09.2010 TGV Dürrenzimmern - SV Leingarten 19.30</b>
			<br/>
			<br/>
			Mehrere Spielpl&auml;ne mit Enter/Return am Ende eingeben. Auf unn&ouml;tige Leerzeichen am Ende der Zeile achten!
		</p>
		<g:hiddenField name="abteilung.id" value="${abteilungInstance.id}"/>
	</g:form>
	<br/>
	<div id="sp_dialog_error" class="ui-widget" style="display: none;">
		<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
			<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
				<strong>Fehler:</strong> Es muss mindestens ein vollständiger Spielplan-Eintrag eingegeben werden!</p>
		</div>
	</div>
	<div id="sp_dialog_error2" class="ui-widget" style="display: none;">
		<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
			<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
				<strong>Fehler:</strong> Ungültige Eingabe, bitte Eingabe auf überflüssige Leerzeichen überprüfen!</p>
		</div>
	</div>
</div>