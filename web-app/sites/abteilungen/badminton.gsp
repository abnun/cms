<html>
<head>
<meta name="layout" content="sv_leingarten"/>
</head>
<table width="614" border="0" cellpadding="0" cellspacing="0">
  <tbody>
    <tr align="left" valign="top">
      <td width="520" height="227">
        <table width="570" border="0" align="left" cellspacing="5">
          <tbody>
            <tr valign="top">
              <td width="134" class="copy">
                <p class="headline">
                  <img src="${resource(dir: 'bilder/abteilungen/badminton', file: 'badminton_logo.gif')}" width="134" height="128"/>
                </p>
              </td>
              <td>
                <p class="headline">
                  Hallo Sportsfreunde!
                </p>
                <p class="copy">
                  Die Badmintonabteilung des SV Leingarten wurde 
                    1977 gegründet.
                  <br/>
                  Aktuell haben wir 64 Mitglieder, davon sind es derzeit 16 
                    Jugendliche.
                  <br/>
                  <br/>
                  <br/>
                </p>
                <p class="copy">
                  <a href="http://www.svl-badminton.de" target="_blank">
                    www.svl-badminton.de
                  </a>
                </p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
      <td width="120">
		  <g:if test="${params.id && ((String)params.id).endsWith('.gsp')}">

			  <g:include controller="abteilung" action="abteilungsLeiter" params="[code: ((String)params.id).substring(0, ((String)params.id).lastIndexOf('.gsp'))]"/>

			  <g:include controller="abteilung" action="trainingszeiten" params="[code: ((String)params.id).substring(0, ((String)params.id).lastIndexOf('.gsp'))]"/>

		  </g:if>
        <p>
           
        </p>
      </td>
    </tr>
  </tbody>
</table>

</html>