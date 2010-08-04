<%@ page contentType="text/html;charset=UTF-8" %>
<div id="tz_dialog" style="width: 750px; background: url('${resource(dir: 'css/jquery/themes/cupertino/images', file: 'ui-bg_highlight-hard_100_f2f5f7_1x100.png') }') repeat-x scroll 50% top #F2F5F7; border:1px solid #DDDDDD;">
	<g:form controller="trainingszeit" action="createTrainingszeitFromAbteilung" method="post" name="TrainingszeitForm">
		<table style="width: 750px">
			<tr>
				<td valign="middle" align="left">
					<label for="bezeichnung">Bezeichnung:</label>
				</td>
				<td valign="middle" align="left">
					<g:textField name="bezeichnung" id="bezeichnung"/>
				</td>
				<td>
					(z.B. Erwachsene)
				</td>
			</tr>
			<tr>
				<td valign="middle" align="left">
					<label for="tag">Tag:</label>
				</td>
				<td colspan="2" valign="middle" align="left">
					<g:select name="tag" from="${de.webmpuls.cms.section.Tag?.values()}"/>
				</td>
			</tr>
			<tr>
				<td align="left">Uhrzeiten</td>
			</tr>
			<tr>
				<td colspan="2">
					<table cellspacing="5" cellpadding="5">
						<tr>
							<td valign="middle" align="left">
								<label for="von">Von:</label>
							</td>
							<td valign="middle" align="left">
								<g:textField name="von" id="von" style="width: 60px;"/>&nbsp;Uhr
							</td>
							<td valign="middle" align="left">
								<label for="bis">Bis:</label>
							</td>
							<td valign="middle" align="left">
								<g:textField name="bis" id="bis" style="width: 60px;"/>&nbsp;Uhr
							</td>
						</tr>
					</table>
				</td>
				<td>
					(z.B. 13.30 bis 15.00)
				</td>
			</tr>
			<tr>
				<td valign="top" align="left">
					<label for="ort">Ort:</label>
				</td>
				<td colspan="2" valign="top" align="left">
					<select name="ort" size="1">
						<option value="">Auswählen</option>
						<option>am Beachfeld</option>
						<option>in der Eichbotthalle</option>
						<option>in der Festhalle</option>
						<option>im Freibad</option>
						<option>im Gymnastikraum</option>
						<option>im Hallenbad</option>
						<option>im Heuchelbergstadion</option>
						<option>im SVL-Sportheim</option>
						<option>im SVS-Sportheim</option>
						<option>am SVS-Sportplatz</option>
						<option>in der Tennisanlage</option>
						<option>am Trim-Dich-Pfad</option>
						<option>an der Reitanlage</option>
					</select>
				</td>
			</tr>
		</table>
		<g:hiddenField name="abteilung.id" value="${abteilungInstance.id}"/>
	</g:form>
	<br/>
	<div id="tz_dialog_error" class="ui-widget" style="display: none;">
		<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all">
			<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
				<strong>Fehler:</strong> Es muss mindestens ein vollständiger Trainingszeiten-Eintrag (Bezeichnung, Tag und Uhrzeiten) eingegeben werden!</p>
		</div>
	</div>
</div>