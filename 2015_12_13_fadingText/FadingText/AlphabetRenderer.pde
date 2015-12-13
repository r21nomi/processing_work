class AlphabetRenderer {
 private int mTextSize;
 private int mSpace;
 private ArrayList<Alphabet> mAlphabets;
  
 AlphabetRenderer(int textSize) {
   mTextSize = textSize;
   mSpace = 4;
   mAlphabets = new ArrayList();
   
   for (int x = 0, xLen = width; x < xLen; x += (mTextSize + mSpace)) {
    for (int y = 0, yLen = width; y < yLen; y += (mTextSize + mSpace)) {
      int posX = x - xLen / 2;
      int posY = y - yLen / 2;
      Alphabet alphabet = new Alphabet(posX, posY, createRandomChar());
      mAlphabets.add(alphabet);
    }
   }
 }
  
 void update() {
  for (Alphabet alphabet : mAlphabets) {
    if (random(100) < 10) {
      alphabet.setAlphabet(createRandomChar());
    }
  }
 }
 
 void display() {
   for (Alphabet alphabet : mAlphabets) {
     int posX = alphabet.getX() + mouseX;
     int posY = alphabet.getY() + mouseY;
     float dist = dist(posX, posY, mouseX, mouseY);
     
     if (dist > mTextSize * 10) {
       continue; 
     }
     
     text(alphabet.getAlphabet(), posX, posY);
   }
 }
 
 private char createRandomChar() {
   return char(int(random(97, 123)));
 }
}