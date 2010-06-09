// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//bullet preload
  	

function mouseoverHeader(imageId, isOver) {
	if (isOver) {
		document.getElementById(imageId).src = imgOn.src;
	} else {
		document.getElementById(imageId).src =	imgOff.src;
	}
}

var quoteNum = 1;

function runtest() {
	
	Effect.Fade('quote' + quoteNum);	
	if ($('quote' + (quoteNum + 1)) == undefined) {		
		this.quoteNum = 0;
	}
	
	Effect.Appear('quote' + (++quoteNum));
	start();
}

function start() {
	setTimeout('runtest()', 10000);
}