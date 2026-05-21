class Pawn extends Piece {
  
  public Pawn(Board b, PVector pos, color c) {
    super(b, pos, c);
    //directions not necessary for pawn
  }
  
  public boolean isMoveValid(PVector newPos) {
    if ((int) newPos.x == (int) position.x)  {
      if ((int) newPos.y - 1 = (int) position.y) {
         return true;

    }
    

  }
  
  public void updateValidSquares() {
    validSquares = new ArrayList<PVector>();
    validSquares.add(position.copy().add(new PVector(0, 1)));
    if (!hasMoved) {
      validSquares.add(position.copy().add(new PVector(0, 2)));
    }
  }
}

  
  
    
    
    
