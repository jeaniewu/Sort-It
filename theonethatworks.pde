Trash crumpledpaper;
Trash bananapeel;
Trash waterbottle;
Trash bluesoda;
Trash soda1;
Trash paper;
Trash papercup;
Trash milkcarton;
Trash burger;
Trash recyclableplastic;
Trash plasticspoon;
Trash chipsbag;
Trash detergent;


Bin bin1;  
Bin bin2;
Bin bin3;
Bin bin4;
Bin bin5;
Bin bin6; // 6 trash cans

float bx;
float by;
int trashSize = 120;


ArrayList<Trash> listofTrash;
ArrayList<Bin> listofBin; 

ArrayList<Trash> currentTrash = new ArrayList<Trash>();
Game firstGame;

void setup() {
  size(750, 750);
  Trash crumpledpaper = new Trash(width/2, height/2, loadImage("1.png"), false, "Paper");
  Trash bananapeel= new Trash(width/2, height/2, loadImage("2.png"), false, "Organic");
  Trash waterbottle= new Trash(width/2, height/2, loadImage("3.png"), false, "Plastic");
  Trash bluesoda= new Trash(width/2, height/2, loadImage("4.png"), false, "Plastic");
  Trash soda1= new Trash(width/2, height/2, loadImage("5.png"), false, "Plastic");
  Trash paper= new Trash(width/2, height/2, loadImage("6.png"), false, "Paper");
  Trash papercup= new Trash(width/2, height/2, loadImage("7.png"), false, "Paper");
  Trash milkcarton= new Trash(width/2, height/2, loadImage("8.png"), false, "Organic");
  Trash burger= new Trash(width/2, height/2, loadImage("9.png"), false, "Organic");
  Trash recyclableplastic= new Trash(width/2, height/2, loadImage("10.png"), false, "Plastic");
  Trash plasticspoon= new Trash(width/2, height/2, loadImage("11.png"), false, "Plastic");
  Trash chipsbag= new Trash(width/2, height/2, loadImage("12.png"), false, "Plastic");
  Trash detergent= new Trash(width/2, height/2, loadImage("13.png"), false, "Plastic");


  Bin bin1 = new Bin("Empty", loadImage ("SQUAREpurple bin.png"), 0, 0);

  Bin bin2 = new Bin("Plastic", loadImage ("SQUAREplasticandcans bin.png"), 0, height/2.5);

  Bin bin3 = new Bin("Empty", loadImage ("SQUAREredbin.png"), 0, height-(height/4));

  Bin bin4 = new Bin("Organic", loadImage ("SQUAREorganicsbin.png"), width-width/4, 0);

  Bin bin5 = new Bin("Paper", loadImage ("SQUAREpaper bin.png"), width-width/4, height-(height/4));  

  Bin bin6 = new Bin("Empty", loadImage ("SQUAREyellow bin.png"), width-width/4, height/2.5);

  listofBin = new ArrayList<Bin>();

  listofTrash = new ArrayList<Trash>();
  listofTrash.add(crumpledpaper);
  listofTrash.add(bananapeel); 
  listofTrash.add(waterbottle);
  listofTrash.add(bluesoda); 
  listofTrash.add(soda1);
  listofTrash.add(paper); 
  listofTrash.add(papercup);
  listofTrash.add(milkcarton); 
  listofTrash.add(burger);
  listofTrash.add(recyclableplastic); 
  listofTrash.add(plasticspoon);
  listofTrash.add(chipsbag); 
  listofTrash.add(detergent); 


  listofBin.add(bin1);
  listofBin.add(bin2);
  listofBin.add(bin3);
  listofBin.add(bin4);
  listofBin.add(bin5);
  listofBin.add(bin6);

  firstGame = new Game (true, 0, 1);
  firstGame.start();
}

void draw() {
  background(255);
  for (int j = 0; j < listofBin.size (); j++) {
    Bin bin = listofBin.get(j);
    bin.display();
  }

  for (int i = 0; i < currentTrash.size (); i++) {
    Trash trash = currentTrash.get(i);
    trash.inabin();
    if (trash.success) {
      currentTrash.remove(i);
      i--;
    } else {
      trash.display();
      if (mouseX > trash.x-trashSize && mouseX < trash.x+trashSize && 
        mouseY > trash.y-trashSize && mouseY < trash.y+trashSize) {
        trash.overBox = true;  
        if (!trash.locked) { 
          stroke(255); 
          fill(153);
        }
      } else {
        stroke(153);
        fill(153);
        trash.overBox = false;
      }
    }
  }
}



class Trash {
  float x;
  float y;
  PImage image;
  boolean success;
  String type;
  boolean overBox = false;
  boolean locked = false;
  float xOffset = 0.0; 
  float yOffset = 0.0;

  Trash (float tempX, float tempY, PImage tempimage, boolean tempsuccess, String temptype) {
    this.x = tempX;
    this.y = tempY;
    image = tempimage;
    success = tempsuccess;
    type = temptype;
  }

  void display() { 
    image(this.image, x, y, width/10, height/10);
  }

  void inabin() {
    if ((this.x >= 0) && (this.x <= width/4-(width/8)) && (this.y >= 0) && (this.y <= height/4 )) { 
      noLoop();
      fill(255, 0, 0);
      textSize(height/15);
      textAlign(CENTER, CENTER);
      text("Wrong Garbage!", width/2, height/2);
    } else if ((this.x >= 0) && (this.x <= width/4-(width/8)) && (this.y >= height/2) && (this.y <= (height/2)+height/4)) {
      if (this.type == "Plastic") {
        this.success = true;
      } else {
        noLoop();
        fill(255, 0, 0);
        textSize(height/15);
        textAlign(CENTER, CENTER);
        text("Wrong Garbage!", width/2, height/2);
      }
    } else if ((this.x >= 0) && (this.x <= width/4-(width/8)) && (this.y >= height/5+height/5) && (this.y <= (height/5))) {
      noLoop();
      fill(255, 0, 0);
      textSize(height/15);
      textAlign(CENTER, CENTER);
      text("Wrong Garbage!", width/2, height/2);
    } else if ((this.x >= width-width/4+(width/10)) && (this.x <= width) && (this.y >= 0) && (this.y <= height/4)) {
      if (this.type == "Organic") {
        this.success = true;
      } else {
        noLoop();
        fill(255, 0, 0);
        textSize(height/15);
        textAlign(CENTER, CENTER);
        text("Wrong Garbage!", width/2, height/2);
      }
    } else if ((this.x >= width-width/4+(width/9)) && (this.x <= width) && (this.y >= height/2 - height/5) && (this.y <= (height/2)+height/4) ){
      noLoop();
      fill(255, 0, 0);
      textSize(height/15);
      textAlign(CENTER, CENTER);
      text("Wrong Garbage!", width/2, height/2);
    } else if ((this.x >= width-width/4+(width/9)) && (this.x <= width) && (this.y >= height-height/4) && (this.y <= height)) {
      if (this.type == "Paper") {
        this.success = true;
      } else {
        noLoop();
        fill(255, 0, 0);
        textSize(height/15);
        textAlign(CENTER, CENTER);
        text("Wrong Garbage!", width/2, height/2);
      }
    } else {
      this.success = false;
    }
  }
}


class Bin {
  String  n;
  PImage square;
  float x;
  float y;

  Bin(String tempN, PImage tempsquare, float tempX, float tempY) {
    n=tempN;
    square=tempsquare;
    x= tempX;
    y= tempY;
  }

  void display() {
    image(this.square, x, y, width/4, height/4);
  }
}

/////////////////////////////////////////////////////////////

class Game {
  boolean state;
  int score;
  int level;

  Game (boolean tempstate, int tempscore, int templevel) {
    state = tempstate;
    score = tempscore;
    level = templevel;
  }

  void start() {
    int counter = 0;
    while (this.state) {
      if (second() % 3 == 0) {
        float new_x = random((width - 3*width/4), (width - width/4));
        float new_y = random(height/5, height-height/5);
        Trash t = generateTrash(listofTrash);
        t.x = new_x;
        t.y = new_y;
        currentTrash.add(t);
        draw();    ///////// CHange the 3 to a variable later!!!!
      }
      if (currentTrash.size() >= 30) {
        state = false;
      }
    }
  }
}

Trash generateTrash (ArrayList<Trash> thrases) {
  float index = random (12);
  int integer = round(index);
  return thrases.get(integer);
}


////////////////////////////////////////////





void mousePressed() {
  for (int i = 0; i < currentTrash.size (); i++) {
    Trash trash = currentTrash.get(i);

    if (trash.overBox) { 
      trash.locked = true; 
      fill(255, 255, 255);
    } else {
      trash.locked = false;
    }
    trash.xOffset = mouseX-trash.x; 
    trash.yOffset = mouseY-trash.y;
  }
}

void mouseDragged() {
  for (int i = 0; i < currentTrash.size (); i++) {
    Trash trash = currentTrash.get(i);

    if (trash.locked) {
      trash.x = mouseX-trash.xOffset; 
      trash.y = mouseY-trash.yOffset;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < currentTrash.size (); i++) {
    Trash trash = currentTrash.get(i);

    trash.locked = false;
  }
}

