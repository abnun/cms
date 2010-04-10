<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<title>Login</title>
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
			<td align="right">
				<p class="copy">
					<g:message code="login.username" />
				</p>
			</td>
			<td>
				<p>
					<input type="text" name="username" value="${username}" style="width: 120px;" />
				</p>
			</td>
		</tr>
		<tr>
			<td align="right">
				<p class="copy">

					<g:message code="login.passwort" />
				</p>
			</td>
			<td>
				<p>
					<input type="password" name="password" value="" size="40" style="width: 120px;" />
				</p>
			</td>
		</tr>
		<tr>
			<td align="right">
				<p class="copy">
					<g:message code="login.rememberme" />
				</p>
			</td>
			<td><g:checkBox name="rememberMe" value="${rememberMe}"/></td>
		</tr>
		<tr>
			<td colspan="2" style="line-height: 5px;">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input id="signinSubmit" type="submit" value="${message(code: 'auth.login', default: 'Einloggen')}"/></td>
		</tr>
		</tbody>
	</table>
</g:form>
</body>
</html>
