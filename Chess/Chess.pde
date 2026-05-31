Board board;
void setup() {
  fill(255, 0, 0);
  textSize(50);
  size(800, 800);
  board = new Board();
}

void draw() {
  board.draw();
  
}

void mouseClicked() {
  board.mouseClicked();
}
