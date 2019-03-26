package core;

import processing.core.PApplet;
import processing.data.Table;

public class TableSetup extends PApplet {
	Table t;

	public TableSetup(Table t) {
		PApplet.main("TableSetup");
		this.t = t;
	}

	public void setup() {
		t = loadTable("scouting.csv", "header");
	}

}
