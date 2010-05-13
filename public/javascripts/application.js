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


$(function() {
  var position = 0;

  $("#characters tbody").sortable({axis : 'y', containment : 'parent', cursor : 'pointer', helper : fixHelper});
  $("#characters tbody").disableSelection();

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
