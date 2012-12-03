/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 03/12/12
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.service {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.factory.SpreadVOFactory;
import be.devine.cp3.bookApplication.requestQueue.RequestQueue;
import be.devine.cp3.bookApplication.requestQueue.XMLTask;

import flash.events.Event;
import flash.events.EventDispatcher;

public class BookService extends EventDispatcher{

    private var xmlTask:XMLTask;
    private var requestQueue:RequestQueue;
    private var appModel:AppModel;

    public function BookService() {
        appModel = AppModel.getInstance();
    }

    public function load(){
        requestQueue = new RequestQueue();
        //xmlTask = new XMLTask('assets/book1.xml');
        xmlTask = new XMLTask('assets/test.xml');

        requestQueue.add(xmlTask);
        requestQueue.start();
        requestQueue.addEventListener(Event.COMPLETE, bookLoaded);
    }

    private function bookLoaded(event:Event){
        trace('XML book loaded');
        var bookXMLTask:XMLTask = requestQueue.completedTasks[0] as XMLTask;
        var bookXML:XML = new XML(bookXMLTask.data);

        var chapters:Array = [];

        for each(var chapter:XML in bookXML.chapter){
            appModel.arrChapter.push(chapter.@title);

            for each( var spread:XML in chapter.spread){
                appModel.totalSpreads ++;
                appModel.arrBook.push(SpreadVOFactory.createSpreadVO(spread));
            }
        }

        trace('DONE!');
        trace(appModel.totalSpreads);
        trace(appModel.arrBook[0].page1.pageNumber);
        trace(appModel.arrChapter);

        dispatchEvent(new Event(Event.COMPLETE));
    }
}
}
