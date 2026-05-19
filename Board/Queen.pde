class Queen extends Piece {
  
  public Queen(Board b, PVector pos, int col) {
    super(b, pos);
    color = col;
    validSquares = new ArrayList<PVector>();
    directions = new PVector[]{
      new PVector(0, 1), new PVector(1, 1), new PVector(1, 0), 
      new PVector(1, -1), new PVector(0, -1), new PVector(-1, -1), 
      new PVector(-1, 0), new PVector(-1, 1)
    }
  }
  
  public boolean isMoveValid(PVector newPos) {
    PVector d = new PVector(0, 0);
    PVector copy = newPos.copy();
    for (PVector dir : directions) {
      if (Piece.sameDirection(copy.sub(position), dir)) {
        d = dir;
        break;
      }
      copy = newPos.copy();
    }
    if (d.x == 0 && d.y == 0) {
      return false;
    }
    else {
      PVector pos = position.copy();
      int squareCount = (int) (copy.mag()/d.mag());
      for (int i = 0; i < squareCount - 1; i++) {
        PVector checkSquare = pos.add(d);
        if (board[(int) checkSquare.x][(int) checkSquare.y] != null) {
          return false;
        }
      }
    }
    return true;  
  }
  
  public updateValidSquares() {
    PVector checkPos = position.copy();
    validSquares = new ArrayList<PVector>;
    for (PVector dir : directions) {
      while (true) {
        checkPos.add(dir.copy());
        if (checkPos.x < 0 || checkPos.x > 7 || checkPos.y < 0 || checkPos.y > 7) {
          break;
        }
        if (isMoveValid(checkPos)) {
          validSquares.add(checkPos);
        }
      }
      checkPos = position.copy();
    }
  }
  
  
  
  
