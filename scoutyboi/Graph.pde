import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;

import processing.core.PApplet;
import processing.data.TableRow;

public class Graph {
  private ArrayList<Team> teams;
  private ArrayList<Float> printingValues;
  private Method method;
  private float scale = 0;
  private float barWidth = 0;
  private Utility util = new Utility();
  private PFont p;

  public Graph(ArrayList<Team> t, Method method) {// reflection only works with a method that returns an float
    teams = t;
    this.method = method;
    setPrintingValues();
    //println(teams.size() + " teams size pre sort");
    //teams = util.sortBySize(teams, method);
    //System.out.println(printingValues.size() + " Prfloating Values Size");
    scale = (Utility.WINDOW_HEIGHT - 300) / util.largestValue(printingValues);
    //println(teams.size() + " teams size post sort");
    barWidth = Utility.WINDOW_WIDTH / printingValues.size();
  }

  public void update() {
  }

  public void render() {
    try {
      fill(255);
      for (int i = 0; i < printingValues.size() - 1; i++) {
        p = createFont("Arial", barWidth/3);
        textFont(p);
        String s = method.invoke(teams.get(i)).toString().substring(0, 3);  
        String teamNum = teams.get(i).getTeamNum().toString().substring(0, teams.get(i).getSigDigs());
        rect((barWidth * i) + 1, Utility.BAR_START - ((Float)method.invoke(teams.get(i)) * scale), barWidth - 2, printingValues.get(i) * scale);
        text(teamNum, (barWidth * i) + barWidth/2, Utility.BAR_START);
        text(s, (barWidth * i) + barWidth/2, Utility.BAR_START - ((Float)method.invoke(teams.get(i)) * scale)- 16);
      }
      p = createFont("Arial", 60);
      textFont(p);
      textAlign(CENTER, TOP);

      text(method.getName(), width/2, 80);
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  public void setPrintingValues() {
    printingValues = new ArrayList<Float>();
    for (int i = 0; i < teams.size() - 1; i++) {
      try {
        printingValues.add((Float) method.invoke(teams.get(i)));
      } 
      catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}