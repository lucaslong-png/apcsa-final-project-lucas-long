abstract class Piece {
  Board board;
  boolean alive;
  PVector position;
  ArrayList<PVector> validSquares;
  int color;
  PVector[] directions;
  
  public Piece(Board b) {
    board = b;
    alive = true;
  }
  
  abstract void select();
  
  abstract boolean isMoveValid(PVector newPos);
  
  abstract void move(PVector newPos);

  abstract void updatePosition();
  
  abstract void updateValidSquares();
  
  
  
  public void update() {
    move()
    updatePosition();
    updateValidSquares();
  }
}
