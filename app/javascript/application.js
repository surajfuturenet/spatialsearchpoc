// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"

window.dispatchMapsEvent  = function(...args){

	const event = new Event("Events");
	event.initEvent("google-maps-callback",true,true);
	event.args = args;
 	window.dispatchEvent(event);
}
