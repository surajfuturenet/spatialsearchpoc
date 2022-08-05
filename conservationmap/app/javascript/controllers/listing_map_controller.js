import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="listing-map"
export default class extends Controller {
  static targets = ["map","conservations"]
	
	 connect() {
  	if(typeof google != "undefined")
  	{
  		//console.log('re initiate it');
  		this.initializeMap();
  	}
    //console.log('connect listing');
  }

	initializeMap()
	{
		this.setupMap();
		//console.log('init listing');
	}

	setupMap(){
		if (this._addMarkers == undefined)
		{
			const dataelement = document.querySelectorAll('[data-longitude]');

			if(dataelement !== undefined  && dataelement.length > 0)
			{

				const mylatlan = { lat: parseFloat(dataelement[0].dataset.latitude), lng:parseFloat(dataelement[0].dataset.longitude)}
				const map = new google.maps.Map(this.mapTarget,{
				center: mylatlan ,
				zoom:7
				});

				for (var i = 0; i < dataelement.length; i++) {
					
					//console.log(dataelement[i].dataset.latitude);
					//console.log(dataelement[i].dataset.longitude);
					
					let mapLocation = {
        				lat: parseFloat(dataelement[i].dataset.latitude),
        				lng: parseFloat(dataelement[i].dataset.longitude)
      				}
					 new google.maps.Marker({
        			map,
        			anchorPoint: new google.maps.Point(10,0),
        			position :mapLocation,
      				visible : true,
      				title :dataelement[i].dataset.title
      				});
				}

			}
		} 
	}
}
