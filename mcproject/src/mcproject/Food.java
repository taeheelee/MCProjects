package mcproject;

public class Food {
	private String foodName = null;
	private int foodPrice = 0;
	
	public Food(String foodName, int foodPrice) {
		this.foodName = foodName;
		this.foodPrice = foodPrice;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	@Override
	public String toString() {
		return foodName + " : " + foodPrice;
	}
}