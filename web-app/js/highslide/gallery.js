jQuery.preloadImages = function()
{
  for(var i = 0; i<arguments.length; i++)
  {
    jQuery("<img>").attr("src", arguments[i]);
  }
}

hs.align = 'center';
hs.transitions = ['expand', 'crossfade'];
hs.fadeInOut = true;
hs.dimmingOpacity = 0.8;
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'outer-glow';
hs.showCredits = false;
hs.marginBottom = 100 // make room for the thumbstrip and the controls
// hs.numberPosition = 'caption';
// Add the slideshow providing the controlbar and the thumbstrip
if (hs.addSlideshow) {
	hs.addSlideshow({
	//slideshowGroup: 'group1',
	interval: 4000,
	repeat: false,
	useControls: true,
	fixedControls: 'fit',		
	overlayOptions: {
		position: 'bottom center',
		offsetX: '0',
		offsetY: '-10',
		hideOnMouseOut: true
	}
});
}