class Move {
  PVector start; 
  ArrayList<PVector> end; 
  int points;
  
  Move(){
    start = new PVector(); 
    end = new ArrayList<PVector>(); 
    points = 0; 
  }
  
  Move(Move m) {
    start = m.start; 
    end = m.end; 
    points = m.points; 
  }
}