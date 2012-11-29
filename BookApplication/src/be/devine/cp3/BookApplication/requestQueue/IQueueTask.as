
package be.devine.cp3.BookApplication.RequestQueue {
import flash.events.IEventDispatcher;

public interface IQueueTask extends IEventDispatcher {
    function start():void;
}
}
