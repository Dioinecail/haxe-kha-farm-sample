package game.resources;

import haxe.Timer;
import game.resources.ResourceContainer;
import game.resources.ResourceManager;

class ResourceProductionSettings {
	public var productionTimes:Map<ResourceType, Float>;
}

/**
 * System that handles resource production over time
 */
class ResourceProductionSystem {
	private var activeResources:Array<ResourceContainer>;
	private var productionSettings:ResourceProductionSettings;


	public function new(settings:ResourceProductionSettings) {
		activeResources = new Array();
		this.productionSettings = settings;

		GameManager.instance.resourceContainerManager.notifyOnCreated(onResourceCreated);
		GameManager.instance.resourceContainerManager.notifyOnCollected(onResourceCollected);
	}

	private function onResourceCreated(newResource:ResourceContainer) {
		activeResources.push(newResource);
		startProduction(newResource);
	}

	private function onResourceCollected(collectedResource:ResourceContainer) {
		startProduction(collectedResource);
	}

	private function startProduction(resource:ResourceContainer) {
		var productionTimeInMS = Std.int(productionSettings.productionTimes[resource.type] * 100.0);

		Timer.delay(resource.setProduced, productionTimeInMS);
	}
}