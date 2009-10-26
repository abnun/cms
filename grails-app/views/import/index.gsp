<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
</head>
<body>
<br />
<g:link action="uploadExcel" class="excel_link">Excel-File einlesen</g:link>
<br />
<br />
<h2>Tabelle einlesen</h2>
<g:form action="tableHTMLImport" name="TabelleHTMLImportForm" method="post">
Von: <gui:datePicker id='vonDate' formatString="dd.MM.yyyy" />
<br/>
Bis: <gui:datePicker id='bisDate' formatString="dd.MM.yyyy" />
<br/>
<a href="javascript: void(0);" onclick="document.forms.TabelleHTMLImportForm.submit();">Ergebnis-Tabelle einlesen</a>
</g:form>
</body>
</html>