//= require jquery
//= require jquery_ujs

$(document).ajaxSuccess( function (e) {
  const clicked = $(e.currentTarget.activeElement);

  if (clicked.attr("class").includes('btn-outline-warning')) {
    clicked.removeClass('btn-outline-warning').addClass('btn-warning');
    clicked.text("Starred");
    clicked.prepend('<i class="bi bi-star"> </i>');
  } else {
    clicked.removeClass('btn-warning').addClass('btn-outline-warning');
    clicked.text("Star");
    clicked.prepend('<i class="bi bi-star"> </i>');
  }
});
