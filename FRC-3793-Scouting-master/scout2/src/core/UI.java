package core;

import java.lang.reflect.Method;
import java.util.ArrayList;
import processing.data.Table;
import processing.data.TableRow;

//displays everything and switches between graphs
public class UI {
	private ArrayList<Graph> graphs;
	private ArrayList<Team> teams;
	private Table dataTable;

	public UI(Table dataTable) {
		graphs = new ArrayList<Graph>();
		teams = new ArrayList<Team>();
		this.dataTable = dataTable;
		initializeTeams();
		initializeGraph();
	}

	public void initializeGraph() {
		try {
			graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageTotalCargo")));
			System.out.println(graphs.size());
		} catch (Exception e) {
			System.out.println("I'm really feeling it");
			System.out.println(e.getClass() + " Mildly suicidal");
			e.printStackTrace();
		}

	}

	public void update() {

	}

	public void render() {
		graphs.get(0).render();
	}

	public void initializeTeams() {
		System.out.println(dataTable.getRowCount() + " row count");
		for (int i = 0; i < dataTable.getRowCount(); i++) {
			TableRow row = dataTable.getRow(i);
			int tempTeamNum = row.getInt("Team Number");
			teams.add(new Team(tempTeamNum, dataTable));
		}
		System.out.println(teams.size() + " team size 1");

		for (int i = 0; i < teams.size() - 1; i++) {
			for (int j = 0; j < teams.size() - 1; j++) {
				if (i != j && teams.get(i).getTeamNum() == teams.get(j).getTeamNum()) {
					teams.remove(teams.get(j));
				}
			}
		}

		System.out.println(teams.size() + " teamsize2");
	}
}
