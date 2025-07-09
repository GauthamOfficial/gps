float angle = 0;
float speed = 0.02;
float radius = 100;

color[] palette1;
color[] palette2;
color[] currentPalette;
color[] shapeColors;


boolean paletteToggle = false;

void setup(){
  size(800, 600);
  frameRate(60);
  
  palette1 = new color[] {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
  palette2 = new color[] {color(255, 255, 0), color(255, 0, 255), color(0, 255, 255)};
  
  currentPalette = palette1;
  shapeColors = new color[12];
  
  assignColors();
}

void draw(){
  background(0);
  radius = map(mouseX, 0, width, 50, 250);
  speed = map(mouseY, 0, height, 0.01, 0.1);
  
  angle += speed;
  translate(width/2, height/2);
  int numShapes = 12;
  
  for(int i = 0; i < numShapes; i++){
    pushMatrix();
    rotate(TWO_PI / numShapes * i + angle);
    drawpattern(i);
    popMatrix();
  }
}

void drawpattern(int index){
  fill(shapeColors[index]);
  ellipse(radius, 0, 50, 50);
}

void assignColors(){
  for(int i = 0; i < shapeColors.length; i++){
    shapeColors[i] = currentPalette[int(random(currentPalette.length))];
  }
}

void keyPressed(){
  if(key == 'c' || key == 'C'){
    paletteToggle = !paletteToggle;
    if(paletteToggle){
      currentPalette = palette2;
    } else{
      currentPalette = palette1;
    }
    assignColors();
  }
  
  if(key == 's' || key == 'S'){
    saveFrame("Snap" + timestamp() + ".png");
  }
}

String timestamp(){
  return "_" + year() + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
}
