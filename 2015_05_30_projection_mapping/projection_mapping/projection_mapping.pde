import processing.video.*;
import processing.opengl.*;

Movie mov;            // 動画
int selected = -1;  // 選択されている頂点
int pos[][] = {{0,0},{800,0},{800,600},{0,600}}; // 頂点座標

void setup() {
  size(displayWidth, displayHeight, P2D);
  mov = new Movie(this,"movie.mov");  // 動画ファイルの読み込み
  mov.loop();           // 動画ループ再生
}

void draw() {
  background(0);
  mov.read();

  // ビデオテクスチャの描画
  beginShape();
    texture(mov);  
    vertex(pos[0][0], pos[0][1], 0, 0);
    vertex(pos[1][0], pos[1][1], mov.width, 0);
    vertex(pos[2][0], pos[2][1], mov.width, mov.height);
    vertex(pos[3][0], pos[3][1], 0, mov.height);
  endShape(CLOSE);

  // マウスによる頂点操作
  if ( mousePressed && selected >= 0 ) {
    pos[selected][0] = mouseX;
    pos[selected][1] = mouseY;
  }
  else {
    float min_d = 20; // この値が頂点への吸着の度合いを決める
    selected = -1;
    for (int i=0; i<4; i++) {
      float d = dist( mouseX, mouseY, pos[i][0], pos[i][1] );
      if ( d < min_d ) {
        min_d = d;
        selected = i;
      }      
    }
  }
  if ( selected >= 0 ) {
    ellipse( mouseX, mouseY, 20, 20 );
  }
}

boolean sketchFullScreen() {
  return true;
}
