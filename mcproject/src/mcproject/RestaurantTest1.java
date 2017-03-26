package mcproject;

import java.util.*;

public class RestaurantTest1 {
	public static Scanner scan = new Scanner(System.in);
	public static List<Restaurant> restArray = new ArrayList<Restaurant>();
	public static List<Food> detailMenu = new ArrayList<Food>();
	
	public static void main(String[] args) {
		System.out.println("---------------------------------");
		System.out.println("| 1.사용자 | 2.관리자 |");
		System.out.println("---------------------------------");
		System.out.print("선택 > ");
		storage();

		boolean run = true;

		while (run) {
			int selectNo = scan.nextInt();
			if (selectNo == 1) {
				user();
			} else if (selectNo == 2) {
				admin();
			} else {
				run = false;
			}
		}
		System.out.println("---------------------");
		System.out.println("프로그램이 종료되었습니다. ");
		System.out.println("---------------------");

	}

	public static void user() {

		System.out.println("사용자 모드로 접속했습니다.");
		System.out.println("---------------------------------------------");
		System.out.println("| 1.한식 | 2.중식 | 3.일식 | 4.양식  | 5.분식  | 4.기타  |");
		System.out.println("---------------------------------------------");
		System.out.print("카테고리를 선택해주세요 > ");

		boolean run = true;
		while (run) {
			detailMenu = null;
			int selectNo = scan.nextInt();
			if (selectNo == 1) {
				System.out.println("TEST출력 [한식] 목록을 보여됴");
				detailMenu.addAll(mergeRestCategoryDetailMenu("한식"));
				selectFood();
			} else if (selectNo == 2) {
				System.out.println("TEST출력 [중식] 목록을 보여됴");
				detailMenu.addAll(mergeRestCategoryDetailMenu("중식"));
				selectFood();
			} else if (selectNo == 3) {
				System.out.println("TEST출력 [일식] 목록을 보여됴");
				detailMenu.addAll(mergeRestCategoryDetailMenu("일식"));
				selectFood();
			} else if (selectNo == 4) {
				System.out.println("TEST출력 [양식] 목록을 보여됴");
				detailMenu.addAll(mergeRestCategoryDetailMenu("양식"));
				selectFood();
			} else if (selectNo == 5) {
				System.out.println("TEST출력 [분식] 목록을 보여됴");
				detailMenu.addAll(mergeRestCategoryDetailMenu("분식"));
				selectFood();
			} else if (selectNo == 4) {
				System.out.println("TEST출력[기타] 목록을 보여됴");
				detailMenu.addAll(mergeRestCategoryDetailMenu("기타"));
				selectFood();
			} else {
				run = false;
			}
		}
	}

	public static void admin() {
		
		boolean run = true;
		while (run) {
			System.out.println("------------------------------------------------------");
			System.out.println("1.식당 정보 등록 | 2.식당 정보 수정(삭제) | 3.식당 정보 불러오기 |");
			System.out.println("4.종료               | 5.등록되어있는 모든 메뉴 불러오기 |");
			System.out.println("------------------------------------------------------");
			System.out.print("선택 > ");

			int selectNo = scan.nextInt();
			if (selectNo == 1) {
				createRestaurant();
			} else if (selectNo == 2) {
				modifyInformation();
			} else if (selectNo == 3) {
				loadRestaurant();
			} else if (selectNo == 4) {
				run = false;
			} else if (selectNo == 5) {
				mergeRest();
			} else {
				run = false;
			}
		}
		System.out.println("프로그램 종료?????????왜안될까");
	}
	//////////////////////////////////////////////////////////////////

	// 메뉴를 입력받아 그 메뉴가 속한 식당정보 출력
	public static void selectFood() {

		System.out.print("원하시는 메뉴를 입력해주세요 > ");
		String temp = scan.next();

		for (Restaurant r : restArray) {
			if (r.getMenu().contains(temp)) {
				r.toString();
				System.out.println();
			}
		}
	}

	// 선택한 카테고리에 속한 음식점들의 전체메뉴 중복없이 출력
	public static Set<Food> mergeRestCategoryDetailMenu(String k) {

		Set<Food> temp = new HashSet<Food>();

		for (int i = 0; i < restArray.size(); i++) {
			if (restArray.get(i).getRestCategory().equals(k)) {
				for (Food s : restArray.get(i).getMenu()) {
					temp.add(s);
				}
			}
		}
		System.out.println("중복제거 테스트 출력 : " + temp);
		return temp;
	}

	// 전체 식당의 전체메뉴를 중복없이 출력
	public static void mergeRest() {
		Set<String> temp = new HashSet<String>();
		for (int i = 0; i < restArray.size(); i++) {
			for (Food s : restArray.get(i).getMenu()) {
				temp.add(s.getFoodName());
			}
		}
		System.out.println(temp);
	}

	// 식당을 만드는 메소드.
	/* 레스토랑(식당) 객체를 임시로 만들어 필드 값을 입력받는다. */
	public static void createRestaurant() {
		Restaurant tempRest = new Restaurant();
		// 임시로 레스토랑 객체 생성
		List<Food> menu = new ArrayList<Food>();
		int run = 1;

		// 필드값 입력
		System.out.println("\n식당 등록\n");
		System.out.print("식당 이름  : ");
		tempRest.setRestName(scan.next());
		System.out.print("전화번호 : ");
		String tel;
		tel = scan.next();
		tempRest.setRestNumber(tel);
		// 가게가 있는지 확인하는거 (젼화번호로 확인,가게 이름은 같을 수 있다)
		for (int i = 0; i < restArray.size(); i++) {
			if (restArray.get(i).getRestNumber().equals(tel)) {
				System.out.println("이미 등록된 전화번호 입니다.");
				return;
			}
		}

		System.out.print("주소 : ");
		tempRest.setRestAddress(scan.next());
		System.out.print("음식 분류 : ");
		tempRest.setRestCategory(scan.next());

		/*
		 * 레스토랑 객체에 음식들을 저장하는 필드가 있음 이 필드는 Food 객체를 저장하는 ArrayList임 Food 객체 여러
		 * 개를 저장할 수 있어야 하므로 while문으로 Food 객체 여러 개를 반복 입력받는다
		 */

		while (run == 1) {
			System.out.println("메뉴 정보를 입력 : 1, 정보등록 완료 : 0");
			run = scan.nextInt();
			if (run == 0)
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
		 * 음식 목록을 레스토랑 객체에 저장하고 임시 레스토랑 객체인 tempRest를 Restaurant를 저장하는
		 * ArrayList인 restArray에 저장한다
		 */
		restArray.add(tempRest);
		System.out.println("식당 정보가 등록 되었습니다.");
		// System.out.println(tempRest);
	}

	public static void loadRestaurant() {

		System.out.println("-------------------------------------------------------------");
		System.out.println("등록된 식당목록 입니다.");
		System.out.println("-------------------------------------------------------------");
		for (int i = 0; i < restArray.size(); i++) {
			System.out.println(restArray.get(i));

		}

	}

	public static void modifyInformation() {
		String temp = null;
		while(true) {
			int num = 0;
			System.out.println("1.식당 정보변경 | 2.식당 삭제 ");
			num = scan.nextInt();

			if(num == 1) {
				System.out.println("식당 전화번호를 입력해주세요");
				temp = scan.next();
				for(int i = 0; i < restArray.size(); i++) {
					if(restArray.get(i).getRestNumber().equals(temp)) {
						System.out.println("식당 이름 : ");
						restArray.get(i).setRestName(scan.next());
						System.out.println("전화번호 :");
						restArray.get(i).setRestNumber(scan.next());
						System.out.println("식당 주소 :");
						restArray.get(i).setRestAddress(scan.next());
						System.out.println("식당 종류 :");
						restArray.get(i).setRestCategory(scan.next());
						System.out.println("메뉴 : ");
//						restArray.get(i).setMenu();
						int run = 1;
						while (true) {
							String name;
							int price;
							List<Food> tempFood = restArray.get(i).getMenu();
							System.out.println("등록 마감 : 0, 메뉴 추가 : 1, 메뉴 삭제 : 2");
							run = scan.nextInt();
							if (run == 0)
								break;
							else if (run == 1) {
								System.out.print("음식 이름 : ");
								name = scan.next();
								System.out.print("음식 가격 : ");
								price = scan.nextInt();
								tempFood.add(new Food(name, price));
							} else if (run == 2) {
								System.out.println("음식 이름 입력 :");
								name = scan.next();
								for(int j = 0; j < tempFood.size(); j++) {
									if(tempFood.get(i).getFoodName().equals(name))
										tempFood.remove(i);
								}
							} else
								break;
						}
//						tempRest.setMenu(menu);
					}
				}
				
			} else if(num == 2) {
				System.out.println("식당 전화번호를 입력해주세요");
				temp = scan.next();
				for(int i = 0; i < restArray.size(); i++) {
					if(restArray.get(i).getRestNumber().equals(temp)) {
						restArray.remove(i);
					}
				}
				
			} else
				break;
		}
		
	}

	public static void storage() {
		List<Food> koreaFood1 = new ArrayList<Food>();
		Restaurant korea1 = new Restaurant();
		korea1.setRestName("집밥백티쳐");
		korea1.setRestNumber("070-354-4561");
		korea1.setRestAddress("서울시 강남구 역삼동 4153");
		korea1.setRestCategory("한식");
		korea1.setMenu(koreaFood1);
		koreaFood1.add(new Food("김치찌개", 6000));
		koreaFood1.add(new Food("삼치구이", 8000));
		koreaFood1.add(new Food("순대국밥", 6000));
		koreaFood1.add(new Food("떡갈비", 7000));
		restArray.add(korea1);

		List<Food> koreaFood2 = new ArrayList<Food>();
		Restaurant korea2 = new Restaurant();
		korea2.setRestName("찌개마을");
		korea2.setRestNumber("070-413-456");
		korea2.setRestAddress("서울시 강남구 역삼동 44");
		korea2.setRestCategory("한식");
		korea2.setMenu(koreaFood2);
		koreaFood2.add(new Food("된장찌개", 6000));
		koreaFood2.add(new Food("김치찌개", 6000));
		koreaFood2.add(new Food("순두부찌개", 6000));
		koreaFood2.add(new Food("부대찌개", 6000));
		koreaFood2.add(new Food("고추장찌개", 6000));
		restArray.add(korea2);

		List<Food> koreaFood3 = new ArrayList<Food>();
		Restaurant korea3 = new Restaurant();
		korea3.setRestName("사보일레븐");
		korea3.setRestNumber("070-691-5884");
		korea3.setRestAddress("서울시 서초구 역삼동 32");
		korea3.setRestCategory("일식");
		korea3.setMenu(koreaFood3);
		koreaFood3.add(new Food("돈까스", 7000));
		koreaFood3.add(new Food("초밥", 10000));
		koreaFood3.add(new Food("우동", 6000));
		restArray.add(korea3);

	}

}