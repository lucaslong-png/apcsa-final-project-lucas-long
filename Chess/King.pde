class King extends Piece {
  
  public King(Board b, PVector pos, int c) {
    super(b, pos, c);
    gameOver = 0;
    directions = new PVector[]{
      new PVector(0, 1), new PVector(1, 1), new PVector(1, 0), 
      new PVector(1, -1), new PVector(0, -1), new PVector(-1, -1), 
      new PVector(-1, 0), new PVector(-1, 1)
    };
    if (c == 0) {
      sprite = loadImage("white_king.png");
    }
    else {
      sprite = loadImage("black_king.png");
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
  
  public int gameOver() {
    if (alive) {
      return 0;
    }
    else {
      return 1;
    }
  }
    
}
