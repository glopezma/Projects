var movies;

function preload(){
  var url = 'https://www.rottentomatoes.com/browse/in-theaters/';
  httpGet(url, "text", false, function(response){
    movies = response;
  });
}

function setup(){
    createCanvas(450, 450);
}

function draw(){
  if(!movies){
    return; 
  }
  background(200);

}
