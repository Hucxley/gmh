// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function highlightRow(i) {
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

function attrs_from_action(action) {
  var parts = action.split('/')
  alert(parts)

  return {
    campaign_id : parts[2]
  , encounter_id : parts[4]
  };
}


$(function() {
  var position = 0;

  $(".characters_list tbody tr").draggable({helper : 'clone'});
  $("#initialization").droppable({ accept : 'tr',    
    drop: function(event, ui) {
      var attrs = attrs_from_action($(this).parent("form").attr("action"))
      var character_id = $(ui.draggable).attr('id');
      $.ajax({
        type : 'POST',
        url : '/campaigns/' + attrs['campaign_id'] + '/encounters/' + attrs['encounter_id'],
        data : { encounter : {character_ids : [character_id]}, _method : "put" }
      });
    }
  });

  $(".characters_list tbody").disableSelection();

  $("#previous").click(function() {
    if (position > 0) {
      position -= 1;
    }

    highlightRow(position);
  });

  $("#next").click(function() {
    if (position < $(".character").length - 1) {
      position += 1;
    }

    highlightRow(position);
  });

  highlightRow(position);
});
