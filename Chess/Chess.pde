Board board;
void setup() {
  size(800, 800);
  board = new Board();
}

void draw() {
  board.draw();
}

void mouseClicked() {
  board.mouseClicked();
}
