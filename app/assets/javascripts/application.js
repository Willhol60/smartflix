//= require jquery
//= require jquery_ujs

$(".button_to").on("ajax:success", function (e) {
  const clicked = $(this.children[1]);

  if (clicked.attr("class").includes('btn-outline-warning')) {
    console.log('star clicked');
    clicked.removeClass('btn-outline-warning').addClass('btn-warning');
    clicked.text("Starred");
    clicked.prepend('<i class="bi bi-star"> </i>');
  } else {
    console.log('unstar clicked');
    clicked.removeClass('btn-warning').addClass('btn-outline-warning');
    clicked.text("Star");
    clicked.prepend('<i class="bi bi-star"> </i>');
  }
});
