package practice;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;

public class Recipe implements Serializable{
	String name;
	String way_to_cook;
	int equal_num_food;

	ArrayList<Food> food;
	
	public Recipe() {
		food = new ArrayList<Food>();
		name = new String();
		way_to_cook = new String();
		equal_num_food = 0;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "레시피: " + name + ", 방법: " + way_to_cook;
	}
}
