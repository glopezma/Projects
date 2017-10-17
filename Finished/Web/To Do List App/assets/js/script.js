// function startup(){
//   for(var i = 0; i < document.cookie.length; i++){
//     $("ul").append("<li><span><i class=\'fa fa-trash\'></i></span> " + document.cookie[i] + "</li>");
//   }
// }

$("ul").on("click", "li", function() {
  $(this).toggleClass("completed");
});

$("ul").on("click", "span", function(e) {
  e.stopPropagation(); //stops the cross-off from the li listener
  $(this).parent().fadeOut(333, function() {
    $(this).remove();
  });
});

$("input[type='text']").on("keypress", function(e) {
  if (e.which === 13) {
    $("ul").append("<li><span><i class=\'fa fa-trash\'></i></span> " + $(this).val() + "</li>");
    $(this).val("");
  }
});

$(".fa-plus").on("click", function(){
  $("input[type='text']").fadeToggle();
});
