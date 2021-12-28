package;

import kha.input.Mouse;
import kha.Color;
import haxe.Timer;
import kha.Assets;
import kha.Framebuffer;
import ui.Button;
import ui.Text;
import game.GameManager;
import zui.*;
import json2object.JsonParser;

class Project {
	public function new() {
		var settings = loadSettingsFromJson();
	}

	public function update(): Void {
		
	}

	public function render(frames: Array<Framebuffer>): Void {

	}

	private function loadSettingsFromJson():GameSettings {
		var parser = new json2object.JsonParser<GameSettings>();
	}
}