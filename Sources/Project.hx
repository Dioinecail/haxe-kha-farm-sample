package;

import kha.input.Mouse;
import kha.Color;
import haxe.Timer;
import kha.Assets;
import kha.Framebuffer;
import ui.Button;
import ui.Text;
import game.resources.ResourceManager;
import zui.*;

class Project {
	public var logic:GameLogic;
	public var ui:Zui;

	public var uiButton:Button;
	public var text:Text;

	public var image:kha.Image;
	public var font:kha.Font;
	public var speed:Float;
	public var amplitude:Float;
	public var posX:kha.FastFloat;
	public var posY:kha.FastFloat;
	public var fontSize:Int;
	public var counterText:String;


	
	public function new() {
		image = Assets.images.get('chop');
		font = Assets.fonts.get('pdkv');
		logic = new GameLogic();
		var m = new GameManager();

		posX = 320.0;
		posY = 220.0;
		speed = 2.0;
		amplitude = 2.0;
		fontSize = 32;

		uiButton = new Button('Custom Button', posX, posY, 100, 100, Color.Blue, image);
		counterText = "You have clicked the dick 0 times";

		ui = new Zui({font:font});

		Mouse.get().notify(onMouseDownEvent, null, null, null, null);
	}

	public function update(): Void {
		var positionX = posX + (sineWave(0.0, speed) * amplitude);
		var positionY = posY + Math.abs((sineWave(1.5, speed * 2.0) * amplitude));

		uiButton.x = positionX;
		uiButton.y = positionY;

		uiButton.color = Color.fromFloats(Math.abs(sineWave(0.0, speed)), Math.abs(sineWave(0.75, speed)), Math.abs(sineWave(1.5, speed)));
	}

	public function render(frames: Array<Framebuffer>): Void {
		var gl = frames[0].g2;
		gl.begin();
		uiButton.render(gl);
		gl.end();

		ui.begin(gl);

		if(ui.window(Id.handle(), 10, 10, 400, 300, true)) {
			ui.text(counterText, zui.Zui.Align.Left);
		}

		ui.end();
	}

	public function sineWave(offset:Float = 0.0, speed:Float = 1.0): Float {
		return Math.sin((speed * Timer.stamp()) + offset);
	}

	public function onMouseDownEvent(button:Int, x:Int, y:Int){
		if(uiButton.onMouseDown(button, x, y)) {
			logic.incrementCounter();
			updateText();
		}
	}

	public function updateText() {
		counterText = "You have clicked the dick " + Std.string(logic.counter) + " times";
	}
}