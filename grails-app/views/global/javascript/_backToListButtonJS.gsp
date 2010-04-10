<jq:jquery>
	$("#backToListButton").button({
		icons: {
			primary: 'ui-icon-bookmark'
		}
	}).click(function() {
		window.location.href = '${createLink(action: 'list')}';
	});
</jq:jquery>