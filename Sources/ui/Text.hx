package ui;

import kha.graphics2.Graphics;
import kha.Color;
import kha.Font;

/**
 * Basic class for rendering text
 */
class Text extends GraphicElement{
	public var font:Font;
	public var fontSize:Int;
	public var text:String;
	
	public function new(text:String, font:Font, fontSize:Int, x:Float, y:Float, color:Color) {
		this.text = text;
		this.font = font;
		this.fontSize = fontSize;
		this.color = color;
		this.x = x;
		this.y = y;
	}

	public function render(graphics:Graphics) {
		var f = graphics.font;
		var fs = graphics.fontSize;
		var c = graphics.color;

		graphics.font = font;
		graphics.fontSize = fontSize;
		graphics.color = color;

		graphics.drawString(text, x, y);

		if(f != null) graphics.font = f;
		
		graphics.fontSize = fs;
		graphics.color = c;
	}
}