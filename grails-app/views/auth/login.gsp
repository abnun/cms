<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<title>Login</title>
	<g:render template="/global/javascript/jQueryUIJS" />
	<jq:jquery>
		$("#signinSubmit").button();		
	</jq:jquery>
</head>
<body>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>

<p class="copy">
	<g:message code="login.sign.in"/>
</p>
<br />

<g:form action="signIn" name="SignInForm">
	<input type="hidden" name="targetUri" value="${targetUri}"/>
	<table>
		<tbody>
		<tr>
			<td>
				<p class="copy">
					<g:message code="auth.username" default="Benutzername"/>:
				</p>
			</td>
			<td>
				<p>
					<input type="text" name="username" value="${username}"/>
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p class="copy">

					<g:message code="auth.passwort" default="Passwort"/>:
				</p>
			</td>
			<td>
				<p>
					<input type="password" name="password" value=""/>
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p class="copy">
					<g:message code="auth.rememberme" default="Eingeloggt bleiben"/>?:
				</p>
			</td>
			<td><g:checkBox name="rememberMe" value="${rememberMe}"/></td>
		</tr>
		<tr>
			<td/>
			<td><input id="signinSubmit" type="submit" value="${message(code: 'auth.login', default: 'Einloggen')}"/></td>
		</tr>
		</tbody>
	</table>
</g:form>
</body>
</html>
