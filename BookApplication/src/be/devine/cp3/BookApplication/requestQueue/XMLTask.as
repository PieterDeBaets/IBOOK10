
package be.devine.cp3.BookApplication.RequestQueue {
import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLTask extends URLLoader implements IQueueTask {

    private var _path:String;

    public function XMLTask(path:String) {
        _path = path;
        // We don't need to listen to the Event.COMPLETE event here because URLLoader dispatches the event automagically
    }

    public function start():void {
        this.load(new URLRequest(_path));
    }

}
}
