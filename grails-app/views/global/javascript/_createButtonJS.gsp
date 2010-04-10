<jq:jquery>
	$("#createButton").button({
		icons: {
			primary: 'ui-icon-plusthick'
		}
	}).click(function() {
		window.location.href = '${createLink(action: 'create')}';
	});
</jq:jquery>