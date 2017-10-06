var colors = generateColors(6);
var pickedColor = pickColor();
var colorDisplay = document.getElementById("colorDisplay");
var messageDisplay = document.querySelector("#message");
var squares = document.querySelectorAll(".square");
var h1 = document.querySelector("h1");
var resetButton = document.querySelector("#reset");
var modeButtons = document.querySelectorAll(".mode");
var numSquares = 6;

colorDisplay.textContent = pickedColor;
setup();

resetButton.addEventListener("click", function() {
  resetButton.textContent = "New Colors";
  colors = generateColors(numSquares);
  pickedColor = pickColor();
  colorDisplay.textContent = pickedColor;
  setColors();
  h1.style.backgroundColor = "steelblue";
  messageDisplay.textContent = "";
});

for (var i = 0; i < modeButtons.length; i++) {
  modeButtons[i].addEventListener("click", function() {
    modeButtons[0].classList.remove("selected");
    modeButtons[1].classList.remove("selected");
    this.classList.add("selected");
    numSquares = (this.textContent === "Easy") ? 3 : 6;
    reset();
  });
}

function reset() {
  colors = generateColors(numSquares);
  pickedColor = pickColor();
  colorDisplay.textContent = pickedColor;
  setColors();
  resetButton.textContent = "New Colors";
  messageDisplay.textContent = "";
  h1.style.background = "steelblue";

  for (var i = 0; i < squares.length; i++) {
    if (colors[i]) {
      squares[i].style.backgroundColor = colors[i];
      squares[i].classList.remove("hide");
    } else {
      squares[i].classList.add("hide");
    }
  }
}

function setColors() {
  for (var i = 0; i < squares.length; i++) {
    squares[i].style.backgroundColor = colors[i];
  }
}

function setup() {
  for (var i = 0; i < squares.length; i++) {
    //add intial color to squares
    squares[i].style.backgroundColor = colors[i];

    //add click listeners to squares
    squares[i].addEventListener("click", function() {
      var clickedColor = this.style.backgroundColor;

      if (clickedColor === pickedColor) {
        messageDisplay.textContent = "Correct!";
        resetButton.textContent = "Play Again?"
        changeColors(clickedColor);
        h1.style.backgroundColor = clickedColor;
      } else {
        this.style.backgroundColor = "#232323";
        messageDisplay.textContent = "Try Again";
      }
    });
  }
}

function generateColors(num) {
  var arr = [];

  for (var i = 0; i < num; i++) {
    let r = Math.floor(Math.random() * 256);
    let g = Math.floor(Math.random() * 256);
    let b = Math.floor(Math.random() * 256);

    arr.push("rgb(" + r + ", " + g + ", " + b + ")");
  }

  return arr;
}

//loop through all squares
// change each color to match given color;
function changeColors(color) {
  for (var i = 0; i < squares.length; i++) {
    squares[i].style.background = color;
  }
}

function pickColor() {
  return (colors[Math.floor(Math.random() * colors.length)]);
}

// easyBtn.addEventListener("click", function() {
//   numSquares = 3;
//   easyBtn.classList.add("selected");
//   hardBtn.classList.remove("selected");
//   colors = generateColors(numSquares);
//   pickedColor = pickColor();
//   colorDisplay.textContent = pickedColor;
//   setColors();
//   h1.style.backgroundColor = "steelblue";
//   resetButton.textContent = "New Colors";
//   for (var i = 0; i < squares.length; i++) {
//     if (colors[i]) {
//       squares[i].style.backgroundColor = colors[i];
//     } else {
//       squares[i].classList.add("hide");
//     }
//   }
//   messageDisplay.textContent = "";
// });
//
// hardBtn.addEventListener("click", function() {
//   numSquares = 6;
//   hardBtn.classList.add("selected");
//   easyBtn.classList.remove("selected");
//   colors = generateColors(numSquares);
//   pickedColor = pickColor();
//   colorDisplay.textContent = pickedColor;
//   setColors();
//   h1.style.backgroundColor = "steelblue";
//   resetButton.textContent = "New Colors";
//   for (var i = 0; i < squares.length; i++) {
//     squares[i].style.backgroundColor = colors[i];
//     squares[i].classList.remove("hide");
//   }
//   messageDisplay.textContent = "";
// });
