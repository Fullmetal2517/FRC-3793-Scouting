public class TeamGraph extends Graph {
  Team myTeam;
  PFont p;
  public TeamGraph(Team t) {
    myTeam = t;
  }

  public void update() {
  }

  public void render() {
    p = createFont("Arial", 120);
    textFont(p);
    textAlign(CENTER,TOP);
    text(myTeam.getTeamNum(),width/2,0);
    p = createFont("Arial", 50);
    textFont(p);
    textAlign(LEFT,TOP);
    text ("Average Total Points: " + myTeam.averageTotalPoints(), 100, 180);
    text ("Average Total Points Without Hab: " + myTeam.averageTotalPointsWithoutHab(), 100, 240);
    text ("Average Total Cargo: " + myTeam.averageTotalCargo(), 100, 300);
    text ("Average Total Hatches: " + myTeam.averageTotalHatch(), 100, 360);
    text ("Average Ship Cargo: " + myTeam.averageShipCargo(), 100, 420);
    text ("Average Ship Hatches: " + myTeam.averageTotalCargo(), 100, 480);
    text ("Average Rocket Cargo: " + myTeam.averageRocketCargo(), 100, 540);
    text ("Average Rocket Hatches: " + myTeam.averageRocketHatch(), 100, 600);
    text ("Average Hab Start: " + myTeam.averageHabStart(), 100, 660);
    text ("Average Hab End: " + myTeam.averageHabEnd(), 100, 720);
    text ("Average Dropped Hatches: " + myTeam.averageDroppedHatch(), 100, 780);
    text ("Average Dropped Cargo: " + myTeam.averageDroppedCargo(), 100, 840);
  }
}