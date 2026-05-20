class Pawn extends Piece {
  
  public Pawn(Board b, PVector pos, color c) {
    super(b, pos, c);
    //directions not necessary for pawn
  }
  
  public boolean isMoveValid(PVector newPos) {
    if (newpos.x != position.x) {
      return false;
    }
    else if (newPos.y >= position.y + 3 || newPos.y <= position.y) {
      return false;
    }
    else if (newPos.y == position.y + 2 && hasMoved) {
      return false;
    }
    else {
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

  
  
    
    
    
