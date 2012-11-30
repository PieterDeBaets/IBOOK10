package be.devine.cp3.bookApplication.requestQueue {
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

public class ImageTask extends Loader implements IQueueTask {

    private var _path:String;
    public var image:Object;

    public function ImageTask(path:String) {
        _path = path;
        this.contentLoaderInfo.addEventListener(Event.COMPLETE, loadedHandler);
    }

    public function start():void {
        this.load(new URLRequest(_path));
    }

    private function loadedHandler(event:Event):void {
        this.image = event.target.loader;
        dispatchEvent(new Event(Event.COMPLETE, true, true));
    }
}
}
