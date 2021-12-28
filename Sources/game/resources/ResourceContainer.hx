package game.resources;

import game.resources.ResourceManager;

/**
 * An object containing x amount of certain resource
 */
class ResourceContainer {
	public var type:ResourceType;
	public var amount:Int;

	private var isProduced:Bool;


	public function new (type:ResourceType, amount:Int) {
		this.type = type;
		this.amount = amount;
		this.isProduced = false;
	}

	public function collect() {
		GameManager.instance.resourceContainerManager.collect(this);
		isProduced = false;
	}

	public function setProduced() {
		isProduced = true;
	}
}