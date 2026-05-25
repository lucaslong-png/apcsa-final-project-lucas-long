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
  }
  
  public boolean isMoveValid(PVector newPos) {
    int newx = (int) newPos.x;
    int newy = (int) newPos.y;
    int x = (int) position.x;
    int y = (int) position.y;
    if (newx == x && board[newx][y + dy] == null)  {
      if (newy - dy == y) {
         return true;
      }
      if (newy - 2 * dy == y && board[newx][y + 2 * dy] == null && !hasMoved) {
        return true;
      }
    }
    
    else if (abs(newx - x) == 1 && newy - dy == y) {
      if (board[newx][newy] != null) {
        if (board[newx][newy].col != this.col) {
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

  
  
    
    
    
