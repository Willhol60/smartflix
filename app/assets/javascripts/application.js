//= require jquery
//= require jquery_ujs

console.log("before javascript");

// $(".button_to").closest('form').on("ajax:success", function () {
//   console.log("completed");
//   $('.btn-outline-warning').removeClass('btn-outline-warning').addClass('btn-warning');
//   $('.btn-warning').removeClass('btn-warning').addClass('btn-outline-warning');
//   $(".bi-star").remove()
//   if ($(".btn").text() === "Star") {
//     $(".btn").text("Unstar");
//   } else {
//     $(".btn").text("Star");
//   }
//   $(".btn-warning").prepend('<i class="bi bi-star"> </i>');
//   $(".btn-outline-warning").prepend('<i class="bi bi-star"> </i>');
// });

// add ID to each show object via shows_helper.rb and then fetch that html object via that ID
$(document).ajaxSuccess(function () {
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