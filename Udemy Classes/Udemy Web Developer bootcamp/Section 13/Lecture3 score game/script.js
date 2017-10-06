// var p1score = document.
var p1score = 0;
var p2score = 0;
var toScore = 5;

var p1 = document.querySelector("#score1");
var p2 = document.querySelector("#score2");
var winningScore = document.querySelector("#toScore");

var input = document.querySelector("input");

var p1btn = document.querySelectorAll("button")[0];
var p2btn = document.querySelectorAll("button")[1];
var reset = document.querySelectorAll("button")[2];

p1btn.addEventListener("click", function() {
  if (p1score < toScore && p1score < toScore) {
    p1score++;
    p1.textContent = p1score;
    if (p1score == toScore) {
      p1.classList.add("winner");
    }
  }
})

p2btn.addEventListener("click", function() {
  if (p2score < toScore && p1score < toScore) {
    p2score++;
    p2.textContent = p2score;
  }
  if (p2score == toScore) {
    p2.classList.add("winner");
  }
})

reset.addEventListener("click", function() {
  p1score = 0;
  p2score = 0;
  p1.textContent = p1score;
  p1.classList.remove("winner");
  p2.textContent = p2score;
  p2.classList.remove("winner");
})

input.addEventListener("click", function() {
  if (this.value < 1) {
    this.value = 1;
  }
  toScore = this.value;
  winningScore.textContent = toScore;
})
