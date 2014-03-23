
$( document ).ready(function() {
 (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=744937855516502";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
});


// Google map options and styling

function initialize() {

  var mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng($('#latitude').val(), $('#longitude').val()),
    styles: [
  {
    "stylers": [
      { "hue": "#00d4ff" }
    ]
  },{
  }
]

  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
      'callback=initialize';
  document.body.appendChild(script);
}



$(loadScript);   



// //modified javascript 

// $( document ).ready(function() {

//   showSearch = function () { 
//     var $search_box = $('.search');

//     $("#logo").click(function(){
//     $search_box.slideDown();
//     )};

// )};


// $( document ).ready(function() {
//   function test() {
//     alert('is this working?');
//   );

// )};













