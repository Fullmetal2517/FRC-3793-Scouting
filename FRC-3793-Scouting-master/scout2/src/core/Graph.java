package core;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;

import processing.core.PApplet;
import processing.data.TableRow;

public class Graph {
	private ArrayList<Team> teams;
	private ArrayList<Integer> printingValues;
	private Method method;
	private PApplet pApplet;
	private int scale = 0;
	private int barWidth = 0;

	public Graph(ArrayList<Team> t, Method method) {// reflection only works with a method that returns an int
		teams = t;
		this.method = method;
		setPrintingValues();
		teams = Utility.sortBySize(teams, method);
		System.out.println(printingValues.size());
		scale = (Utility.WINDOW_HEIGHT - 200) / printingValues.get(0);
		barWidth = Utility.WINDOW_WIDTH / teams.size();
		pApplet = new PApplet();
	}

	public void update() {

	}

	public void render() {
		pApplet.fill(255);
		for (int i = 0; i < printingValues.size() - 1; i++) {
			pApplet.rect((barWidth * i) + 1, Utility.BAR_START - (printingValues.get(i) * scale), barWidth - 2,
					printingValues.get(i) * scale);
		}
	}

	public void setPrintingValues() {
		printingValues = new ArrayList<Integer>();
		for (int i = 0; i < teams.size() - 1; i++) {
			try {
				System.out.println(method.invoke(teams.get(i)) + " invoked method");
				printingValues.add((Integer) method.invoke(teams.get(i)));
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
	}
}
