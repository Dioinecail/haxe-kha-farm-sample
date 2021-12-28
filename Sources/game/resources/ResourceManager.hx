package game.resources;

enum ResourceType {
	WOOD;
	STONE;
	BERRY;
}

class ResourceChangedEventArgs {
	public var type:ResourceType;
	public var oldAmount:Int;
	public var newAmount:Int;

	public function new(type:ResourceType, oldAmount:Int, newAmount:Int) {
		this.type = type;
		this.oldAmount = oldAmount;
		this.newAmount = newAmount;
	}
}

/**
* Class that manages in-game currency (resources)
*/
class ResourceManager {
	var onResourceChangedEvent: Array<ResourceChangedEventArgs->Void>

	public var resources: Map<ResourceType, Resource>;



	public function new() {
		resources = new Map();
		resources[WOOD] = new Resource(0);
		resources[STONE] = new Resource(0);
		resources[BERRY] = new Resource(0);

		onResourceChangedEvent = new Array();
	}

	public function add(type:ResourceType, amount:Int) {
			var oldAmount = resources[type].amount;
			var newAmount = resources[type].amount + amount;

			notifyResourcesChanged(new ResourceChangedEventArgs(type, oldAmount, newAmount));
		
		resources[type].amount = newAmount;
	}

	public function remove(type:ResourceType, amount:Int):Bool {
		if(resources[type].amount >= amount) {
			// spend resource

			var oldAmount = resources[type].amount;
			var newAmount = resources[type].amount - amount;

			notifyResourcesChanged(new ResourceChangedEventArgs(type, oldAmount, newAmount));

			resources[type].amount = newAmount;
			
			return true;
		} else {
			// not enough resources!
			return false;
		}
	}

	public function addNotification(listener:ResourceChangedEventArgs->Void) {
		onResourceChangedEvent.push(listener);
	}

	public function removeNotification(listener:ResourceChangedEventArgs->Void) {
		if(onResourceChangedEvent.indexOf(listener) != -1) {
			throw ('resource changed event does not contain this listner!');
		}

		onResourceChangedEvent.remove(listener);
	}

	public function removeAllNotifications() {
		onResourceChangedEvent = new Array();
	}

	private function notifyResourcesChanged(args:ResourceChangedEventArgs) {
		for (listener in onResourceChangedEvent) {
			listener(args);
		}
	}
}