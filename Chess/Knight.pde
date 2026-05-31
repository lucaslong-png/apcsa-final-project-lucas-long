class Knight extends Piece {
  
  public Knight(Board b, PVector pos, int c) {
    super(b, pos, c);
    directions = new PVector[]{
      new PVector(2, 1), new PVector(1, 2), new PVector(-1, 2), 
      new PVector(-2, 1), new PVector(-2, -1), new PVector(-1, -2), 
      new PVector(1, -2), new PVector(2, -1)
    };
    if (c == 0) {
      sprite = loadImage("white_knight.png");
    }
    else {
      sprite = loadImage("black_knight.png");
    }    
  }
  
  public boolean isMoveValid(PVector newPos) {
    PVector d = new PVector(0, 0);
    PVector copy = newPos.copy();
    for (PVector dir : directions) {
      if (vectorFunctions.equals(copy.sub(position), dir)) {
        d = dir;
        break;
      }
      copy = newPos.copy();
    }
    if (d.x == 0 && d.y == 0) {
      return false;
    }
    if (board.grid[(int) newPos.x][(int) newPos.y] != null) {      
      if (board.grid[(int) newPos.x][(int) newPos.y].col == this.col) {
        return false;
      }
      else {
        return true;
      }
    }
    else {
      return true;
    }
  }
  
  public void updateValidSquares() {
    PVector checkPos;
    validSquares = new ArrayList<PVector>();
    for (PVector dir : directions) {
      checkPos = position.copy().add(dir.copy());
      if (checkPos.x < 0 || checkPos.x > 7 || checkPos.y < 0 || checkPos.y > 7) {
        continue;
      }
      if (isMoveValid(checkPos)) {
        validSquares.add(checkPos);
      }
    }
  }
        
    
}
