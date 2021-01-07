//variables declaration

//width & height of the screen. all objects are scaled to the width and height of the screen
var screenx = 800, screeny = 400;

// start position of 3 car
var x1 = 10,  x2 = x1 + 10, x3 = x1 + 20;
var y1 = screeny * 1/2 , y2 = screeny * 2/3, y3 = screeny - 50;

// width of the car
var w = 100;

//speed of 3 car. Speed is a random value and addup to x position value in draw function
var sp1 = random(1, 2), sp2 = random(1, 2), sp3 = random(1, 2);

//moving direction of the car. Direction is a random value and addup to y position value in draw function
var dr1 = random(-1, 1), dr2 = random(-1, 1), dr3 = random(-1, 1);

//position of the obstacle (the rock). The rock appears at a random position
var xPos = random(250, screenx - 130), yPos = random(screeny * 1/3, screeny);

//Start position of clouds
var cloudx1 = screenx/2, cloudy1 = screeny/15, cloudx2 = screenx/2, cloudy2 = screeny/10 - 20;

//speed of the cloud moving. This value addup to cloud x position value in draw function
var clouds = 1;

//functions declaration

//function to draw car
var drawCar = function(x, y, w, r, g, b, n)  {
    //car body
    fill(r, g, b);
    rect(x, y, w, w/5);
    rect(x + 15, y - 20, w * (2/3), w/3);
    //the wheels
    fill(77, 66, 66);
    ellipse(x + 25, y + 20, w/5, w/5);
    ellipse(x + 75, y + 20, w/5, w/5);
    //car number
    textSize(20);
    fill(0, 0, 0);
    text(n, x + w/2 - 10, y - 30);
};

//Draw obstacle hit event "KETZZZ"
var carHitObstacle = function(x, y)  {
    fill(255, 255, 255);
    strokeWeight(3);
    textSize(20);
    text("Kétzzz...", x - w/2, y + w/3);
};

//Draw car hit event "BUM"
var carHit = function(x, y) {
  fill(255, 0, 0);
  beginShape();
  vertex(x + w,      y - 100);
  vertex(x + w + 30, y - 60);
  vertex(x + w + 70, y - 90);
  vertex(x + w + 60, y - 50);
  vertex(x + w + 100,y - 40);
  vertex(x + w + 70, y - 20);
  vertex(x + w + 80, y + 20);
  vertex(x + w + 50, y - 10);
  vertex(x + w + 30, y + 40);
  vertex(x + w + 10, y);
  vertex(x + w - 30, y + 30);
  vertex(x + w - 10, y - 10);
  vertex(x + w - 60, y - 25);
  vertex(x + w - 20, y - 40);
  vertex(x + w - 50, y - 70);
  vertex(x + w, y - 50);
  endShape(CLOSE);

  fill(255, 255, 255);
  strokeWeight(3);
  textSize(20);
  text("BÙM!!!", x + w, y - 25);
};

//draw text for finish event
var textWinner = function(x, y)  {
  textSize(30);
  fill(0, 0, 200);
  text("ARE YOU WIN?", screenx/2 - 100, screeny/2 - 30);
};

//draw cloud
var drawCloud = function(cloudx, cloudy)  {
    fill(255, 255, 255);
    ellipse(cloudx, cloudy, screenx/10, screeny/20);
    ellipse(cloudx+15, cloudy+15, screenx/6, screeny/15);
    ellipse(cloudx+40, cloudy+40, screenx/6, screeny/15);
    ellipse(cloudx-20, cloudy+30, screenx/6, screeny/15);
    ellipse(cloudx-30, cloudy+10, screenx/6, screeny/15);
};

//draw trees
    var drawTree = function(x) {
    noStroke();
    //body
    fill(100, 10, 0);
    rect(screenx / 20 + x, screeny * 1/3 - 40, 8, 40);
    //leaves
    fill(50, 150, 0);
    ellipse(screenx / 20 + x, screeny * 1/3 - 40, w / 5, w / 6);
    ellipse(screenx / 20 + x + 15, screeny * 1/3 - 35, w / 5, w / 7);
    ellipse(screenx / 20 + x + 5, screeny * 1/3 - 30, w / 5, w / 7);
    ellipse(screenx / 20 + x - 10, screeny * 1/3 - 30, w / 5, w / 7);
};

//draw background
var drawBG = function() {
    //screen size and color
    size(screenx,screeny, 0);
    background(151, 244, 247);

    //the road
    noStroke();
    fill(190, 190, 190);
    rect(0, screeny * 1/3, screenx, screeny * 2/3);

    //the sun
    fill(255, 255, 0);
    ellipse(screenx/2, 10, 100, 100);

    //trees
    drawTree(-30);
    drawTree(0);
    drawTree(50);
    drawTree(230);
    drawTree(280);
    drawTree(300);
    drawTree(600);
    drawTree(710);
    drawTree(730);

    //Start-line
    stroke(255, 255, 255);
    strokeWeight(6);
    line(110, screeny * 1/3, 110, screeny);

    //Start sign
    fill(255, 255, 255);
    line (130, screeny * 1/3, 130, screeny * 1/3 + 30);
    rect(100, screeny * 1/3 - 20 ,60, 20);
    fill(255, 0, 0);
    textSize(15);
    text("START", 108, screeny * 1/3 - 5);

    //End-line
    stroke(255, 255, 255);
    strokeWeight(6);
    line(screenx - 100, screeny * 1/3, screenx - 100, screeny);

    //End sign
    fill(255, 255, 255);
    line(screenx - 80, screeny * 1/3, screenx - 80, screeny * 1/3 + 30);
    rect(screenx - 110, screeny * 1/3 - 20, 60, 20);
    fill(255, 0, 0);
    textSize(15);
    text("FINISH", screenx - 106, screeny * 1/3 - 5);

    //lane-lines
    line(140, screeny * 4.5/9, screenx - 120, screeny * 4.5/9);
    line(140,screeny * 6/9, screenx - 120, screeny * 6/9);
    line(140,screeny * 7.5/9, screenx - 120, screeny * 7.5/9);

    //obstacle (the rock)
    noStroke();
    fill(100, 100, 100);
    beginShape();
    curveVertex(xPos, yPos);
    curveVertex(xPos - 5,  yPos + 10);
    curveVertex(xPos + 5,  yPos + 20);
    curveVertex(xPos + 25, yPos + 20);
    curveVertex(xPos + 35, yPos + 10);
    curveVertex(xPos + 25, yPos - 5);
    curveVertex(xPos + 15, yPos - 10);
    curveVertex(xPos, yPos);
    endShape(CLOSE);
};

//main code with draw() function to create animation
draw = function() {
    //draw background and 3 cars
    drawBG();
    noStroke();
    drawCar(x1, y1, w,    255, 0,   115, 1);//1. pink car
    drawCar(x2, y2, w+20, 255, 255, 115, 2);//2. yellow car
    drawCar(x3, y3, w-5,  0,   255, 255, 3);//3. green car


    //addup car moving speed and direction
    x1 = x1 +sp1; y1 = y1 +dr1;
    x2 = x2 +sp2; y2 = y2 +dr2;
    x3 = x3 +sp3; y3 = y3 +dr3;

    //limit cars moving inside the road (2-side road limit)
    if(y1 - w/4 - 30 <= screeny * 1/3 || y1 + w/4 >= screeny) {dr1 = (-1) * dr1;}
    if(y2 - w/4 - 30 <= screeny * 1/3 || y2 + w/4 >= screeny) {dr2 = (-1) * dr2;}
    if(y3 - w/4 - 30 <= screeny * 1/3 || y3 + w/4 >= screeny) {dr3 = (-1) * dr3;}

    //draw cloud
    drawCloud(cloudx1, cloudy1);
    drawCloud(cloudx2, cloudy2);

    //cloud moving back and forth between the sun and 2 side of the screen
    cloudx1 = cloudx1 - clouds;
    cloudx2 = cloudx2 + clouds;
    if (cloudx1 === 0 || cloudx1 === screenx/2) {clouds=(-1)*clouds;}

    //car hit obstacle event. Cars will stop and make Ketzzz sound if hit rock
    if((x1 + w >= xPos && x1 <= xPos) && (y1 <= yPos + w/4 && y1 >= yPos - w/4)) {
      dr1 = 0;
      sp1 = 0;
      carHitObstacle(x1, y1);
    }
    if((x2 + w >= xPos && x2 <= xPos) && (y2 <= yPos + w/4 && y2 >= yPos - w/4)) {
      dr2 = 0;
      sp2 = 0;
      carHitObstacle(x2, y2);
    }
    if((x3 + w >= xPos && x3 <= xPos) && (y3 <= yPos + w/4 && y3 >= yPos - w/4)) {
      dr3 = 0;
      sp3 = 0;
      carHitObstacle(x3, y3);
    }

    //car hit each other event. Cars will stop and make Bum sound if hit each other
    if ((x1 + w >= x2 && x1 <= x2 + w/2) && (y1 >= y2 && y1 <= y2 + w/3)) {
      sp1 = 0;
      sp2 = 0;
      dr1 = 0;
      dr2 = 0;
      carHit(x1, y1);
    }
    if ((x1 + w >= x3 && x1 <= x3 + w/2) && (y1 >= y3 && y1 <= y3 + w/3)) {
      sp1 = 0;
      sp3 = 0;
      dr1 = 0;
      dr3 = 0;
      carHit(x1, y1);
    }
    if ((x2 + w >= x3 && x2 <= x3 + w/2) && (y2 >= y3 && y2 <= y3 + w/3)) {
      sp2 = 0;
      sp3 = 0;
      dr2 = 0;
      dr3 = 0;
      carHit(x3, y3);
    }

    //stop at finish. Car keep moving until reaching finish line whether win or not
    if(x1 + w/2 >= screenx - 100) {sp1 = 0; dr1 = 0; textWinner();}
    if(x2 + w/2 >= screenx - 100) {sp2 = 0; dr2 = 0; textWinner();}
    if(x3 + w/2 >= screenx - 100) {sp3 = 0; dr3 = 0; textWinner();}
};
