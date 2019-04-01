import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class Utility {
  public static final float WINDOW_WIDTH = 1920;
  public static final float WINDOW_HEIGHT = 1080;
  public static final float BAR_START = WINDOW_HEIGHT - 100;
  public static final float TARGET_FRAME_RATE = 60;

  public float averageValue(ArrayList<Float> a) {
    float average = 0;
    for (int i = 0; i < a.size() - 1; i++) {
      float b = a.get(i);
      average += b;
    }
    return average / a.size();
  }

  public Float largestValue(ArrayList<Float> a) {
    float largest = 0;
    for (int i = 0; i < a.size() - 1; i++) {
      if (largest < a.get(i)) {
        largest = a.get(i);
      }
    }

    return largest;
  }

  public ArrayList<Team> sortBySize(ArrayList<Team> t, Method method) { // sorts through an arraylist by the indicated method size, which must return an float
    ArrayList<Team> temp = t;
    Team biggestTeam = temp.get(0);
    ArrayList<Team> sorted = new ArrayList<Team>();

    for (int i = 0; i < temp.size() - 1; i++) {
      for (int j = 0; j < temp.size()-1; j++) {
        try {
          if ((Float) method.invoke(temp.get(j)) > (Float) method.invoke(biggestTeam)) {
            biggestTeam = temp.get(j);
          }
        } 
        catch (Exception e) {
          e.printStackTrace();
        }
      }
      sorted.add(biggestTeam);
      temp.remove(biggestTeam);
      biggestTeam = temp.get(0);
    }
    return sorted;
  }

  public ArrayList<Float> sortBySize(ArrayList<Float> a) {
    ArrayList<Float> temp = new ArrayList<Float>();
    float big = 0;
    ArrayList<Float> sorted = new ArrayList<Float>();
    for (int i = 0; i < temp.size() - 1; i++) {
      for (int j = 0; j < temp.size() - 1; j++) {
        if (big < a.get(i)) {
          big = a.get(i);
        }
      }

      temp.remove(big);
      sorted.add(big);
      big = 0;
    }
    return sorted;
  }
}