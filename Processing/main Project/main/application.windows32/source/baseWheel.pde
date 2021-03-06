//BUGS:
//We override other tasks if we get more tasks than places on the wheel
//fuck im tired
class BaseWheel {
  int wheelColor = 255;
  int xPos, yPos, cWidth, cHeight;
  float currentAngel;
  LinkedList<Person> people;
  int amountOfTasks;
  public BaseWheel(int xPos, int yPos, int cWidth, int cHeight, LinkedList<Person> people, int amountOfTasks) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.cWidth = cWidth;
    this.cHeight = cHeight;

    this.people = people;
    this.currentAngel = PI*1.5; // head of cicrle  

    this.amountOfTasks = amountOfTasks;
  }

  //generates the first wheel
  void generate() {
    float arcD = cWidth;
    //initiate base white circle
    drawBase();
    //noStroke();
    stroke(255);
    for (Person p : people) {
      for (int i=0; i<p.getAmountOfTasks (); i++) {
        int r = p.getColor().getR();
        int g = p.getColor().getG();
        int b  =p.getColor().getB();
        fill(r, g, b);
        arc(xPos, yPos, arcD, arcD, currentAngel, currentAngel + getArcSpan(), PIE); 

        increaseCurrentAngel();
      }
    }
  }
  //return the size of each cake slice in the big pie..
  float getArcSpan() {
    return 2*PI/this.amountOfTasks;
  }
  void drawBase() {
    noStroke();
    fill(216, 223, 234);
    ellipse(xPos, yPos, cWidth, cWidth);
  }
  void increaseCurrentAngel() {
    currentAngel += getArcSpan();
    currentAngel = currentAngel > 2*PI*amountOfTasks ? 2*PI*amountOfTasks : currentAngel;
  }
  void decreaseCurrentAngel() {
    currentAngel -= getArcSpan();
    currentAngel = currentAngel < 0 ? 0 : currentAngel;
  }
}

