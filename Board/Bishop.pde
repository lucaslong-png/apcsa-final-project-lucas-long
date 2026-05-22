class Bishop extends SlidingPiece {
  
  public Bishop(Board b, PVector pos, int c) {
    super(b, pos, c);
    directions = new PVector[]{
      new PVector(1, 1), new PVector(1, -1), new PVector(-1, -1), new PVector(-1, 1)
    };
  }
