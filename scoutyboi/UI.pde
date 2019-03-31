import java.lang.reflect.Method;
import java.util.ArrayList;
import processing.data.Table;
import processing.data.TableRow;

//displays everything and switches between graphs
public class UI {
  private ArrayList<Graph> graphs;
  private ArrayList<Team> teams;
  private Table dataTable;
  private int graphDisplay = 0;

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
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageTotalHatch")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageTotalPofloats")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageHabStart")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageHabEnd")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageShipCargo")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageShipHatch")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageRocketCargo")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageRocketHatch")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageDroppedCargo")));
      graphs.add(new Graph(teams, teams.get(0).getClass().getMethod("averageDroppedHatch")));
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void update() {
  }

  public void render() {
    graphs.get(graphDisplay).render();
    if (keyPressed) {
      if (key == '0') {
        graphDisplay = 0;
      } else if (key == '1') {
        graphDisplay = 1;
      } else if (key == '2') {
        graphDisplay = 2;
      } else if (key == '3') {
        graphDisplay = 3;
      } else if (key == '4') {
        graphDisplay = 4;
      } else if (key == '5') {
        graphDisplay = 5;
      } else if (key == '6') {
        graphDisplay = 6;
      } else if (key == '7') {
        graphDisplay = 7;
      } else if (key == '8') {
        graphDisplay = 8;
      } else if (key == '9') {
        graphDisplay = 9;
      } else if (key == 'a') {
        graphDisplay = 10;
      }
    }
  }

  public void initializeTeams() {
    for (int i = 0; i < dataTable.getRowCount(); i++) {
      TableRow row = dataTable.getRow(i);
      boolean alreadyIn = false;
      int tempTeamNum = row.getInt("Team Number");

      for (int j = 0; j<teams.size()-1; j++) {
        if (teams.get(j).getTeamNum() == tempTeamNum) {
          alreadyIn = true;
        }
      }

      if (!alreadyIn) {
        teams.add(new Team(tempTeamNum, dataTable));
        alreadyIn = false;
      }
    }
    for (int i = 0; i < teams.size()-1; i++) {
      float checkNum = teams.get(i).getTeamNum();
      for (int j = 0; j<teams.size()-1; j++) {
        float checkNum2 = teams.get(j).getTeamNum();
        if (i != j && checkNum == checkNum2) {
          teams.remove(j);
        }
      }
    }
  }
}