class Pawn extends Piece {
  int dy;
  
  public Pawn(Board b, PVector pos, int c) {
    super(b, pos, c);
    if (c == 0) {
      dy = 1;
    }
    else {
      dy = -1;
    }
    //directions not necessary for pawn
    if (c == 0) {
      sprite = loadImage("white_pawn.png");
    }
    else {
      sprite = loadImage("black_pawn.png");
    }    
  }
  
  public boolean isMoveValid(PVector newPos) {
    int newx = (int) newPos.x;
    int newy = (int) newPos.y;
    if (newx < 0 || newx > 7 || newy < 0 || newy > 7) {
      return false;
    }
    int x = (int) position.x;
    int y = (int) position.y;
    if (!(y + dy < 0 || y + dy > 7)) {     
      if (newx == x && board.grid[newx][y + dy] == null)  {
        if (newy - dy == y) {
           return true;
        }
        if (!hasMoved) {
          if (newy - 2 * dy == y && board.grid[newx][y + 2 * dy] == null) {
            return true;
          }
        }
      }
    }
    if (abs(newx - x) == 1 && newy - dy == y) {
      if (board.grid[newx][newy] != null) {
        if (board.grid[newx][newy].col != this.col) {
          return true;
        }
      }
    }
    return false;
  }
  
  public void updateValidSquares() {
    PVector[] possibleDirections = {
      new PVector(0, dy), new PVector(0, 2 * dy), new PVector(1, dy), new PVector(-1, dy)
    };
    validSquares = new ArrayList<PVector>();
    for (PVector p : possibleDirections) {
      if (isMoveValid(position.copy().add(p))) {
        validSquares.add(position.copy().add(p));  
      }
    }
  }
}

  
  
    
    
    
