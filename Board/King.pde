class King extends Piece {
  
  public King() {
    position = new PVector(0, 4);
    validSquares = new ArrayList<PVector>;
    directions = new PVector[]{
      new PVector(0, 1), new PVector(1, 1), new PVector(1, 0), 
      new PVector(1, -1), new PVector(0, -1), new PVector(-1, -1), 
      new PVector(0, -1), new PVector(1, -1)
    }
  }
  
  public boolean isMoveValid(PVector newPos) {
    PVector d = new PVector(0, 0);
    PVector copy = newPos;
    for (PVector dir : directions) {
      if (copy.sub(position).x == dir) {
        d = dir;
        break;
      }
      copy = newPos;
    }
   }
      
  }
    
}
