<%@ page contentType="text/html;charset=UTF-8" %>
<style type="text/css">
	.ui-widget {
		font-family: sans-serif;
		font-size: 100%;;
	}

	.ui-widget-content {
		background: none;
		border: none;
	}

	.ui-accordion .ui-accordion-header .ui-icon {
		left: 0.1em;
	}
	.ui-accordion .ui-accordion-content {
		padding: inherit;
		padding-left: 0px;
		padding-right: 0px;
	}
	.ui-state-default .ui-icon,
	.ui-state-hover .ui-icon {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_right.jpg')}');
	}
	.ui-state-active .ui-icon {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_down.jpg')}');
	}
	.ui-state-default, .ui-state-active, .ui-state-hover, .ui-state-focus {
		background: none;
		border: none;
		font-weight: normal;
		color: inherit;
	}
	.own-icon-circle-arrow-e {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_right.jpg')}');
	}
	.own-icon-circle-arrow-s {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_down.jpg')}');
	}
</style>