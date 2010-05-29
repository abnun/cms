<g:if test="${Boolean.valueOf(isAbteilung)}">
	<span class="headline_dunkel">F1:</span>
	<span class="headline">${accordionTabUeberschrift1}</span>

</g:if>
<g:else>
	<span class="copy">${accordionTabUeberschrift1}</span>

	<span class="wichtig"><br></span>
	<span class="subline">
		${accordionTabUeberschrift2}
	</span>
</g:else>
