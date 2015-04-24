boolean TRUE = true;
boolean FALSE = false;
boolean DEBUG = TRUE;

//MAIN PROGRAM GLOBALS
int windowWidth, windowHeight;
int bgColor = 0;

Person[] people;
//Tasks[] tasks;

void setup() {
  this.windowWidth = displayWidth;
  this.windowHeight = displayHeight;
  size(windowWidth, windowHeight); //GOING FULL SCREEN BABY ! 
  //setting main window bg

  background(bgColor);

  Person david = new Person("David", new personColor(0, 0, 255));
  Person anna = new Person("Anna", new personColor(255, 0, 255));
  people = new Person[2];
  david.increaseAmountOfTasks();
  david.increaseAmountOfTasks();
  anna.increaseAmountOfTasks();
  people[0] = david;
  people[1] = anna;
  //everything is dead after this
  //noLoop();
  flag = true;
}

void draw() {
  int baseWheelSize = windowWidth/2;
  baseWheel base = new baseWheel(windowWidth/2, windowHeight/2, baseWheelSize, baseWheelSize, people, 5);
  base.generate();
}
