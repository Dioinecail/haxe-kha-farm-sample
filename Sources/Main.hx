package;

import kha.System;
import kha.Assets;
import kha.Scheduler;

class Main {

	public static function main() {
		var options = new SystemOptions();
		options.title = "Test-Project";
		options.width = 1024;
		options.height = 768;

		System.start(options, onStart);
	}

	public static function onStart(window:kha.Window): Void {
		Assets.loadEverything(onLoadedEverything);
	}

	public static function onLoadedEverything(){
		var p = new Project();
		Scheduler.addTimeTask(p.update, 0, 1 / 60);
		System.notifyOnFrames(p.render);
	}
}
