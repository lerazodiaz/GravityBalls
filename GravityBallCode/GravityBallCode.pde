//declare variables

int count = 30;
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] g = new float[count];

void setup() {
  //set size of canvas
  size(800, 600);
  for (int i = 0; i < count; i++) {   //if int is btwn 0 to 30, add 1 to i
    velY[i] += g[i];
    x[i] = width/2;
    y[i] = height/2;
    g[i] = 0.1;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    diam[i] = 80;
  }
}

void draw() {
  //draw background to cover previous frame
  background(118, 142, 247);
  fill(random(245));
  for (int i = 0; i <count; i++) {
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);    //draw ellipse 

    //add velocity to position
    velY[i] = velY[i]+g[i];    //adds gravity to velY
    x[i] += velX[i];
    y[i] += velY[i];


    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {    //if the ball hits the bottom wall, reverse velocity 
      velY[i] = -abs(velY[i]);    //makes Y position above bottom 
      y[i]= height -diam[i]/2;
    }
  }
}