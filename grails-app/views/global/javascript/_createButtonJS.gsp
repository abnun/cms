<jq:jquery>
	$("#createButton").button({
		icons: {
			primary: 'ui-icon-plus'
		}
	}).click(function() {
		window.location.href = '${createLink(action: 'create')}';
	});
</jq:jquery>