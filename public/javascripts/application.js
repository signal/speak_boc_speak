$(document).ready(function() {
  $("#say_form").bind("ajax:complete", function() {
    $('#message').val('');
  });

  var jug = new Juggernaut;
  jug.subscribe("speak_boc_speak", function(data) {
    process(data);
  });
});

function playAudio(url) {
  $("#audio_element").html("<embed src='" + url + "' hidden='true' autostart='true' loop='false' />");
}

function displayCaption(phrase) {
  $("#phrase_text").text(phrase);
  $("#phrase").css({opacity: 0.0, visibility: "visible"}).animate({opacity: 1.0}).
    delay(10000).
    css({opacity: 1.0}).animate({opacity: 0.0});
}

function process(data) {
  var dataObject = eval('(' + data + ')');
  displayCaption(dataObject.phrase);
  playAudio(dataObject.url);
}
