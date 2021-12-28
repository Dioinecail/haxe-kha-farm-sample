package game.resources;

class ResourceContainerManager {
	public var onResourceContainerCreated:Array<ResourceContainer->Void>;
	public var onResourceContainerProduced:Array<ResourceContainer->Void>;
	public var onResourceContainerCollected:Array<ResourceContainer->Void>;



	public function new() {
		onResourceContainerCreated = new Array();
		onResourceContainerProduced = new Array();
		onResourceContainerCollected = new Array();
	}

	public function collect(container:ResourceContainer) {
		sendCollectedNotification(container);
	}

	public function notifyOnCreated(listener:ResourceContainer->Void) { addNotification(listener, onResourceContainerCreated); }
	public function notifyOnProduced(listener:ResourceContainer->Void) { addNotification(listener, onResourceContainerProduced); }
	public function notifyOnCollected(listener:ResourceContainer->Void) { addNotification(listener, onResourceContainerCollected); }
	
	public function removeNotificationOnCreated(listener:ResourceContainer->Void) { removeNotification(listener, onResourceContainerCreated); }
	public function removeNotificationOnProduced(listener:ResourceContainer->Void) { removeNotification(listener, onResourceContainerProduced); }
	public function removeNotificationOnCollected(listener:ResourceContainer->Void) { removeNotification(listener, onResourceContainerCollected); }

	private function addNotification(listener:ResourceContainer->Void, targetEvent:Array<ResourceContainer->Void>) {
		if(targetEvent.indexOf(listener) != -1)
			throw ('targetEvent already contains this listener!');

		targetEvent.push(listener);
	}

	private function removeNotification(listener:ResourceContainer->Void, targetEvent:Array<ResourceContainer->Void>) {
		if(targetEvent.indexOf(listener) == -1)
			throw ('targetEvent does not contains this listener!');

		targetEvent.remove(listener);
	}

	private function sendCreatedNotification(arg:ResourceContainer) {
		sendNotification(arg, onResourceContainerCreated);
	}

	private function sendProducedNotification(arg:ResourceContainer) {
		sendNotification(arg, onResourceContainerProduced);
	}

	private function sendCollectedNotification(arg:ResourceContainer) {
		sendNotification(arg, onResourceContainerCollected);
	}

	private function sendNotification(arg:ResourceContainer, array:Array<ResourceContainer->Void>) {
		for(listener in array) {
			listener(arg);
		}
	}
}