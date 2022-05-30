//= require jquery
//= require jquery_ujs

$(document).ready(function () {
  $(".button_to").on("ajax:success", function (e) {
    const clicked = $(this).find('.btn');

    // clicked.html(e)
    // clicked.contentWindow.location.reload(true);
     
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
