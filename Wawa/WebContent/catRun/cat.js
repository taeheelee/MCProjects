/**
 * 
 */
function hitTest(me, target) {	// span이나 div를 me 와 target에 매개변수로 지정.
	var meStyle = window.getComputedStyle(me);
	var targetStyle = window.getComputedStyle(target);
	 me_x= parseInt(meStyle.left);		// x좌표
	 me_y= parseInt(meStyle.top);	// y좌표
	 me_width=parseInt(meStyle.width);
	 me_height=parseInt(meStyle.height);
	 target_x= parseInt(targetStyle.left);	// x 좌표
	 target_y= parseInt(targetStyle.top);	// y 좌표
	 target_width=parseInt(targetStyle.width);
	 target_height=parseInt(targetStyle.height);
	 //나의 x좌표위치가 타겟의 x range 내에 있는지 판단 
	 // 내물체 x축 시작점이 상대물체 x축 시작점을 겹치거나 넘어서고, 내 x축 시작점이 상대물체 x축 시작점부터 너비의 범위안에 들어가는지 판단.
	 var result1=(me_x >= target_x) && (me_x <= (target_x+target_width));
	 //나의 가로폭이 타겟의 가로폭 내에 있는지 판단
	// 내 x축 시작점부터 내 너비를 더한값이 상대물체 x축의 시작점과 겹치거나 넘어서고, 내 x축 시작점부터 내 너비의 범위가 상대x축 시작값부터 너비의 끝까지의 범위안에 들어가는지.
	 var result2=(me_x+me_width >= target_x) && (me_x+me_width <= (target_x+target_width));
	 var result3=(me_y >= target_y) && (me_y <= (target_y+target_height));//나의 y좌표위치가 타겟의 세로폭 내에 있는지 판단
	 var result4=(me_y+me_height >= target_y) && (me_y+me_height <= (target_y+target_height));//나의 y폭이 타겟의 세로폭 내에 있는지 판단  
	 return (result1 || result2) && (result3 || result4);	// 충돌시 true를 반환.
}

function Cat(parant, posX, posY, width, height, flowers, items){
	this.parant = parant;	//배가 위치할 부모
	this.posX = posX;
	this.posY = posY;
	this.width = width;
	this.height = height;
	//배가 사용할 이미지, 스판, 이동거리
	this.img;
	this.span;
	this.stepY = 0;
	this.boolean = true;
	this.coin = true;
	
	this.init = function(){
		//span요소 생성
		//위치할 좌표와 크기를 포함해서 각종 style값 적용
		//img요소 생성해서 이미지 사진 맞추고 크기 맞추고
		//img를 span에 span을 parant에 넣기
		this.span = document.createElement("span");
		this.span.style.width = this.width + "px";
		this.span.style.height = this.height + "px";
		this.span.style.position = "absolute";
		this.span.style.left = this.posX + "px";
		this.span.style.top = this.posY + "px";
		
		this.img = document.createElement("img");
		this.img.src = "./img/cat.gif";
		this.img.style.width = this.width + "px";
		this.img.style.height = this.height + "px";
		
		this.audio = document.createElement("audio");
		this.audio.src = "./audio/default.mp3";
		this.audio.autoplay="autoplay"; 
		this.audio.loop="loop";
		
		this.audio2 = document.createElement("audio");
		this.audio2.src = "./audio/coin.mp3";
		
		this.span.appendChild(this.img);
		this.parant.appendChild(this.span);

		time = 0;

	};
	
	this.move = function(){
		var me = this;
		
		setTimeout(function() {
			me.move();
		}, 50);
		
		for(var i=0; i<flowers.length; i++){
			var result = hitTest(this.span, flowers[i].span);
			
			if(result){
				me.boolean = false;
			}
		}
		
		
		for(var i=0; i<items.length; i++){
			var result = hitTest(this.span, items[i].span);
			if(result){
					this.parant.removeChild(items[i].span);
					if(items[i].type == 1){
						this.audio.src = "./audio/item.mp3";
						time = 60;
						this.span.style.width = 300 + "px";
						this.span.style.height = 500 + "px";
						this.img.style.width = 300 + "px";
						this.img.style.height = 300 + "px";
						this.span.style.top = 390 + "px";
						setTimeout(function() {
							me.audio.src = "./audio/default.mp3";
							time = 0;
							me.posY = 620;
							me.span.style.width = 66 + "px";
							me.span.style.height = 62 + "px";
							me.img.style.width = 66 + "px";
							me.img.style.height = 62 + "px";
							me.span.style.top = 620 + "px";
						}, 2000);
					}
					else {
						me.audio2.play();
						me.coin = false;
						setTimeout(function() {
							
							me.coin = true;
						}, 100)
					}
					
			}
		}
	};
	
	this.jump = function(){
		
		var me = this;
		if(time<30){
			time++;
			this.posY = this.posY + this.stepY;
			this.span.style.top = this.posY + "px";
			setTimeout(function() {
				me.jump();
			}, 7);
		}
		else if(time<60){
			time++;
			this.posY = this.posY - this.stepY;
			this.span.style.top = this.posY + "px";
			setTimeout(function() {
				me.jump();
			}, 7);
		}
		else{
			time = 0;
		}
		
		
		
	}
	
}