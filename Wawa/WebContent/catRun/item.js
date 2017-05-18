/**
 * 
 */
function Item(parent, posX, posY, width, height, src, type){
	this.parent = parent;
	this.posX = posX;
	this.posY = posY;
	this.width = width;
	this.height = height;
	this.span;
	this.img;
	this.type = type;
	this.stepX = 0;
	this.init = function(){
		this.span = document.createElement('span');
		this.span.style.position = 'absolute';
		this.span.style.width = width + 'px';
		this.span.style.height = height +'px';
		this.span.style.left = this.posX + 'px';
		this.span.style.top = this.posY + 'px';
		
		this.img = document.createElement('img');
		this.img.src = src;
		this.img.style.width = this.width+'px';
		this.img.style.height = this.height+'px';
		
		this.span.appendChild(this.img);
		this.parent.appendChild(this.span);
	}
	this.move = function(){
		var me = this;
		this.posX = this.posX + this.stepX;
		this.span.style.left = this.posX + 'px';
		this.currentLeft = parseInt(this.span.style.left);
		if(this.currentLeft < -20){
			this.parent.removeChild(this.span);
//			return;
		}
		setTimeout(function() {
			me.move();
		}, 10);
	}
}