// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var highlightRow = function(i) {
  var characters = $(".character");
  var current = characters.get(i);

  characters.css({'background-color' : 'white'});
  $(current).css({'background-color' : 'red'});
}

var fixHelper = function(e, ui) {
    ui.children().each(function() {
        $(this).width($(this).width());
    });
    return ui;
};

var attrs_from_action = function(action) {
  var parts = action.split('/')

  return {
    campaign_id : parts[2]
  , encounter_id : parts[4]
  };
}


$(function() {
  $(".characters_list tbody tr").draggable({helper : 'clone'});
  $(".characters_list tbody").disableSelection();
});
