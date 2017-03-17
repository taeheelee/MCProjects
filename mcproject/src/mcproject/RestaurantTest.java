package mcproject;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;

public class RestaurantTest {
	private static ObjectInputStream in = null;
	private static ObjectOutputStream out = null;
	
	public static Scanner scan = new Scanner(System.in);
	public static List<Restaurant> restArray = new ArrayList<Restaurant>();
	
	public static void main(String[] args) {
		load();
		boolean run = true;

		while (run) {
			System.out.println("------------------------------------");
			System.out.println("1.음식 선택 | 2.식당 등록 | 3.식당 제거 | 4.식당 불러오기 | 5.식당 보여주기 | 6.종료");
			System.out.println("------------------------------------");
			System.out.print("선택 > ");
//수정해봄
			int selectNo = scan.nextInt();
			if (selectNo == 1) {
				selectFood();
			} else if (selectNo == 2) {
				createRestaurant();
			} else if (selectNo == 3) {
				//removeRestaurant();
			} else if (selectNo == 4) {
				loadRestaurant();
			} else if (selectNo == 5) {
				showRestaurantList();
			} else if (selectNo == 6) {
				save();
				run = false;
			}
		}
	}

	public static void selectFood() {

	}

	public static List mergeRest(Restaurant rest1, Restaurant rest2) {
		List<String> temp1 = new ArrayList<String>();
		for (Food s : rest1.getMenu()) {
			temp1.add(s.getFoodName());
		}
		for (Food s : rest2.getMenu()) {
			temp1.add(s.getFoodName());
		}
		List<String> temp2 = new ArrayList<String>(new HashSet<String>(temp1));
		return temp2;
	}

	
	//식당을 만드는 메소드.
	/*레스토랑(식당) 객체를 임시로 만들어 필드 값을 입력받는다.*/
	public static void createRestaurant() {
		Restaurant tempRest = new Restaurant();
		//임시로 레스토랑 객체 생성
		List<Food> menu = new ArrayList<Food>();
		int run = 1;
		
		//필드값 입력
		System.out.println("\n식당 등록\n");
		System.out.print("식당 이름  : ");
		tempRest.setRestName(scan.next());
		System.out.print("전화번호 : ");
		tempRest.setRestNumber(scan.next());
		System.out.print("주소 : ");
		tempRest.setRestAddress(scan.next());
		System.out.print("음식 분류 : ");
		tempRest.setRestCategory(scan.next());
		
		/*
		 * 레스토랑 객체에 음식들을 저장하는 필드가 있음
		 * 이 필드는 Food 객체를 저장하는 ArrayList임
		 * Food 객체 여러 개를 저장할 수 있어야 하므로
		 * while문으로 Food 객체 여러 개를 반복 입력받는다
		 * */
		
		while(run == 1) {
			System.out.println("입력 : 1, 멈춤 : 0");
			run = scan.nextInt();
			if(run == 0)
				break;
			String name;
			int price;
			System.out.print("음식 이름 : ");
			name = scan.next();
			System.out.print("음식 가격 : ");
			price = scan.nextInt();
			menu.add(new Food(name, price));
		}
		tempRest.setMenu(menu);
		/*
		 * 음식 목록을 레스토랑 객체에 저장하고
		 * 임시 레스토랑 객체인 tempRest를
		 * Restaurant를 저장하는 ArrayList인
		 * restArray에 저장한다*/
		restArray.add(tempRest);
		//System.out.println(tempRest);
	}
	
	private static void showRestaurantList() {
		System.out.println("------");
		System.out.println("식당 목록");
		System.out.println("------");

		for (Restaurant value : restArray) {
			if (value == null)
				break;
			System.out.println(value);
		}
	}

	public static void load() {
		try {
			in = new ObjectInputStream(new FileInputStream("RestaurantInfo.txt"));
			restArray = (List<Restaurant>) in.readObject();
		} catch (FileNotFoundException e) {
			System.out.println("파일이 존재하지 않습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("io 예외");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 형변환 예외");
			e.printStackTrace();
		} finally {
			try {
			if(in != null)
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void save() {
		try {
			out = new ObjectOutputStream(new FileOutputStream("RestaurantInfo.txt"));
			out.writeObject(restArray);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
				try {
					if(out != null)
						out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
	public static void loadRestaurant() {
		
		List<Food> koreaFood1 = new ArrayList<Food>();
		koreaFood1.add(new Food("김치찌개", 5000));
		koreaFood1.add(new Food("삼치구이", 7000));
		koreaFood1.add(new Food("순대국밥", 6000));
		koreaFood1.add(new Food("떡갈비", 9000));
		koreaFood1.add(new Food("된장찌개", 5000));
		
		List<Food> koreaFood2 = new ArrayList<Food>();
		koreaFood2.add(new Food("된장찌개", 4500));
		koreaFood2.add(new Food("김치찌개", 4000));
		koreaFood2.add(new Food("순두부찌개", 5000));
		koreaFood2.add(new Food("부대찌개", 6500));
		koreaFood2.add(new Food("고추장찌개", 5000));

		
		Restaurant korea1 = new Restaurant();
		korea1.setRestName("집밥백티쳐");
		korea1.setRestNumber("070-354-4561");
		korea1.setRestAddress("서울시 강남구 역삼동 4153");
		korea1.setRestCategory("한식");
		korea1.setMenu(koreaFood1);
		

		Restaurant korea2 = new Restaurant();
		korea2.setRestName("찌개마을");
		korea2.setRestNumber("070-413-456");
		korea2.setRestAddress("서울시 강남구 역삼동 44");
		korea2.setRestCategory("한식");
		korea2.setMenu(koreaFood2);
		
		restArray.add(korea1);
		restArray.add(korea2);
		
		
		
		// List<Food> chinaFood1 = new ArrayList<Food>();
		// List<Food> chinaFood2 = new ArrayList<Food>();
		//
		// List<Food> japanFood1 = new ArrayList<Food>();
		// List<Food> japanFood2 = new ArrayList<Food>();
		//
		// List<Food> westFood1 = new ArrayList<Food>();
		// List<Food> westFood2 = new ArrayList<Food>();
		//
		// List<Food> flourFood1 = new ArrayList<Food>();
		// List<Food> flourFood2 = new ArrayList<Food>();
		//
		//
		// List<Food> etcFood1 = new ArrayList<Food>();
		// List<Food> etcFood2 = new ArrayList<Food>();
		// Restaurant japan1 = new Restaurant();
		// Restaurant japan2 = new Restaurant();
		//
		// Restaurant flour1 = new Restaurant();
		// Restaurant flour2 = new Restaurant();
		//
		// Restaurant china1 = new Restaurant();
		// Restaurant china2 = new Restaurant();
		//
		// Restaurant west1 = new Restaurant();
		// Restaurant west2 = new Restaurant();
		//
		// Restaurant etc1 = new Restaurant();
		// Restaurant etc2 = new Restaurant();
		
	}
}
