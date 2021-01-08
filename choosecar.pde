
var drawCar = function(x, y, w, r, g, b, n)  {
    // draw the car body
    fill(r, g, b);
    rect(x,      y,      w      , w/6);
    rect(x + 15, y - 20, w*(2/3), w/4);
    // draw the wheels
    fill(77, 66, 66);
    ellipse(x + w/4, y + w/5, w/5, w/5);
    ellipse(x + w*3/4, y + w/5, w/5, w/5);
    //car number
    textSize(20);
    fill(255,255,255);
    text(n,x + w/2 - 5, y - 30);
};

//draw car
size(300,70);
background(0,0,0);
noStroke();
drawCar(10 , 45, 80, 255, 0  , 115, 1);//pink car
drawCar(110, 45, 80, 255, 255, 115, 2);//yellow car
drawCar(210, 45, 80, 0,   255, 255, 3);//green car
