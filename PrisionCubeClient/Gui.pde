import controlP5.*;
import java.util.*;

ControlP5 cp5;

boolean guiToggle;

boolean play;
int playBackSpeed;
int resolution;

boolean displayPoint;

Slider2D offsetSlider2D;
float offsetX = 0;
float offsetZ = -500;

int lifeSpan;
int particleSize;

Slider2D directionSlider2D;
float directionX = 0;
float directionY = 0;
float directionZ = 0;


void setupGui() {
  guiToggle = true;

  int sliderW = 100;
  int sliderH = 15;
  int startX = 10;
  int startY = 35;
  int spacing = 20;

  cp5 = new ControlP5( this );

  cp5.addSlider("resolution")
    .setPosition(startX, startY+spacing*3)
    .setSize(sliderW, sliderH)
    .setRange(1, 10)
    .setValue(10)
    ;
  cp5.addSlider("playBackSpeed")
    .setPosition(startX, startY+spacing*4)
    .setSize(sliderW, sliderH)
    .setRange(1, 5)
    .setValue(1)
    ;


  offsetSlider2D = cp5.addSlider2D("offset")
    .setPosition(startX, startY+spacing*8)
    .setSize(sliderW, sliderW)
    .setMinMax(-1000, -1000, 1000, 1000)
    .setValue(0, 0)
    ;

  cp5.addToggle("play")
    .setPosition(startX, startY+spacing*15)
    .setSize(sliderW, sliderH)
    .setValue(false)
    ;
  cp5.addToggle("displayPoint")
    .setPosition(startX, startY+spacing*17)
    .setSize(sliderW, sliderH)
    .setValue(true)
    ;
  cp5.addSlider("lifeSpan")
    .setPosition(startX, startY+spacing*19)
    .setSize(sliderW, sliderH)
    .setRange(2, 20)
    .setValue(8)
    ;
  cp5.addSlider("particleSize")
    .setPosition(startX, startY+spacing*20)
    .setSize(sliderW, sliderH)
    .setRange(1, 10)
    .setValue(2)
    ;
 

  directionSlider2D = cp5.addSlider2D("wind")
    .setPosition(startX, startY+spacing*32)
    .setSize(sliderW, sliderW)
    .setMinMax(-10, -10, 10, 10)
    .setValue(0, 0)
    ;
  cp5.addSlider("directionY")
    .setPosition(startX + 120, startY+spacing*32)
    .setSize(sliderH, sliderW)
    .setRange(-10, 10)
    .setValue(0)
    ;


  cp5.setAutoDraw(false);
}

void drawGui() {
 
  offsetX = offsetSlider2D.getArrayValue()[0];
  offsetZ = offsetSlider2D.getArrayValue()[1];
  directionX = directionSlider2D.getArrayValue()[0];
  directionZ = directionSlider2D.getArrayValue()[1];

  // draw GUI and DepthImage
  hint(DISABLE_DEPTH_TEST);

  pushStyle();
  fill(255);
  cp5.draw();
  text(frameRate, 10, 20);
  popStyle();

  hint(ENABLE_DEPTH_TEST);
}