import java.util.ArrayList;

import processing.data.Table;
import processing.data.TableRow;

public class Team {
  private int teamNum;
  private int sigDigs;
  private Table dataTable;
  private ArrayList<Float> rowNumbers;
  private ArrayList<Float> habStart;
  private ArrayList<Float> habEnd;
  private ArrayList<Float> shipCargo;
  private ArrayList<Float> rocketCargo;
  private ArrayList<Float> shipHatch;
  private ArrayList<Float> rocketHatch;
  private ArrayList<Float> droppedCargo;
  private ArrayList<Float> droppedHatch;
  private ArrayList<Float> totalCargo;
  private ArrayList<Float> totalHatch;
  private ArrayList<Float> totalPointsWithoutHab;
  private ArrayList<Float> totalPoints;
  private Utility util = new Utility();

  public Team(Integer teamNum, Table dataTable) {
    sigDigs = teamNum.toString().length();
    this.setTeamNum(teamNum);
    this.dataTable = dataTable;
    rowNumbers = new ArrayList<Float>();
    habStart = new ArrayList<Float>();
    habEnd = new ArrayList<Float>();
    shipCargo = new ArrayList<Float>();
    rocketCargo = new ArrayList<Float>();
    shipHatch = new ArrayList<Float>();
    rocketHatch = new ArrayList<Float>();
    totalCargo = new ArrayList<Float>();
    droppedHatch = new ArrayList<Float>();
    droppedCargo = new ArrayList<Float>();
    totalHatch = new ArrayList<Float>();
    totalPointsWithoutHab = new ArrayList<Float>();
    totalPoints = new ArrayList<Float>();
    setData();
  }

  public void setData() {
    for (TableRow row : dataTable.rows()) {
      float tempTeamNum = row.getInt("Team Number");
      float tempHabStart = row.getInt("Starting Platform");
      float tempHabEnd = row.getInt("HAB Level");
      float tempShipCargo = row.getInt("Ship Cargo");
      float tempRocketCargo = row.getInt("Rocket Cargo");
      float tempShipHatch = row.getInt("Ship Hatch");
      float tempRocketHatch = row.getInt("Rocket Hatch");
      float tempDroppedCargo = row.getInt("Dropped Cargo");
      float tempDroppedHatch = row.getInt("Dropped Hatch");

      if (tempTeamNum == getTeamNum()) {
        habStart.add(tempHabStart);
        habEnd.add(tempHabEnd);
        shipCargo.add(tempShipCargo);
        shipHatch.add(tempShipHatch);
        rocketCargo.add(tempRocketCargo);
        rocketHatch.add(tempRocketHatch);
        droppedCargo.add(tempDroppedCargo);
        droppedHatch.add(tempDroppedHatch);
        totalCargo.add(shipCargo.get(shipCargo.size() - 1) + rocketCargo.get(rocketCargo.size() - 1));
        totalHatch.add(shipHatch.get(shipHatch.size() - 1) + rocketHatch.get(rocketHatch.size() - 1));
        totalPointsWithoutHab.add(totalCargo.get(totalCargo.size() - 1) * 3 + totalHatch.get(totalHatch.size() - 1) * 2);
        if(tempHabEnd == 3){
         totalPoints.add(totalCargo.get(totalCargo.size() - 1) * 3 + totalHatch.get(totalHatch.size() - 1) * 2 + tempHabStart * 3 + 12);
        }else{
         totalPoints.add(totalCargo.get(totalCargo.size() - 1) * 3 + totalHatch.get(totalHatch.size() - 1) * 2 + tempHabStart * 3 + tempHabEnd * 3);          
        }
      }
    }
  }

  public Float averageHabStart() {
    return util.averageValue(habStart);
  }

  public Float averageTotalCargo() {
    return util.averageValue(totalCargo);
  }

  public Float averageTotalPointsWithoutHab() {
    return util.averageValue(totalPointsWithoutHab);
  }
  
  public Float averageTotalPoints(){
   return util.averageValue(totalPoints); 
  }
  
   public Float averageHabEnd() {
    return util.averageValue(habEnd);
  }

  public Float averageShipCargo() {
    return util.averageValue(shipCargo);
  }

  public Float averageShipHatch() {
    return util.averageValue(shipHatch);
  }
  
   public Float averageRocketCargo() {
    return util.averageValue(rocketCargo);
  }

  public Float averageRocketHatch() {
    return util.averageValue(rocketHatch);
  }

  public Float averageDroppedCargo() {
    return util.averageValue(droppedCargo);
  }
  
   public Float averageDroppedHatch() {
    return util.averageValue(droppedHatch);
  }

  public Float averageTotalHatch() {
    return util.averageValue(totalHatch);
  }

  public Integer getTeamNum() {
    return teamNum;
  }
  
  public int getSigDigs(){
    return sigDigs;
  }

  public void setTeamNum(int teamNum) {
    this.teamNum = teamNum;
  }
}