package game.resources;

import game.resources.ResourceManager;

/**
 * An object containing x amount of certain resource
 */
class ResourceContainer {
	public var type:ResourceType;
	public var amount:Int;

	public var productionTime:Float;



	public function new (type:ResourceType, amount:Int, productionTime:Float) {
		this.type = type;
		this.amount = amount;
		this.productionTime = productionTime;
	}

	public function collect() {
		GameManager.instance.resourceContainerManager.collect(this);
	}
}