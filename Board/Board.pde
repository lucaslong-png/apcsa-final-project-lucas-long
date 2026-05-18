class Board {
  Piece[][] grid;
  Piece selectedPiece;
  boolean gameover;
  
  public Board() {
    board = new Piece[8][8];
    gameover = false;
}
