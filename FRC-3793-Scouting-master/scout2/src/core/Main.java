package core;

import java.util.logging.Level;
import java.util.logging.Logger;
import processing.core.PApplet;
import processing.data.Table;

//initializes the project as a new slick gameand runs the engine
public class Main extends PApplet {
	private Engine e;
	private Table t;

	public static void main(String[] args) {
		PApplet.main("core.Main");
	}

	public void settings() {
		size(500, 500);
	}

	public void setup() {
		t = loadTable("scouting.csv", "header");
		e = new Engine(t);
		background(0);
	}

	public void draw() {
		e.render();
		background(0);
	}
}
