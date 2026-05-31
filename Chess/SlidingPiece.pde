class SlidingPiece extends Piece {
  
  public SlidingPiece(Board b, PVector pos, int c) {
    super(b, pos, c);
  }
  
  public boolean isMoveValid(PVector newPos) {
    PVector d = new PVector(0, 0);
    PVector copy = newPos.copy();
    PVector disp = null;
    for (PVector dir : directions) {
      if (vectorFunctions.sameDirection(copy.sub(position), dir)) {
        d = dir;
        disp = newPos.copy().sub(position);
        break;
      }
      copy = newPos.copy();
    }
    if (disp == null) {
      return false;
    }
    else {
      PVector pos = position.copy();
      int squareCount = (int) (disp.mag() / d.mag() + 0.1);
      for (int i = 0; i < squareCount - 1; i++) {
        PVector checkSquare = pos.add(d);
        if (board.grid[(int) checkSquare.x][(int) checkSquare.y] != null) {
          return false;
        }
      }
    }  
    if (board.grid[(int) newPos.x][(int) newPos.y] != null) {
      if (board.grid[(int) newPos.x][(int) newPos.y].col == this.col) {
        return false;
      }
    }
    return true;  
  }
  
  public void updateValidSquares() {
    PVector checkPos = position.copy();
    validSquares = new ArrayList<PVector>();
    for (PVector dir : directions) {
      while (true) {
        checkPos.add(dir.copy());
        if (checkPos.x < 0 || checkPos.x > 7 || checkPos.y < 0 || checkPos.y > 7) {
          break;
        }
        if (isMoveValid(checkPos)) {  
          validSquares.add(checkPos.copy());
        }
        else {
          break;
        }
      }
      checkPos = position.copy();
    }
  } 
}
