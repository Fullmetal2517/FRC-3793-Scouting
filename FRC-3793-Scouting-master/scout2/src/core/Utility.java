package core;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class Utility {
	public static final int WINDOW_WIDTH = 1920;
	public static final int WINDOW_HEIGHT = 1080;
	public static final int BAR_START = WINDOW_HEIGHT - 100;
	public static final int TARGET_FRAME_RATE = 60;

	public static int averageValue(ArrayList<Integer> a) {
		int average = 0;
		for (int i = 0; i < a.size() - 1; i++) {
			int b = a.get(i);
			average += b;
		}
		return average / a.size();
	}

	public static int largestValue(ArrayList<Integer> a) {
		int largest = 0;
			for (int i = 0; i < a.size() - 1; i++) {
				if (largest < a.get(i)) {
					largest = a.get(i);
				}
			}
		
		return largest;
	}

	public static ArrayList<Team> sortBySize(ArrayList<Team> t, Method method) { // sorts through an arraylist by the
																					// indicated method size, which must
																					// return an int
		ArrayList<Team> temp = t;
		Team biggestTeam = temp.get(0);
		ArrayList<Team> sorted = new ArrayList<Team>();
		
		for (int i = 0; i < temp.size() - 1; i++) {
			for (int j = 0; j < temp.size() - 1; j++) {
				try {
					if ((Integer) method.invoke(temp.get(i)) > (Integer) method.invoke(biggestTeam)) {
						biggestTeam = temp.get(i);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			temp.remove(biggestTeam);
			sorted.add(biggestTeam);
			biggestTeam = temp.get(0);
		}
		return sorted;
	}

	public static ArrayList<Integer> sortBySize(ArrayList<Integer> a) {
		ArrayList<Integer> temp = new ArrayList<Integer>();
		int big = 0;
		ArrayList<Integer> sorted = new ArrayList<Integer>();
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
