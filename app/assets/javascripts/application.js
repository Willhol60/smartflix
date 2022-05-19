//= require jquery
//= require jquery_ujs

$(".button_to").on("click", function (e) {
  const clicked = $(this.children[1]);

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
