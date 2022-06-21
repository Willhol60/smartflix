//= require jquery
//= require jquery_ujs

$(document).ready(function () {
  $(".button_to").on("ajax:success", function (e) {
    const clicked = $(this).find('.btn');

    if (clicked.attr("class").includes('btn-outline-warning')) {
      clicked.removeClass('btn-outline-warning').addClass('btn btn-warning');
      clicked.text("Starred");
      clicked.prepend('<i class="bi bi-star"> </i>');
    } else {
      clicked.removeClass('btn-warning').addClass('btn btn-outline-warning');
      clicked.text("Star");
      clicked.prepend('<i class="bi bi-star"> </i>');
    }
  });
});

$(document).ready(function () {
  setTimeout(function() {
    $('.alert').fadeOut("slow", function() {
      $(this).remove();
    })
  }, 3500);
});