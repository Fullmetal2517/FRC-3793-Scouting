package core;

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
	
		graphs.add(new Graph(teams, Team.class.getMethod("averageTotalCargo")));
		
	}

	public void update() {

	}

	public void render() {
		graphs.get(0).render();
	}

	public void initializeTeams() {
		for (TableRow row : dataTable.rows()) {
			int tempTeamNum = row.getInt("Team Number");
			boolean alreadyIn = false;
			for (int i = 0; i < teams.size(); i++) {
				if (teams.get(i) != null) {
					Team t = teams.get(i);
					if (t.getTeamNum() == tempTeamNum) {
						alreadyIn = true;
					}
				}
			}
			if (!alreadyIn) {
				teams.add(new Team(tempTeamNum, dataTable));
			}
		}
	}
}
