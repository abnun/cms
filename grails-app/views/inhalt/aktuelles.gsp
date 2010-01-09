<%@ page import="de.webmpuls.cms.section.Abteilung" %>
<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
</head>
<body>
<table width="614" border="0" cellpadding="0" cellspacing="0">
        <tr align="left" valign="top">
          <td height="227"><!-- InstanceBeginEditable name="Text" -->
          <table width="570" border="0" align="left" cellspacing="10">
			<tr>
				<td width="270" valign="top" class="copy">
					<!-- Aktuelles vom Verein -->
					<g:render template="/inhalt/start/aktuelles" />

					<!-- Anzeigenmarkt -->
					<g:render template="/inhalt/start/anzeigen" />
				</td>
				<td width="270" valign="top" class="headline_dunkel">

					<!-- Newsticker -->
					<g:render template="/inhalt/start/news" />
					</table>

			  		<!-- Terminvorschau -->
			  		<g:render template="/inhalt/start/termine" model="[]" />
				</td>
			</tr>
			<tr>
				<td valign="top" class="copy"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="270" height="10"></td>
				<td valign="top"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="270" height="10"></td>
			</tr>
		</table>
            <!-- InstanceEndEditable --></td>
          <td width="130">
			  <!-- Sidebar -->
			  <g:render template="/inhalt/start/sidebar"/>
		  </td>
        </tr>
      </table>

 </body>
</html>