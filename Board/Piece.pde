abstract class Piece {
  Board board;
  boolean alive;
  PVector position;
  ArrayList<PVector> validSquares;
  int col;
  PVector[] directions;
  boolean hasMoved;
  
  public Piece(Board b, PVector position, int c) {
    board = b;
    alive = true;
    hasMoved = false;
    this.position = position
    col = c;
    validSquares = new ArrayList<PVector>();
  }
    
  abstract boolean isMoveValid(PVector newPos);
  
  public void move(PVector newPos) {
    Piece p;
    x = (int) position.x;
    y = (int) position.y
    if (grid[x][y] != null) {
      p = grid[x][y];
      p.alive = false;
    }
    position.set(newPos);
    grid[x][y] = this;
  }
  
  
  
  public static boolean equals(PVector v1, PVector v2) {
    return (abs(v1.x - v2.x) < 0.001 && abs(v1.y - v2.y) < 0.001);
  }
  
  public static boolean sameDirection(PVector v1, PVector v2) {
    return equals(v1.copy().normalize(), v2.copy().normalize());
  }
  
  
  public void update() {
    move()
    updateValidSquares();
  }
}
