package practice;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;

public class Start {
	private static Scanner in = new Scanner(System.in);
	private static ArrayList<UserInfo> user_info;
	private static ArrayList<Recipe> recipe_list;
	
	public Start() {
		user_info = new ArrayList<UserInfo>();
		recipe_list = new ArrayList<Recipe>();
	}
	
	public Recipe CreateRecipe(){ return new Recipe(); }
	public UserInfo CreateUserInfo(){ return new UserInfo(); }
	public Food CreateFood(){ return new Food(); }
	
	public void Main() {
		int choice;
		boolean flag;
		
		loadRecipe();
		loadUser();
		
		System.out.println("레시피파인더\n*********\n1. 회원가입\n2. 로그인\n3. 끝내기\n*********");
		System.out.print("입력: ");
		
		flag = true;
		while (flag) {
			switch (in.nextInt()) {
			case 1: Join();	flag = false;	break;
			case 2: Login(); flag = false; break;
			case 3: saveRecipe(); saveUser(); Exit(); flag = false; break;
			default: System.out.println("다시 입력해주세요."); flag = true; Main();
			}
		}
	}
	
	static public void load(ArrayList ){
		
	}
	
	static public void loadRecipe(){
		ObjectInputStream in = null;

		try{
			in = new ObjectInputStream(new FileInputStream("userinfo.txt"));
			user_info = (ArrayList<UserInfo>) in.readObject();
		}catch (FileNotFoundException e) {
			// TODO: handle exception
			System.out.println("읽어올 파일이 없습니다.");
			user_info = new ArrayList<UserInfo>();
		}catch (IOException e) {
			// TODO: handle exception
			System.out.println("데이터를 불러오는데 실패했습니다.");
			user_info = new ArrayList<UserInfo>();
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
			System.out.println("데이터를 불러오는데 실패했습니다.");
			user_info = new ArrayList<UserInfo>();
		}finally {
			try{
				if(in != null) in.close();			
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	static public void loadUser(){
		ObjectInputStream in = null;

		try{
			in = new ObjectInputStream(new FileInputStream("userinfo.txt"));
			user_info = (ArrayList<UserInfo>) in.readObject();
		}catch (FileNotFoundException e) {
			// TODO: handle exception
			System.out.println("읽어올 파일이 없습니다.");
			user_info = new ArrayList<UserInfo>();
		}catch (IOException e) {
			// TODO: handle exception
			System.out.println("데이터를 불러오는데 실패했습니다.");
			user_info = new ArrayList<UserInfo>();
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
			System.out.println("데이터를 불러오는데 실패했습니다.");
			user_info = new ArrayList<UserInfo>();
		}finally {
			try{
				if(in != null) in.close();			
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	static public void saveRecipe(){
		ObjectOutputStream out = null;
		
		try{
			out = new ObjectOutputStream(new FileOutputStream("project.txt"));
			out.writeObject(recipe_list);
			out.flush();
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
				try {
					if(out != null) out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}
	
	static public void saveUser(){
		ObjectOutputStream out = null;
		
		try{
			out = new ObjectOutputStream(new FileOutputStream("project.txt"));
			out.writeObject(recipe_list);
			out.flush();
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
				try {
					if(out != null) out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}

	public void Login() {
		String user_id;
		String user_password;

		System.out.print("아이디: ");
		user_id = in.next();
		System.out.print("비밀번호: ");
		user_password = in.next();

		for (int i = 0; i < user_info.size(); i++) {
			UserInfo info = CreateUserInfo();
			info = user_info.get(i);
			if (info.getId().equals(user_id)) {
				if (info.getPassword().equals(user_password)) {
					System.out.println();
					System.out.println(info.getId() + "님, 환영합니다.");
					System.out.println();
					choice();
					return;
				}
			}
		}
		
		System.out.println();
		System.out.println("해당하는 아이디나 패스워드가 존재하지 않습니다.");
		System.out.println();
		
		Main();
	}

	public void Join() {
		String user_id;
		String user_password;
		int input;
		
		System.out.print("id 중복확인: ");
		user_id = in.next();

		for (int i = 0; i < user_info.size(); i++) {
			if (user_info.get(i).getId().equals(user_id)) {
				System.out.println("이미 존재하는 아이디입니다.");
				System.out.println("1. 나가기 / 2. 계속하기");
				int choice = in.nextInt();
				if(choice == 1){
					System.exit(0);
				}else if(choice == 2){
					Join();
				}else{
					System.out.println("숫자를 다시 입력해주세요.");
				}
			}
		}

		System.out.print("사용가능한 아이디입니다. 사용하시겠습니까? 1. 예 / 2. 아니오 / 3. 나가기 ");
		input = in.nextInt();

		if (input == 1) {
			System.out.print("비밀번호를 입력해주세요: ");
			user_password = in.next();

			UserInfo info = CreateUserInfo();
			info.setId(user_id);
			info.setPassword(user_password);
			
			user_info.add(info);
			System.out.println();
			System.out.println("가입이 완료되었습니다.");
			System.out.println();
			
			Main();
		} else if (input == 2) {
			Join();
		} else if(input == 3) {
			System.exit(0);
		} else {
			System.out.println("잘못입력하셨습니다.");
			Join();
		}
	}

	public void choice() {
		int input;
			
		System.out.println("*********\n1. 레시피목록\n2. 레시피추가\n3. 레시피검색\n4. 레시피수정\n5. 레시피삭제\n6.뒤로가기\n*********");
		System.out.print("입력: ");
		input = in.nextInt();
		if (input == 1) {
			listRecipe();
		} else if (input == 2) {
			addRecipe();
		} else if (input == 3) {
			search();
		} else if(input == 4){
			modifyRecipe();
		} else if(input == 5){
			deleteRecipe();
		} else if(input == 6){
			Main();
		}else {
			System.out.println("잘못입력하셨습니다.");
		}
		choice();
	}

	public void listRecipe(){
		int idx = 1;
		for(Recipe r : recipe_list){
			System.out.println(idx + ". " + r.name);
			idx++;
		}
		System.out.println();
	}
	
	public void modifyRecipe() {
		System.out.println("수정하고자 하는 레시피를 검색하세요.");
		listRecipe();
		
		System.out.print("입력: ");
		int recipe_index = in.nextInt()-1;
		String str;

		Recipe recipe = recipe_list.get(recipe_index);
		ArrayList<Food> food_list = new ArrayList<Food>();
		Food food = new Food();
		food_list = recipe.food;
		
		System.out.println("--------------------------------------------------------------");
		System.out.print("레시피이름: " + recipe.name);
		System.out.print("\n재료 : ");
		for(Food f : food_list) System.out.print(f.name + " ");
		System.out.print("\n조리방법: " + recipe.way_to_cook);
		System.out.println("--------------------------------------------------------------\n");
		System.out.println("1. 레시피이름수정\n2. 재료추가\n3. 재료삭제\n4. 조리방법수정\n입력: ");
		
		switch (in.nextInt()) {
		case 1: 
			System.out.print("수정할 이름: ");
			recipe.name = in.next();
			recipe_list.set(recipe_index, recipe);
			break;
		case 2:
			System.out.print("추가할 재료: ");
			food.name = in.next();
			food_list.add(food);
			break;
		case 3:
			System.out.print("삭제할 재료: ");
			food.name = in.next();
			for(Food f : food_list){	if(f.name.equals(food.name)) food_list.remove(f);}
			break;
		case 4:
			System.out.println("");
			in.nextLine();
			recipe.way_to_cook = in.nextLine();
			recipe_list.set(recipe_index, recipe);
			break;
		default:
			System.out.println("잘못입력하셨습니다.");
			break;
		}
	}
	
	public void deleteRecipe() {
		System.out.println("삭제하고자 하는 레시피를 검색하세요.");
		listRecipe();
		
		System.out.print("입력: ");
		int recipe_index = in.nextInt()-1;
		recipe_list.remove(recipe_index);
		System.out.println("성공적으로 삭제되었습니다.");
	}
	
	public void addRecipe() {
		Recipe recipe = CreateRecipe();
		String recipe_name;
		String kind_of_food;
		String way;
		
		System.out.print("레시피 이름: ");
		recipe.name = in.next();
		System.out.println("---------------------- 재료 입력 ----------------------");
		System.out.println("(재료를 모두 다 입력하셨으면 1을 입력하세요.)");

		int idx = 1;

		while(true){
			System.out.print(idx +". ");
			Food tmp = CreateFood();
			String name = in.next();
			
			if(name.equals("1")) break;
			
			tmp.name = name;
			recipe.food.add(tmp);
			idx++;
		}
		
		System.out.print("요리 방법: ");
		in.nextLine();
		recipe.way_to_cook = in.nextLine();
		
		recipe_list.add(recipe);
		System.out.println(recipe.name + "의 레시피가 생성되었습니다.");
		System.out.println();
	}

	public void search() {
		System.out.println("재료를 검색하시고, 다 입력하셨으면 1을 입력하세요.");
		String input;

		while (true) {
			input = in.next();
			if (input.equals("1")) FindBetterRecipe();
			
			else {
				for(Recipe r : recipe_list){
					for(int i = 0; i < r.food.size(); i ++){
						if(r.food.get(i).name.equals(input)) r.equal_num_food += 1;
					}
				}
			}
		}
	}

	public void FindBetterRecipe() {
		int max_number = 0;
		int tmp_num = recipe_list.get(0).equal_num_food;
		ArrayList<Recipe> max_idx = new ArrayList<Recipe>();
		
		for(Recipe r : recipe_list){
			if(r.equal_num_food > tmp_num){
				max_number = r.equal_num_food;
			}
		}
		
		for(Recipe r: recipe_list){
			if(max_number == r.equal_num_food){
				max_idx.add(r);
			}
		}
	
		recommend(max_idx);
	}

	public void recommend(ArrayList<Recipe> max_idx) {
		int arr_idx;
		
		for(Recipe r : max_idx){
			System.out.println("---------------------------------------------");
			System.out.println("레시피: " + r.name + "\n준비물: ");
			for(Food f : r.food){
				System.out.print(f.name + " ");
			}
			System.out.println("조리방법: " + r.way_to_cook);
			System.out.println("---------------------------------------------");
			System.out.println();
		}	
		
		return;
	}

	public void Exit() {
		System.exit(0);
	}
	
}
