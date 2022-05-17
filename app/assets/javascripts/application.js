//= require jquery
//= require jquery_ujs

$(".button_to").on("ajax:beforeSend", function () {
  console.log("before sned");
}).on("ajax:success", function (e, data, status, xhr) {
  console.log("completed");
  $('.btn-outline-warning').removeClass('btn-outline-warning').addClass('btn-warning');
  $('.btn-warning').removeClass('btn-warning').addClass('btn-outline-warning');
  $(".bi-star").remove()
  if ($(".btn").text() === "Star") {
    $(".btn").text("Unstar");
  } else {
    $(".btn").text("Star");
  }
  $(".btn-warning").prepend('<i class="bi bi-star"> </i>');
  $(".btn-outline-warning").prepend('<i class="bi bi-star"> </i>');
});