class Queen extends SlidingPiece {
  
  public Queen(Board b, PVector pos, int c) {
    super(b, pos, c);
    directions = new PVector[]{
      new PVector(0, 1), new PVector(1, 1), new PVector(1, 0), 
      new PVector(1, -1), new PVector(0, -1), new PVector(-1, -1), 
      new PVector(-1, 0), new PVector(-1, 1)
    };
    if (c == 0) {
      sprite = loadImage("white_queen.png");
    }
    else {
      sprite = loadImage("black_queen.png");
    }

  }
  
