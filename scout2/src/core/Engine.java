package core;

import processing.data.Table;

//sets up the table, sorts the data and runs the UI
public class Engine {
	private UI menu;
	private Table table;

	public Engine(Table table) {
		this.table = table;
		menu = new UI(table);
	}

	public void update() {
		menu.update();
	}

	public void render() {
		menu.render();
	}
}
