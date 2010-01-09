<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<title>Login</title>
</head>
<body>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>

<g:message code="login.sign.in" />
<br />
<br />

<g:form action="signIn">
	<input type="hidden" name="targetUri" value="${targetUri}"/>
	<table>
		<tbody>
		<tr>
			<td><g:message code="auth.username" default="Benutzername"/>:</td>
			<td><input type="text" name="username" value="${username}"/></td>
		</tr>
		<tr>
			<td><g:message code="auth.passwort" default="Passwort"/>:</td>
			<td><input type="password" name="password" value=""/></td>
		</tr>
		<tr>
			<td><g:message code="auth.rememberme" default="Eingeloggt bleiben"/>?:</td>
			<td><g:checkBox name="rememberMe" value="${rememberMe}"/></td>
		</tr>
		<tr>
			<td/>
			<td><input type="submit" value="${message(code: 'auth.login', default: 'Einloggen')}"/></td>
		</tr>
		</tbody>
	</table>
</g:form>
</body>
</html>
