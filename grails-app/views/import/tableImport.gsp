<html>
<head>
	<meta name="layout" content="main"/>
</head>
<body>
<g:each var="eintrag" in="${tabellenEintraege}">
	${eintrag.heimmannschaft} - ${eintrag.gastmannschaft}<br/>
</g:each>
</body>
</html>