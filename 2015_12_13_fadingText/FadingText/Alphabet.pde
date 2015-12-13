class Alphabet {
  private int mX;
  private int mY;
  private char mAlphabet;
  
  Alphabet(int x, int y, char alphabet) {
    setX(x);
    setY(y);
    setAlphabet(alphabet);
  }
  
  void setX(int x) {
    mX = x;
  }
  
  int getX() {
    return mX;
  }
  
  void setY(int y) {
    mY = y;
  }
  
  int getY() {
    return mY;
  }
  
  void setAlphabet(char alphabet) {
    mAlphabet = alphabet;
  }
  
  char getAlphabet() {
    return mAlphabet;
  }
}