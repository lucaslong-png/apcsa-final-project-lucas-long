class Board {
  Piece[][] grid;
  ArrayList<Piece> whitePieces;
  ArrayList<Piece> blackPieces;
  Piece selectedPiece;
  boolean gameover;
  int turnTracker;
  PImage sprite;
  boolean check;
  boolean canMove;
  final int WHITE = 0;
  final int BLACK = 1;
  ArrayList<PVector> moveLogPieces;
  ArrayList<PVector> moveLogSquares;
  boolean turnFinished;
  boolean canCastle;
  
  
  
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
  
  public void initializePieces() {
    whitePieces = new ArrayList<Pieces>();
    blackPieces = new ArrayList<Pieces>();      
    for (Piece p : board) {
      if (p != null) {
        if (p.color == WHITE) {
          whitePieces.add(p);
        }
        else {
          blackPieces.add(p);
        }
      }
    }
  }
  
  public ArrayList<PVector> colorValidSquares(ArrayList<Piece> pieceList) {
    ArrayList<PVector> squareList = new ArrayList<PVector>();
    for (Piece p : pieceList) {
      if (p.alive == false) {
        continue;
      }
      innerloop:
      for (PVector u : p.validSquares) {
        for (PVector v : squareList) {
          if (Piece.equals(u, v)) {
            continue innerloop;
          }
        }
        squareList.add(u);        
      }
    }
    return squareList;
  }
            
  
  public void setup() {
    size(800, 800);
    gameover = false;
    turnTracker = 0;
    moveLogPieces = new ArrayList<Piece>();
    moveLogSquares = new ArrayList<PVector>();
    initializeBoard();
    initializePieces();
    promote = false;
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
    canMove = true; 
    while(!mousePressed) {
    }
    //mouseclicked here
    canMove = false;  
    //promotion check
    if (moveLogPieces.get(turnTracker) instanceOf Pawn) {
      if ((int) moveLogSquares.get(turnTracker).y == 0 || (int) moveLogSquares.get(turnTracker).y == 7) {
        promotion(moveLogSquares.get(turnTracker))
      }
    }
    
    if (
  }

  public void mouseClicked() {
    if (canMove) {
      int gridx = (int) (mouseX / squareSize);
      int gridy = 7 - (int) (mouseY / squareSize);
      //selecting piece
      if (selectedPiece == null) {
        if (grid[gridx][gridy] != null) {
          if (grid[gridx][gridy].col == turnTracker % 2) {
            selectedPiece = grid[gridx][gridy];
          }
        }      
      }
      //moving piece
      else {
        if (selectedPiece.isMoveValid(new PVector(gridx, gridy))) {
          selectedPiece.move(new PVector(gridx, gridy));
          turnTracker++;      
        }
      }      
    }   
  }
    
    
  
  public void castle {
  }
  

  
  public void promotion(PVector square) {
    int x = (int) square.x;
    int y = (int) square.y;
    c = grid[x][y].col
    if (key == 1) {
      grid[x][y] = new Queen(this, new PVector(x, y), c);
    }
    else if (key == 2) {
      grid[x][y] = new Rook(this, new PVector(x, y), c);
    }
    else if (key == 3) {
      grid[x][y] = new Bishop(this, new PVector(x, y), c);
    }    
    else if (key == 4) {
      grid[x][y] = new Knight(this, new PVector(x, y), c);
    }    
  }
  
  public void enpessant {
  }
  
  public void draw() {
    display();
  }

}
