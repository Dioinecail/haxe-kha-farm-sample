package ui;

import kha.Image;
import kha.graphics2.Graphics;
import kha.Color;

/**
 * Basic class for rendering buttons
 */
class Button extends GraphicElement{
	public var name:String;
	public var width:Int;
	public var height:Int;
	public var image:Image;
	
	public function new(name:String, x:Float, y:Float, width:Int, height:Int, color:Color, image:Image = null){
		this.name = name;
		this.x = x;
		this.y = y;

		this.width = width;
		this.height = height;

		this.color = color;
		this.image = image;
	}
	
	public function render(graphics:Graphics){
		var oldColor = graphics.color;
		graphics.color = color;
		graphics.fillRect(x, y, width, height);

		if(image != null)
			graphics.drawScaledImage(image, x, y, width, height);

		graphics.color = oldColor;
	}
	
	public function onMouseDown(mouseButton:Int, mouseX:Int, mouseY:Int):Bool {
		if (mouseButton == 0){
			if (mouseX >= this.x && mouseX <= this.x + this.width && mouseY >= this.y && mouseY <= this.y + this.height) {
				return true;
			}
			else 
				return false;
		}
		else 
			return false;
	}
}