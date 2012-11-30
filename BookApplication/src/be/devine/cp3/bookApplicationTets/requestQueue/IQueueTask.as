
package be.devine.cp3.bookApplication.requestQueue {
import flash.events.IEventDispatcher;

public interface IQueueTask extends IEventDispatcher {
    function start():void;
}
}
