package game;

import game.resources;

/**
 * Manages the core game logic like managers creation
 */
class GameManager {
	public static var instance:GameManager;
	public var resourceManager:ResourceManager;
	public var resourceContainerManager:ResourceContainerManager;



	public function new() {
		instance = this;
		resourceManager = new ResourceManager();
		resourceContainerManager = new ResourceContainerManager();
	}
}