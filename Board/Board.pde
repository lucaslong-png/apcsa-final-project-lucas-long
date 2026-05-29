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
  ArrayList<Piece> moveLogPieces;
  ArrayList<PVector> moveLogSquares;
  Piece lastPieceMoved;
  PVector lastSquareMoved;
  boolean turnFinished;
  int castleNow; //0 = no castle, 1 = kingside, -1 = queenside
  
  
  
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
    grid[2][7] = new Bishop(this, new PVector(2, 7), BLACK);
    grid[5][7] = new Bishop(this, new PVector(5, 7), BLACK);
    
    //queen
    grid[3][0] = new Queen(this, new PVector(3, 0), WHITE);
    grid[3][7] = new Queen(this, new PVector(3, 7), BLACK); 
    
    //king
    grid[4][0] = new King(this, new PVector(4, 0), WHITE);
    grid[4][7] = new King(this, new PVector(4, 7), BLACK);
    
    //pawn
    for (int i = 0; i < 8; i++) {
      grid[i][1] = new Pawn(this, new PVector(i, 1), WHITE);
      grid[i][6] = new Pawn(this, new PVector(i, 6), BLACK);
    }  
  }
  
  public void initializePieces() {
    whitePieces = new ArrayList<Piece>();
    blackPieces = new ArrayList<Piece>();      
    for (Piece[] plist : grid) {
      for (Piece p : plist) {
        if (p != null) {
          if (p.col == WHITE) {
            whitePieces.add(p);
          }
          else {
            blackPieces.add(p);
          }
        }
      }
    }
  }
  
   
  
  public void setup() {
    size(800, 800);
    gameover = false;
    turnTracker = 0;
    moveLogPieces = new ArrayList<Piece>();
    moveLogSquares = new ArrayList<PVector>();
    initializeBoard();
    initializePieces();
    castleNow = 0;
    promote = false;
  }
  
  public void display() {
    image(sprite, 0, 0, 800, 800);
    for (Piece[] plist : grid) {
      for (Piece p : plist) {
        if (p != null) {
          p.display();
        }
      }
    }
    if (selectedPiece != null) {     
      tint(0, 255, 255, 127);
      selectedPiece.display();
      noTint();
    }
  }
  
  public void turn() { 
    //promotion check
    if (moveLogPieces.get(turnTracker) instanceof Pawn) {
      if ((int) moveLogSquares.get(turnTracker).y == 0 || (int) moveLogSquares.get(turnTracker).y == 7) {        
        promotion(moveLogSquares.get(turnTracker));
      }
    }
    
    for (Piece p : whitePieces) {
      if (p.gameOver() == 1) {
        gameover = true;
      }
    }
    for (Piece p : blackPieces) {
      if (p.gameOver() == 1) {
        gameover = true;
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
  
  public boolean squareInLOS(ArrayList<PVector> squareList, PVector square) {
    for (PVector v : squareList) {
      if (Piece.equals(square, v)) {
        return true;
      }
    }
    return false;
  }
  
  public boolean castleCheck(Piece p, PVector square) {
    ArrayList<PVector> oppVision;
    if (p.otherColor() == BLACK) {
      oppVision = colorValidSquares(blackPieces);
    }
    else {
      oppVision = colorValidSquares(whitePieces);
    }
    
    //kingside
    int c = p.col * 7; //either 0 or 7
    if (p instanceof King && Piece.equals(square, new PVector(6,c))) {
      if (grid[4][c] != null && grid[7][c] != null) {
        if (!grid[4][c].hasMoved && !grid[7][c].hasMoved && grid[7][c] instanceof Rook) {
          if (grid[5][c] == null && grid[6][c] == null) {
            if (!(squareInLOS(oppVision, new PVector(4, c))) && !(squareInLOS(oppVision, new PVector(5, c))) && !(squareInLOS(oppVision, new PVector(6, c)))) {
              castleNow = 1;
              return true;
            }
          }
        }
      }
    }
    //queenside
    if (p instanceof King && Piece.equals(square, new PVector(2, c))) {
      if (grid[4][c] != null && grid[0][c] != null) {
        if (!grid[4][c].hasMoved && !grid[0][c].hasMoved && (grid[0][c] instanceof Rook)) {
          if (grid[1][c] == null && grid[2][c] == null && grid[3][c] == null) {
            if (!(squareInLOS(oppVision, new PVector(4, c))) && !(squareInLOS(oppVision, new PVector(2, c))) && !(squareInLOS(oppVision, new PVector(3, c)))) {
              castleNow = -1;
              return true;
            }
          }
        }
      }    
    }
    return false;
  }
           
  public boolean isLegalMove(Piece p, PVector square) {    
    if (!p.isMoveValid(square) && !castleCheck(p, square)) {
      return false;
    }
    else {
      return true;
    }
 
  }
  
  public void promotionCheck(Piece p, PVector square) {
    if (!(p instanceof pawn)) {
      return false;
    }
    if (square.y < 6.5 && square.y > 0.5) {
      return false;
    }
    return true;
  }
    
    

  
  public void promotion(PVector square) {
    int x = (int) square.x;
    int y = (int) square.y;
    int c = grid[x][y].col;
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
  /*
  public void enpessant {
    
  }
  */
  public void mouseClicked() {
    int gridx = (int) (mouseX / squareSize);
    int gridy = 7 - (int) (mouseY / squareSize);    
    if (canMove) {
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
        if (isLegalMove(selectedPiece, (new PVector(gridx, gridy)))) {
          selectedPiece.move(new PVector(gridx, gridy));
          int c = selectedPiece.col * 7;
          //castling
          if (castleNow == 1) {
            board[7][c] = null;
            board[5][c] = new Rook(this, new PVector(5, c), selectedPiece.col);
          }
          else if (castleNow == -1) {
            board[0][c] = null;
            board[3][c] = new Rook(this, new PVector(3, c), selectedPiece.col);
          }
          //promotion
          
          turnTracker++;      
        }
      }      
    }   
  }
  
  public void draw() {
    display();
  }

}
