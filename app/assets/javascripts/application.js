// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require underscore
//= require gmaps/google

//= require_tree .


function codeAddress(lat, lng) {
    let map = new google.maps.Map(document.getElementById('map'), {
      center: {
        lat: lat,
        lng: lng
      },
      zoom: 12
    });
    let geocoder = new google.maps.Geocoder()
    let inputAddress = document.getElementById('address').value;

    geocoder.geocode({
      'address': inputAddress
    }, function (results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);

      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });


        // 検索値を隠しデータとしてセット
      let hidden_address = document.getElementById('hidden_address');
      console.log(hidden_address)
        hidden_address.setAttribute("value", inputAddress);
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });

  }