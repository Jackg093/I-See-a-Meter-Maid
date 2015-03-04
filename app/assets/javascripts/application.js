// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// disbale require turbolinks
//= require_tree .


function initialize() {
	console.log('initialize');

	var mapOptions;
	if (!window.mapOptions) {
		console.log('no map options');
		return;
	} else {
		mapOptions = window.mapOptions;
	}

	var goldStar = {
	  path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
	  fillColor: 'red',
	  fillOpacity: 1.2,
	  scale: 0.05,
	  strokeColor: 'black',
	  strokeWeight: 1.25
	};

	var canvas = document.getElementById('map-canvas');
	if (!canvas) { 
	  console.log("no canvas found");
	  return;
	}

	var map = new google.maps.Map(canvas, mapOptions);
	var GeoMarker = new GeolocationMarker(map);
	GeoMarker.setCircleOptions({fillColor: '#808080'});

	// debugging
	window.geomarker = GeoMarker;
	window.map = map;

	$('body').on('click', "#maptrigger", function() {
	  console.log('clicked trigger');

	  console.log('current position');
	  var currentPosition = GeoMarker.getPosition();

	  if (currentPosition) {
	  	// I know my position right now
	  	console.log("I know my position");
		  map.setCenter(currentPosition);
		  var bounds = GeoMarker.getBounds();
		  if (bounds) {
		    map.fitBounds(bounds);
		  } else {
		  	console.log("No bounds");
		  }

		  var marker = new google.maps.Marker({
		    position: map.getCenter(),
		    icon: goldStar,
		    map: map
		  });
		} else {
			// I don't know my position later.
			console.log("I don't know my position");
			console.log(currentPosition);
			google.maps.event.addListenerOnce(GeoMarker, 'position_changed', function() {
				// this is later
				console.log("I should know my position by now");
			    map.setCenter(GeoMarker.getPosition());
			    var bounds = GeoMarker.getBounds();
			    if (bounds) {
			      map.fitBounds(bounds);
			    } else {
			  	  console.log("No bounds");
			    }

			    var marker = new google.maps.Marker({
			      position: map.getCenter(),
			      icon: goldStar,
			      map: map
			    });
			});
		}
	});

	google.maps.event.addListener(GeoMarker, 'geolocation_error', function(e) {
	  alert('There was an error obtaining your position. Message: ' + e.message);
	});

	//GeoMarker.setMap(map);

	// console.log('create marker');
	// console.dir(map);
	// var marker = new google.maps.Marker({
	//   position: map.getCenter(),
	//   icon: goldStar,
	//   map: map
	// });
}
//google.maps.event.addDomListener(window, 'load', initialize);
$(initialize);
$(document).on('page:load', initialize);