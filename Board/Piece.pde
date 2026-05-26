abstract class Piece {
  Board board;
  boolean alive;
  PVector position;
  ArrayList<PVector> validSquares;
  int col;
  PVector[] directions;
  boolean hasMoved;
  PImage sprite;
  final int squareSize = 100;
  
  public Piece(Board b, PVector position, int c) {
    board = b;
    board.grid[(int) position.x][(int) position.y] = this;
    alive = true;
    hasMoved = false;
    this.position = position;
    col = c;
    validSquares = new ArrayList<PVector>();
  }
  
  abstract boolean isMoveValid(PVector newPos);
  
  public void move(PVector newPos) {
    Piece p;
    int x = (int) position.x;
    int y = (int) position.y
    int newx = (int) newPos.x;
    int newy = (int) newPos.y;
    if (grid[newx][newy] != null) {
      p = grid[newx][newy];
      p.alive = false;
    }
    position.set(newPos);
    grid[newx][newy] = this;
    grid[x][y] = null;
    hasMoved = true;
  }

  abstract void updateValidSquares();
  
  public void display() {
    image(sprite, squareSize * (int) position.x, squareSize * (int) (7 - position.y), squareSize, squareSize);
  }
}
