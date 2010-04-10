<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript">
	$(function()
	{
		$("#${accordionID}").accordion({
			header: "h3",
			active: false,
			autoHeight: false,
			collapsible: true,
			icons: {
				header: "own-icon-circle-arrow-e",
				headerSelected: "own-icon-circle-arrow-s"
			}

		});
	});
</script>