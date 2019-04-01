import java.lang.reflect.Method;
import java.util.ArrayList;
import processing.data.Table;
import processing.data.TableRow;

//displays everything and switches between graphs
public class UI {
  private ArrayList<CategoryGraph> categoryGraphs;
  private ArrayList<TeamGraph> teamGraphs;
  private ArrayList<Team> teams;
  private Table dataTable;
  private int categoryGraphDisplay = 0;
  private int teamGraphDisplay = 0;
  private PImage sky;
  private PFont p;
  private int cycleTimer = 0;
  private int mouseTimer = 0;

  public UI(Table dataTable) {
    sky = loadImage("sky.png");
    categoryGraphs = new ArrayList<CategoryGraph>();
    teamGraphs = new ArrayList<TeamGraph>();
    teams = new ArrayList<Team>();
    this.dataTable = dataTable;
    initializeTeams();
    initializeGraph();
  }

  public void initializeGraph() {
    try {
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageTotalCargo")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageTotalHatch")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageTotalPointsWithoutHab")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageTotalPoints")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageHabStart")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageHabEnd")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageShipCargo")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageShipHatch")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageRocketCargo")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageRocketHatch")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageDroppedCargo")));
      categoryGraphs.add(new CategoryGraph(teams, teams.get(0).getClass().getMethod("averageDroppedHatch")));

      for (int i = 0; i < teams.size()-1; i++) {
        teamGraphs.add(new TeamGraph(teams.get(i)));
      }
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void update() {
    if (keyPressed && key == ' ' && cycleTimer == 0) {
      cycleTimer = 10;
      if(gameState == "category graphs"){
      if (categoryGraphDisplay < categoryGraphs.size()-1) {
        categoryGraphDisplay++;
      } else {
        categoryGraphDisplay = 0;
      }
      }else if(gameState == "team graphs"){
        if (teamGraphDisplay < teamGraphs.size()-1) {
        teamGraphDisplay++;
      } else {
        teamGraphDisplay = 0;
      }
      }
    }

    if (cycleTimer > 0) {
      cycleTimer--;
    }

    if (mouseTimer > 0) {
      mouseTimer--;
    }
    if (gameState == "main menu") {
      mainMenu();
    } else if (gameState == "category graphs menu") {
      categoryGraphsMenu();
    } else if (gameState == "category graphs") {
      categoryGraphs.get(categoryGraphDisplay).update();
    } else if (gameState == "team graphs menu") {
      teamGraphsMenu();
    } else if (gameState == "team graphs") {
      teamGraphs.get(teamGraphDisplay).update();
    }

    if (mousePressed && mouseX > width-450 && mouseY < 45) {
      gameState = "main menu";
    }
  }

  public void render() {
    image(sky, 0, 0);    
    if (gameState == "main menu") {
      displayMainMenu();
    } else if (gameState == "category graphs menu") {
      displayCategoryGraphsMenu();
    } else if (gameState == "team graphs menu") {
      displayTeamGraphsMenu();
    } else if (gameState == "category graphs") {
      categoryGraphs.get(categoryGraphDisplay).render();
    } else if (gameState == "team graphs") {
      teamGraphs.get(teamGraphDisplay).render();
    }
    if (gameState != "main menu") {
      p = createFont("Arial", 45);
      textFont(p);
      textAlign(LEFT,TOP);
      text("Return to Main Menu", width-450, 0);
    }

  }

  public void displayMainMenu() {
    fill(0, 255, 0);
    p = createFont("Arial", 120);
    textFont(p);
    textAlign(LEFT, TOP);
    text("Scouting", width/2 - 240, 0);
    p = createFont("Arial", 50);
    textFont(p);
    textAlign(CENTER, TOP);
    text("Category Graphs", width/3, height/2-100);
    text("Team Graphs", 2*width/3, height/2-100);
  }

  public void displayCategoryGraphsMenu() {
    p = createFont("Arial", 120);
    textFont(p);
    textAlign(LEFT, TOP);
    text("Category Graphs Menu", width/2-540, 0);
    p = createFont("Arial", 50);
    textFont(p);
    for (int i = 0; i < categoryGraphs.size()-1; i++) {
      text(categoryGraphs.get(i).method.getName().toString(), 300, 200 + 60 * i);
    }
  }

  public void categoryGraphsMenu() {
    if (mousePressed && mouseTimer == 0) {
      float x = mouseX;
      float y = mouseY;
      for (int i = 0; i < categoryGraphs.size() - 1; i++) {
        if (x > 300 && y > 200 + 60 * i && y < 200 + 80 * i + 50) {
          categoryGraphDisplay = i;
          gameState = "category graphs";
        }
      }
      mouseTimer = 10;
    }
  }

  public void displayTeamGraphsMenu() {
    p = createFont("Arial", 120);
    textFont(p);
    textAlign(LEFT, TOP);
    text("Team Graphs Menu", width/2-500, 0);
    p = createFont("Arial", 50);
    textFont(p);
    for (int i = 0; i<teams.size(); i++) {
        text(teams.get(i).getTeamNum(), 100 + 150 * (1 + (int) i / 8), 200 + 60 * (i%8));
    }
  }

  public void teamGraphsMenu() {
    if(mousePressed && mouseTimer == 0){
      mouseTimer = 10;
      for (int i = 0; i<teams.size(); i++) {
        if(mouseX > 100 + 150 * (1+(int) i/8) && mouseX < 200 + 150 * (1+(int) i/8) && mouseY > 200 + 60 * (i%8) && mouseY <250 + 60 *(i%8)){
        teamGraphDisplay = i;
        gameState = "team graphs";
        }
    }
    }
  }

  public void mainMenu() {
    if (mousePressed && mouseTimer == 0 && mouseX > 450 && mouseX < 830 && mouseY > 450 && mouseY < 500) {
      gameState = "category graphs menu";
      mouseTimer =10;
    } else if (mousePressed && mouseTimer == 0 && mouseX > 1140 && mouseX < 1430 && mouseY > 450 && mouseY < 500) {
      gameState = "team graphs menu";
      mouseTimer = 10;
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