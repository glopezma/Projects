var page;
var movies;
var percents;
var myP = [];
var myMovies = [];
var patts = [
  /<h3 class="movieTitle">[\w*?\d*?\s*?\W*?]*?h3>/g,
  />[\w*\s*\W*]*</g,
  /<span class="tMeterScore">[\w*?\d*?\s*?\W*?]*?span>/g,
  /->[\d]+<!/g
];

function preload() {
  page = loadStrings("Top Movies - Top Box Office _ Rotten Tomatoes.html");
}

function setup() {
  noCanvas();
  noLoop();

  page = join(page, "\n");
  movies = page.match(patts[0]);
  percents = page.match(patts[2]);
  percents = join(percents, "\n");
  percents = percents.match(patts[3]);
  for (var i = 0; i < percents.length; i++) {
    percents[i] = percents[i].slice(2, percents[i].length - 2);
  }
  for (var i = 0; i < movies.length; i++) {
    movies[i] = movies[i].match(patts[1])[0];
    movies[i] = movies[i].slice(1, movies[i].length - 1);
    myMovies.push(new Movie(movies[i], percents[i * 2], percents[i * 2 + 1]));
  }
    order();
}

function Movie(title, critic, user) {
  this.title = title;
  this.critic = critic;
  this.user = user;
}

function order(){
  myMovies = myMovies.sort(function(a, b){return b.critic-a.critic});
  for(var i = 0; i < myMovies.length; i++){
    myP.push(createP(myMovies[i].title));
    myP[i*2].style('font-weight: bold;');
    myP.push(createP("Critics: "+ myMovies[i].critic + " Users: " + myMovies[i].user+"<br><br>"));
    myP[i*2+1].style('font-weight: normal;');
  }
}
