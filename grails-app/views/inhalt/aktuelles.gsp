<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
</head>
<body>
  <g:if test="${anzeigenList}">
	  <span class="headline"><br>
		  <font color="#ffffff">SVL Anzeigenmarkt</font></span>
	  <g:each var="anzeige" in="${anzeigenList}">
		  <table height="40" cellspacing="0" cellpadding="0" border="0" width="275">
			  <tbody><tr bgcolor="#d2dfff">
				  <td width="40"><div align="center"><a href="sites/abteilungen/fussball2_bericht.htm"><img height="32" border="0" width="32" src="bilder/aktuell/p_fussball.gif"/></a></div></td>
				  <td>
					  <span class="copy">${anzeige.ueberschrift1 ?: anzeige.abteilung?.name}</span>
					  <span class="wichtig">
						  <br/>
						  ${anzeige.ueberschrift2}
					  </span>
				  </td>
			  </tr>
			  </tbody>
		  </table>
		  ${anzeige.inhalt}
	  </g:each>
  </g:if>
 </body>
</html>