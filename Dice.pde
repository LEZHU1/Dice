int t = 0;
int sum = 0;
int speed = 25;

void setup() {
  size(400, 400);
  textSize(44);
  noStroke();
  noLoop();
}

void draw() {

background(#ECE3DA);
  stroke(0);
  strokeWeight(1);
  for (int i = 50; i < 150; i+= 40) {
    for (int u = 50; u<150; u+=40) {
      Die bob = new Die((i+(int)(Math.random()*40)+20), (u + (int)(Math.random()*40)+20));
      bob.roll();
      bob.show();
      sum += bob.getPips();
      text(" " + sum, 20, 450);
    }
  }
  text(" sum: " + sum, 20, 350);
  sum = 0;
}

void drawCat(){
  background(#ECE3DA);
  while (t<500) {
    t += speed;
    strokeWeight(2);
    stroke(137, 105, 74);
   
    fill(239, 201, 164  );
    ellipse(670 - t, 250, 600, 300);
    ellipse(500 - t, 250, 300, 300);
    fill(137, 105, 74);
    triangle(430 - t, 370, 480 - t, 310, 480 - t, 390);
    triangle(430 - t, 140, 480 - t, 110, 480 - t, 190);
    ellipse(350 - t, 250, 10, 40);
    noFill();

    beginShape();
    stroke(137, 105, 74);
    strokeWeight(20);
    curveVertex(940-t, 140); // the first control point
    curveVertex(940-t, 140); // is also the start point of curve
    curveVertex(980-t, 160);
    curveVertex(1000-t, 200);
    curveVertex(960-t, 220);
    curveVertex(950-t, 250); // the last point of curve
    curveVertex(950-t, 250); // is also the last control point
    endShape();
  }
}

void mouseClicked()
{
    drawCat();
  redraw();
}

class Die //models one single dice cube
{

  int myX, myY;
  int pips;
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    pips = (int)(Math.random()*6+1);
  }
  private int getPips() {
    return pips;
  }
  void show()
  {
    fill(255);
    rect(myX, myY, 30, 30, 10);

    if (pips == 1) {
      ellipse(myX+15, myY+15, 4, 4);
    } else if (pips == 2) {
      ellipse(myX+10, myY+25, 4, 4);
      ellipse(myX+20, myY+5, 4, 4);
    } else if (pips == 3) {
      ellipse(myX+5, myY+5, 4, 4);
      ellipse(myX+15, myY+15, 4, 4);
      ellipse(myX+25, myY+25, 4, 4);
    } else if (pips == 4) {
      ellipse(myX+5, myY+25, 4, 4);
      ellipse(myX+5, myY+5, 4, 4);
      ellipse(myX+25, myY+25, 4, 4);
      ellipse(myX+25, myY+5, 4, 4);
    } else if (pips == 5) {
      ellipse(myX+5, myY+25, 4, 4);
      ellipse(myX+5, myY+5, 4, 4);
      ellipse(myX+25, myY+25, 4, 4);
      ellipse(myX+25, myY+5, 4, 4);
      ellipse(myX+15, myY+15, 4, 4);
    } else if (pips == 6) {
      ellipse(myX+5, myY+5, 4, 4);
      ellipse(myX+5, myY+15, 4, 4);
      ellipse(myX+5, myY+25, 4, 4);
      ellipse(myX+25, myY+5, 4, 4);
      ellipse(myX+25, myY+15, 4, 4);
      ellipse(myX+25, myY+25, 4, 4);
    }
  }
}
