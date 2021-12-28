package game;

import game.resources.ResourceManager;
import game.resources.ResourceContainerManager;
import game.resources.ResourceProductionSystem;

class GameSettings {
	public var productionSettings:ResourceProductionSettings;
}

/**
 * Manages the core game logic like managers creation
 */
class GameManager {
	public static var instance:GameManager;
	public var resourceManager:ResourceManager;
	public var resourceContainerManager:ResourceContainerManager;
	public var resourceProductionSystem:ResourceProductionSystem;



	public function new(settings:GameSettings) {
		instance = this;
		resourceManager = new ResourceManager();
		resourceContainerManager = new ResourceContainerManager();
		resourceProductionSystem = new ResourceProductionSystem(settings.productionSettings);
	}
}