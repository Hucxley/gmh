var highlightRow = function(i) {
  var characters = $(".character");
  var current = characters.get(i);

  characters.css({'background-color' : 'white'});
  $(current).css({'background-color' : 'red'});
}
  var position = 0;

$(function() {

  $("#initialization").droppable({ accept : 'tr',    
    drop: function(event, ui) {
      var attrs = attrs_from_action($(this).parent("form").attr("action"))
      var character_id = $(ui.draggable).attr('id');

      $.ajax({
        type : 'POST',
        url : '/campaigns/' + attrs['campaign_id'] + '/encounters/' + attrs['encounter_id'],
        data : { encounter : {character_ids : [character_id]}, _method : "put" },
        dataType : 'json',
        success : function() { window.location.reload() }
      });
    }
  });


  $("#previous").click(function() {
    if (position > 0) {
      position -= 1;
    } else {
      var attrs = attrs_from_action($("form.characters_list").attr("action"))
      
      $.ajax({
        type : "POST",
        url : '/campaigns/' + attrs['campaign_id'] + '/encounters/' + attrs['encounter_id'] + '/decrement_round',
        data : { },
        dataType : 'json',
        success : function() { window.location.reload() }
      });
    }

    highlightRow(position);
  });

  $("#next").click(function() {
    if (position < $(".character").length - 1) {
      position += 1;
    } else {
      var attrs = attrs_from_action($("form.characters_list").attr("action"))
      
      $.ajax({
        type : "POST",
        url : '/campaigns/' + attrs['campaign_id'] + '/encounters/' + attrs['encounter_id'] + '/increment_round',
        data : { },
        dataType : 'json',
        success : function() { window.location.reload() }
      });
    }

    highlightRow(position);
  });

  highlightRow(position);
});
