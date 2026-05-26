class Rook extends SlidingPiece {
  
  public Rook(Board b, PVector pos, int c) {
    super(b, pos, c);
    directions = new PVector[]{
      new PVector(0, 1), new PVector(1, 0), new PVector(0, -1), new PVector(-1, 0)
    };
    if (c == 0) {
      sprite = loadImage("white_rook.png");
    }
    else {
      sprite = loadImage("black_rook.png");
    }    
  }
