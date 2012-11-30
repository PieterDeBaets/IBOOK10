package be.devine.cp3.bookApplication.requestQueue {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;

public class RequestQueue extends EventDispatcher implements IQueueTask {

    private var _currentTask:IQueueTask;
    private var _completedTasks:Vector.<IQueueTask>; // Vector = typed array, can only contain one datatype
    private var _totalTasks:uint;
    private var _queue:Vector.<IQueueTask>;

    public function RequestQueue() {
        // Initiate queue and loaded
        _queue = new Vector.<IQueueTask>();
        _completedTasks = new Vector.<IQueueTask>();
        _totalTasks = 0;
    }

    public function add(task:IQueueTask):void {

        // Add image path to queue
        _queue.push(task);
        _totalTasks++;

    }

    public function start():void {

        // If queue is not empty
        if (_queue.length > 0) {
            loadNext();
        } else {
            dispatchEvent(new Event(Event.COMPLETE)); // Dispatch COMPLETE to main
        }

    }

    public function loadNext():void {
        // array.shift() returns the first element of an array and shifts the order by one
        _currentTask = _queue.shift();
        _currentTask.addEventListener(Event.COMPLETE, currentTaskCompleted);
        _currentTask.start();
    }

    private function currentTaskCompleted(event:Event):void {
        // Push the completed task into the completed tasks
        _completedTasks.push(event.target);
        dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, _completedTasks.length, _completedTasks.length + _queue.length));
        start(); // Start the next task
    }

    public function get completedTasks():Vector.<IQueueTask> {
        return _completedTasks;
    }
}

}
