package mcproject;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Restaurant implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 328765108652874254L;
	private String restName = null;
	private String restNumber = null;
	private String restAddress = null;
	private String restCategory = null;
	private List<Food> menu = null;
	
	public Restaurant() {
		menu = new ArrayList<Food>();
	}

	public Restaurant(String restName, String restNumber, String restAddress, String restCategory, List<Food> menu) {
		super();
		this.restName = restName;
		this.restNumber = restNumber;
		this.restAddress = restAddress;
		this.restCategory = restCategory;
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "가게 이름 = " + restName + "\n주소 = " + restAddress + "\n전화번호 = " + restNumber
				+ " 음식 종류= " + restCategory + "\n메뉴 = " + menu;
	}

	public String getRestCategory() {
		return restCategory;
	}

	public void setRestCategory(String restCategory) {
		this.restCategory = restCategory;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getRestAddress() {
		return restAddress;
	}

	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}

	public String getRestNumber() {
		return restNumber;
	}

	public void setRestNumber(String restNumber) {
		this.restNumber = restNumber;
	}

	public List<Food> getMenu() {
		return menu;
	}

	public void setMenu(List<Food> menu) {
		this.menu = menu;
	}

}

