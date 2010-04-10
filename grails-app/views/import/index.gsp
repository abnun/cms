<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
	<jq:jquery>
		$("#datepickerFrom").datepicker({
			dateFormat: 'dd.mm.yy'
		});
		$("#datepickerTo").datepicker({
			dateFormat: 'dd.mm.yy' 
		});

		$("#htmlImportSubmit").button();
	</jq:jquery>
</head>
<body>
<h2>Tabelle einlesen</h2>
<g:form action="tableHTMLImport" name="TabelleHTMLImportForm" method="post">
	<table>
		<tbody>
		<tr>
			<td align="right">
				<p class="copy">
					Von
				</p>
			</td>
			<td>
				<input name="datepickerFrom" id="datepickerFrom" type="text">
			</td>
		</tr>
		<tr>
			<td align="right">
				<p class="copy">
					Bis
				</p>
			</td>
			<td>
				<input name="datepickerTo" id="datepickerTo" type="text">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="line-height: 5px;">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input id="htmlImportSubmit" type="submit" value="${message(code: 'default.form.submit')}"/>
			</td>
		</tr>
		</tbody>
	</table>
</g:form>
</body>
</html>