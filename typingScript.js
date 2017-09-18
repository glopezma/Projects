win the typing game
function myFunction(){
  var input = document.getElementById("inputfield");
  input.innerHTML = "";
  input.value = "";
  var myElement = document.getElementsByClassName("highlight")[0].innerHTML;
  input.value = myElement;
}
