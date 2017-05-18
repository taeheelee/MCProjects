<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="./catRun/cat.js"></script>
<script src="./catRun/flower.js"></script>
<script src="./catRun/item.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var content = document.getElementById('content');
		var btn = document.getElementById('start');
		var img = document.getElementById('title');
		img.src = "./img/title.PNG";
		var flowers = [];
		var items = [];
		
		content.style.left = "500px";
		
		btn.onclick = function(){
			//document.getElementById('start').setAttribute('disabled', 'disabled');
			document.getElementById('title').style.visibility = 'hidden';
			document.getElementById('start').style.visibility = 'hidden';
			document.getElementById('table').style.visibility = 'hidden';
			//점수
// 			var score = document.getElementById("score");
			var score = document.createElement('span');
			var speed = 0;
			score.value = 0;
			score.style.position = 'absolute';
			score.style.top = 300 +'px';
			content.appendChild(score);
			setInterval(function() {
				score.innerHTML = score.value;
				score.value++;
				score.style.fontSize = "32px";
			}, 100)
			
			//배경
			content.style.width = '100%';
			content.style.height = '493px';
			content.style.backgroundImage = "url('./img/Land.png')";
			var xx = 0;
			var backg = setInterval(function() {
				xx -= 10 + (speed * 3);
				content.style.backgroundPosition = xx + 'px';
			}, 10);
			
			//고양이
			var posX = 20;
			var posY = 680;
			var cat = new Cat(content, posX, posY, 33 * 2, 31 * 2, flowers, items);
			cat.init();
			cat.move();
			setInterval(function() {
				if(cat.boolean == false) {
					alert("유다희 ");
					var name = prompt("이름을 입력하세여");
					clearInterval(backg);
					if(name != null && name != ""){
						var req = new XMLHttpRequest();
						req.open("post", "createCat.do");
						req.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");

						req.send("name="+name+"&score="+score.value);
					}
					document.location.reload();
				}
				if(cat.coin == false){
					score.value += 10;
				}
			}, 100);
			
			//장애물
			var randomSecond = parseInt((Math.random()*1000)+800);
				var flo = function() {
					randomSecond = parseInt((Math.random()*1000)+800);
					var ran = parseInt(Math.random() * 3);

					if (ran == 0) {
						var flower = new Flower(content, window.innerWidth, 680, 70, 100, "./img/flower.png");
					}
					if (ran == 1) {
						var flower = new Flower(content, window.innerWidth, 680, 100, 100, "./img/flower2.png");
					}
					if (ran == 2) {
						var flower = new Flower(content, window.innerWidth, 580, 150, 50, "./img/misile.png");
					}
					
					speed += 0.15;
					flower.init();
					flower.stepX = -(speed * 3) - 10;
					flower.move();
					flowers.push(flower);
					setTimeout(function() {
						
						flo();
					}, randomSecond);
				};
				flo();
				
				setInterval(function() {
					for(var i=0; i<flowers.length; i++){
						if(flowers[i].posX < -10){
							flowers.splice(i, 1);
						}
					}
				}, 100);
				
				//아이템
				
				var it = function(){
					var randomItem = parseInt((Math.random()*10000)+8000);
					var item = new Item(content, window.innerWidth, 680, 70, 70, "./img/star.png", 1);
					item.init();
					item.stepX = -(speed*3)-10;
					item.move();
					items.push(item);
					setTimeout(function() {
						it();
					}, randomItem);
				};
				setTimeout(function() {
					it();
				}, 10000);
				
				//코인
				var co = function(){
					var randomCoin = parseInt((Math.random()*1000)+3000);
					var randomTop = parseInt((Math.random()*100)+580);
					var coin = new Item(content, window.innerWidth, randomTop, 50, 50, "./img/coin.png", 2);
					coin.init();
					coin.stepX = -(speed*3)-10;
					coin.move();
					items.push(coin);
					setTimeout(function() {
						co();
					}, randomCoin);
				};
				setTimeout(function() {
					co();
				}, 1000);
				

				
				window.addEventListener("keydown", function(e) {
					
					if (event.keyCode == 32) {
						if (event.preventDefault) {
							event.preventDefault();
							} else {
							// IE
							event.returnValue = false;
							}
						cat.stepY = -5;
						if (cat.posY == posY && cat.span.style.width == 66+"px") {
							cat.jump();
						}
					}
				});
		};	
	}
</script>
</head>
<body>
	 <div class="product-big-title-area">
	        <div class="container">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>이벤트</h2>
                    </div>
                </div>
	        </div>
	 </div>
	<div id="content">
	<center>
		<div id="content2" style="height: 435px">
			<img id="title"></img> <br>
			<button id="start">시작</button>		
		</div>
		
		<div id="content3">
		<table class="list"  id="table" border="1">
		<c:forEach var="cat" items="${list}">
			<tr class="record">
				<td><input type="text" readonly="readonly" value="${cat.name}"></td>
				<td><input type="text" readonly="readonly" value="${cat.score}"></td>
			</tr>
			</c:forEach>
		</table>
		</div>
		
	</center>
	</div>
</body>
</html>