class Board {
  Piece[][] grid;
  ArrayList<Piece> Pieces;
  Piece selectedPiece;
  boolean gameover;
  int turnTracker;
  PImage sprite;
  boolean check;
  final int WHITE = 0;
  final int BLACK = 1;
  
  public Board() {   
    sprite = loadImage("chessboard.png");
    display();
    initializeBoard();
  }
    
  public void initializeBoard() {
    grid = new Piece[8][8];
    //rook
    grid[0][0] = new Rook(this, new PVector(0, 0), WHITE);
    grid[7][0] = new Rook(this, new PVector(7, 0), WHITE);
    grid[0][7] = new Rook(this, new PVector(0, 7), BLACK);
    grid[7][7] = new Rook(this, new PVector(7, 7), BLACK);
    
    //knight
    grid[1][0] = new Knight(this, new PVector(1, 0), WHITE);
    grid[6][0] = new Knight(this, new PVector(6, 0), WHITE);
    grid[1][7] = new Knight(this, new PVector(1, 7), BLACK);
    grid[6][7] = new Knight(this, new PVector(6, 7), BLACK);
    
    //bishop
    grid[2][0] = new Bishop(this, new PVector(2, 0), WHITE);
    grid[5][0] = new Bishop(this, new PVector(5, 0), WHITE);
    grid[2][7] = new Bishop(this, new PVector(2, 7), WHITE);
    grid[5][7] = new Bishop(this, new PVector(5, 7), WHITE);
    
    //queen
    grid[3][0] = new Queen(this, new PVector(3, 0), WHITE);
    grid[3][7] = new Queen(this, new PVector(3, 7), BLACK); 
    
    //king
    grid[4][0] = new King(this, new PVector(4, 0), WHITE);
    grid[4][7] = new King(this, new PVector(4, 7), BLACK);
    
    //pawn
    for (int i = 0; i < 7; i++) {
      grid[i][1] = new Pawn(this, new PVector(i, 1), WHITE);
      grid[i][6] = new Pawn(this, new PVector(i, 6), BLACK);
    }  
  }
  
  public void setup() {
    size(800, 800);
    gameover = false;
    Pieces = new ArrayList<Pieces>;
    turnTracker = 0;
  }
  
  public void display() {
    image(sprite, 0, 0, 800, 800);
    for (Piece p : grid) {
      if (p != null) {
        p.display();
      }
    }
    if (selectedPiece != null) {     
      tint(0, 255, 255, 127);
      selectedPiece.display();
      noTint();
    }
  }
  
  public void turn() {
      
      
        
    turnTracker++;
  }

  mouseClicked() {
    //selecting piece
    if (selectedPiece != null) {
      if (grid[(int) (mouseX / squareSize)][7 - (int) (mouseY / squareSize)] != null) {
        if (grid[(int) (mouseX / squareSize)][7 - (int) (mouseY / squareSize)].col == turnTracker % 2) {
          selectedPiece = grid[(int) (mouseX / squareSize)][7 - (int) (mouseY / squareSize)];
        }
      }      
    }
    //moving piece
    else {
      
    
  }
    
    
  
  public void castle {
  }
  
  public void promotion {
  }
  
  public void enpessant {
  }
  
  public void draw() {
    display();
  }

}
