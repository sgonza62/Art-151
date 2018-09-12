//Ball
float x;
float y;
float xspeed;
float yspeed;

//Ball Demensions
PImage soccerball;

//Goal post
PImage goalpost;
int postwidth = width-550;
int postheight = height-20;

//penalty box
int boxwidth = 700;
int boxheight = 300;

//goalie
PImage goalie1;
float xgoalie;
float ygoalie;
float gxspeed;


// score
int scorecounter = 0;
int gscorecounter = 0;

void setup() {
  size(displayWidth, displayHeight);


  x = mouseX;
  gxspeed = 5;
  xgoalie = 810;
  ygoalie = 440;
  

  noCursor();
  goalpost = loadImage("goalpost.png");
  goalie1 = loadImage("goalie.jpg");
  soccerball = loadImage("soccerball.png");
  

  //Soccer ball bounderies 
  if (mouseX > 600 && mouseX < 1300 && mouseY > 700 && mouseY < 1000) {
    image(soccerball, mouseX, mouseY);
  }
}


void draw() {
  background(0, 200, 0);
  textSize(40);
  text("Score: " + scorecounter, 20, 40);
  x = x+xspeed;
  
   textSize(40);
  text("Goalie Score: " + gscorecounter, displayWidth -500, 40);
  
  xgoalie = xgoalie + gxspeed;
  
  


  //Goal Post
  image(goalpost, 550, 20);
  rect(1230, 20, 50, 422);
  rect(620, 20, 50, 422);
  rect(620, 20, 660, 50);
   
   
  //penalty box
  fill(0, 255, 0);
  stroke(255);
  rect(600, 700, boxwidth, boxheight);

  //goalie
  image(goalie1, xgoalie, 100);
  
  if(xgoalie  < 630){
    gxspeed = -gxspeed;
}

if (xgoalie > 1000){
  gxspeed = -gxspeed;
}



  fill(255);
  stroke(0);
  smooth();

  //Soccer ball if mouse pressed shoots ball
  if (mouseX > 600 && mouseX < 1300 && mouseY > 700 && mouseY < 1000) {
     image(soccerball, mouseX, mouseY);
    if (mousePressed == true) {
      y = y-5;
      image(soccerball, mouseX, y);

   //bounderies for goal   
    }
    if (mouseX > 630 && y > 100  && mouseX < 1190 && y < 440){
      scorecounter = scorecounter + 1;
      
    }
    //resets score if goal posts are hit
    if (mouseX < 630 && y < 440){
     y = y+20;
     scorecounter = 0;
     
    }
    if (mouseX >1190 && y < 440){
      y = y+20;
    scorecounter = 0;
    
 }
 
  }
  
// goalie boundries
if (mouseX >  xgoalie &&mouseX <xgoalie+250 && y < 440){
  y = y+ 30;
  gscorecounter = gscorecounter+ 4;
 

}
if (scorecounter > 500){
  fill(255);
  textSize(200);
  stroke(0);
  text("You Win!",500 ,550 );
  scorecounter  = scorecounter + 0;
  gscorecounter = gscorecounter + 0;

}else if (gscorecounter > 500){
  fill(255);
  stroke(0);
  textSize(200);
  text("You Lost!", 500, 550);
  gscorecounter = gscorecounter+0;
  scorecounter = scorecounter+0;
  
}
  
}

void keyPressed(){
scorecounter = 0;
gscorecounter = 0;

}



void mousePressed() {
  y = mouseY;
  
}
