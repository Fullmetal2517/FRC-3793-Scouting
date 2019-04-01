import java.util.logging.Level;
import java.util.logging.Logger;
import processing.core.PApplet;
import processing.data.Table;

//initializes the project as a new slick gameand runs the engine

private Engine e;
private Table t;
String gameState = "main menu";


public void settings() {
  fullScreen();
}

public void setup() {
  t = loadTable("scouting.csv", "header");
  e = new Engine(t);
  background(0);
}

public void draw() {
  background(0);
  e.update();
  e.render();
}