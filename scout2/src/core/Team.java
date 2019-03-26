package core;

import java.util.ArrayList;

import processing.data.Table;
import processing.data.TableRow;

public class Team {
	private int teamNum;
	private Table dataTable;
	private ArrayList<Integer> rowNumbers;
	private ArrayList<Integer> habStart;
	private ArrayList<Integer> habEnd;
	private ArrayList<Integer> shipCargo;
	private ArrayList<Integer> rocketCargo;
	private ArrayList<Integer> shipHatch;
	private ArrayList<Integer> rocketHatch;
	private ArrayList<Integer> droppedCargo;
	private ArrayList<Integer> droppedHatch;
	private ArrayList<Integer> totalCargo;
	private ArrayList<Integer> totalHatch;
	private ArrayList<Integer> totalPoints;

	public Team(int teamNum, Table dataTable) {
		this.setTeamNum(teamNum);
		this.dataTable = dataTable;
		rowNumbers = new ArrayList<Integer>();
		habStart = new ArrayList<Integer>();
		habEnd = new ArrayList<Integer>();
		shipCargo = new ArrayList<Integer>();
		rocketCargo = new ArrayList<Integer>();
		shipHatch = new ArrayList<Integer>();
		rocketHatch = new ArrayList<Integer>();
		totalCargo = new ArrayList<Integer>();
		droppedHatch = new ArrayList<Integer>();
		droppedCargo = new ArrayList<Integer>();
		totalHatch = new ArrayList<Integer>();
		totalPoints = new ArrayList<Integer>();
		setData();
	}

	public void setData() {
		for (TableRow row : dataTable.rows()) {
			int tempTeamNum = row.getInt("Team Number");
			int tempHabStart = row.getInt("Starting Platform");
			int tempHabEnd = row.getInt("HAB Level");
			int tempShipCargo = row.getInt("Ship Cargo");
			int tempRocketCargo = row.getInt("Rocket Cargo");
			int tempShipHatch = row.getInt("Ship Hatch");
			int tempRocketHatch = row.getInt("Rocket Hatch");
			int tempDroppedCargo = row.getInt("Dropped Cargo");
			int tempDroppedHatch = row.getInt("Dropped Hatch");

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
				totalPoints.add(totalCargo.get(totalCargo.size() - 1) * 3 + totalHatch.get(totalHatch.size() - 1) * 2);
			}
		}
	}

	public int averageHabStart() {
		return Utility.averageValue(habStart);
	}

	public Integer averageTotalCargo() {
		return Utility.averageValue(totalCargo);
	}

	public int getTeamNum() {
		return teamNum;
	}

	public void setTeamNum(int teamNum) {
		this.teamNum = teamNum;
	}

}
