PImage [][] gazou=new PImage[4][4];
int [][]fild=new int[4][4];
int [][]ans=new int[4][4];
int [][]now=new int[4][4];
int [][]hantei=new int[4][4];
int [] bro=new int [15];
int sa=0;
int su=0;
int a=0, b=0;
int count =0;
int key_count=0;
boolean f=true;
boolean last = false;
int lox=1, loy=1;

void setup() {
  size(800, 800);
  background(0) ;
  stroke(255);
  line(200, 0, 200, 800);
  line(400, 0, 400, 800);
  line(600, 0, 600, 800);
  line(0, 200, 800, 200);
  line(0, 400, 800, 400);
  line(0, 600, 800, 600);
  for (int x=0; x<4; x++) {
    for (int y=0; y<4; y++) {
      su++;
      fild[y][x]=0;
      now[x][y]=su;
      ans[x][y]=su;
      gimage(su);
    }
  }
  fild[3][3]=1;

  int sirox=3;
  int siroy=3;
  int atai=0;
  PImage g_atai;
  int kurox=3;
  int kuroy=3;
  int co=int(random(1000, 3000));
  int f=0;

  while (f!=co) {
    int a=int(random(4));
    int b=int(random(4));
    if (fild[b][a]==0) {
      sirox=b;
      siroy=a;
      if ((sirox==kurox&&siroy==kuroy+1)||(sirox==kurox&&siroy==kuroy-1)||(siroy==kuroy&&sirox==kurox+1)||(siroy==kuroy&&sirox==kurox-1)) {
        atai=now[b][a];
        g_atai=gazou[b][a];
        kurox=b;
        kuroy=a;
        for (int x=0; x<4; x++) {
          for (int y=0; y<4; y++) {
            if (fild[x][y]==1) {
              now[x][y]=atai;
              gazou[x][y]=g_atai;
              fild[x][y]=0;
            }
          }
        }
        fild[b][a]=1;
      }
    }
    f++;
    println(a);
    lox=kurox;
    loy=kuroy;
  }
  println(lox+" "+kurox+" "+loy+" "+kuroy);
}

void draw() {
  background(0);
  for (int x=0; x<4; x++) {
    for (int y=0; y<4; y++) {
      if (fild[y][x]==1) {
        fill(0);
        rect(x*200, y*200, 200, 200);
      } else {
        image(gazou[y][x], x*200, y*200, 200, 200);
        fill(255, 255, 0);
        textSize(40);
        if (last == true) {
          textSize(120);
          fill(255, 0, 0, 255);
          text("Coupon Get!!", 20, 440);
        } else {
          if (f == false) {
            text(now[y][x], x*200+80, y*200+120) ;
          } else {
            fill(255);
            rect(x*200, y*200, 200, 200);
            image(gazou[y][x], x*200, y*200, 200, 200);
          }
        }
      }
      stroke(255);
      line(200, 0, 200, 800);
      line(400, 0, 400, 800);
      line(600, 0, 600, 800);
      line(0, 200, 800, 200);
      line(0, 400, 800, 400);
      line(0, 600, 800, 600);
    }
  }
  hantei();
}

void hantei() {
  int atari=0;
  for (int a=0; a<4; a++) {
    for (int b=0; b<4; b++) {
      if (now[b][a]==ans[b][a]) {
        atari++;
      }
    }
    if (atari==15) {
      last = true;
    } else {
      last = false;
    }
  }
}

int g=200;
int sirox=3;
int siroy=3;
int ax=0;
int by=0;
int atai=0;
PImage g_atai;
int kurox2;
int kuroy2;
boolean au=true;

void mousePressed() {
  if (au) {
    kurox2=lox;
    kuroy2=loy;
    au=false;
    println(kurox2+" "+kuroy2);
  }
  for (int a=0; a<4; a++) {
    for (int b=0; b<4; b++) {
      if (mouseX>g*a&&mouseX<g*a+g&&mouseY>g*b&&mouseY<g*b+g) {

        if (fild[b][a]==0) {
          sirox=b;
          siroy=a;
          if ((sirox==kurox2&&siroy==kuroy2+1)||(sirox==kurox2&&siroy==kuroy2-1)||(siroy==kuroy2&&sirox==kurox2+1)||(siroy==kuroy2&&sirox==kurox2-1)) {
            atai=now[b][a];
            g_atai=gazou[b][a];
            kurox2=b;
            kuroy2=a;
            for (int x=0; x<4; x++) {
              for (int y=0; y<4; y++) {
                if (fild[x][y]==1) {
                  now[x][y]=atai;
                  gazou[x][y]=g_atai;
                  fild[x][y]=0;
                }
              }
            }
            fild[b][a]=1;
          }
        }
      }
    }
  }
}

void keyPressed() {
  if (key==' ') {
    if (key_count==0) {
      f=false;
      key_count=1;
    } else {
      f=true;
      key_count=0;
    }
  }
}
int c=0, d=0;
void gimage(int a) {
  switch(a) {
  case 1:
    gazou[c][d]=loadImage("1.jpg");
    break;
  case 2:
    gazou[c][d]=loadImage("2.jpg");
    break;
  case 3:
    gazou[c][d]=loadImage("3.jpg");
    break;
  case 4:
    gazou[c][d]=loadImage("4.jpg");
    break;
  case 5:
    gazou[c][d]=loadImage("5.jpg");
    break;
  case 6:
    gazou[c][d]=loadImage("6.jpg");
    break;
  case 7:
    gazou[c][d]=loadImage("7.jpg");
    break;
  case 8:
    gazou[c][d]=loadImage("8.jpg");
    break;
  case 9:
    gazou[c][d]=loadImage("9.jpg");
    break;
  case 10:
    gazou[c][d]=loadImage("10.jpg");
    break;
  case 11:
    gazou[c][d]=loadImage("11.jpg");
    break;
  case 12:
    gazou[c][d]=loadImage("12.jpg");
    break;
  case 13:
    gazou[c][d]=loadImage("13.jpg");
    break;
  case 14:
    gazou[c][d]=loadImage("14.jpg");
    break;
  case 15:
    gazou[c][d]=loadImage("15.jpg");
    break;
  }
  d++;
  if (d==4) {
    d=0;
    c++;
  }
}
