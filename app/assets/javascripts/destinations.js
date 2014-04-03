
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

function setupVoteClickHandlers() {
  $('.vote_activity').on( 'click', function(ev) {
    ev.preventDefault();
    $.ajax({
      url: $(ev.currentTarget).attr('href'),
      dataType: 'json',
      type: "POST",
      success: function(data) {
        $.get('/destinations/' + $('body').data('id') + '/redraw_eat_container');
      },
      error: function(data) {
        console.log('voted up broke');
      }
    }); 

    return false;

  });
}

function setupDrinkVoteClickHandlers() {
  $('.drink_vote_activity').on( 'click', function(ev) {
    ev.preventDefault();

    $.ajax({
      url: $(ev.currentTarget).attr('href'),
      dataType: 'json',
      type: "POST",
      success: function(data) {
        console.log('voting worked');
        $.get('/destinations/' + $('body').data('id') + '/redraw_drink_container');
      },
      error: function(data) {
        console.log('voted up broke');
      }
    }); 

    return false;

  });

}

function setupSleepVoteClickHandlers() {
  $('.sleep_vote_activity').on( 'click', function(ev) {
    ev.preventDefault();

    $.ajax({
      url: $(ev.currentTarget).attr('href'),
      dataType: 'json',
      type: "POST",
      success: function(data) {
        console.log('voting worked');
        $.get('/destinations/' + $('body').data('id') + '/redraw_sleep_container');
      },
      error: function(data) {
        console.log('voted up broke');
      }
    }); 

    return false;

  });

}

function setupExploreVoteClickHandlers() {
  $('.explore_vote_activity').on( 'click', function(ev) {
    ev.preventDefault();

    $.ajax({
      url: $(ev.currentTarget).attr('href'),
      dataType: 'json',
      type: "POST",
      success: function(data) {
        console.log('voting worked');
        $.get('/destinations/' + $('body').data('id') + '/redraw_explore_container');
      },
      error: function(data) {
        console.log('voted up broke');
      }
    }); 

    return false;

  });

}


$(loadScript);   

$(document).ready(function(){
  $new_activity = $('#add_activity')
  $('.search').hide();

  $new_activity.on( "click", function(){
    $('#activities_form').show();
  });

  $('#all_eat').on("click", function(){
    $('#complete_eat').show();
  });

  //Used to hide the activity form on click away
  $(document).mouseup(function (e){
    var container = $("#complete_eat");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
  });

  //For displaying the search button
  $('.search_button').on('click', function() {
    console.log('show search')
    $('.search').slideDown(800);
  });

  setupVoteClickHandlers();
  setupDrinkVoteClickHandlers();
  setupSleepVoteClickHandlers();
  setupExploreVoteClickHandlers();

  $('#close_button').on('click', function(ev) {
    ev.preventDefault();
    $('#activities_form').hide();
  });


});

















