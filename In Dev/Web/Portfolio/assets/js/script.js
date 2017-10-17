$(".circles").height($(".circles").width());
$("#aboutMe").height($("#description").height());

$(window).resize(function(){
  $(".circles").height($(".circles").width());
});

$(window).resize(function(){
  $("#aboutMe").height($("#description").height()); 
});
