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
        xmlTask = new XMLTask('assets/book1.xml');

        requestQueue.add(xmlTask);
        requestQueue.start();
        requestQueue.addEventListener(Event.COMPLETE, bookLoaded);
    }

    private function bookLoaded(event:Event){
        var bookXMLTask:XMLTask = requestQueue.completedTasks[0] as XMLTask;
        var bookXML:XML = new XML(bookXMLTask.data);

        for each(var chapter:XML in bookXML.chapter){
            appModel.arrChapter.push(chapter.@title);
            appModel.spreadsPerChapter.push(0);

            for each( var spread:XML in chapter.spread){
                appModel.totalSpreads ++;
                appModel.spreadsPerChapter[chapter.childIndex()] += 1;

                appModel.arrBook.push(SpreadVOFactory.createSpreadVO(spread, appModel.totalSpreads-1));
            }
        }

        trace('DONE!');
        trace('totaal aantal spreads: ' + appModel.totalSpreads);
        trace('totaal aantal paginas: ' + appModel.totalPages);
        trace('spreads per chapter: ' + appModel.spreadsPerChapter);
        trace('hoofdstukken: ' + appModel.arrChapter);

        dispatchEvent(new Event(Event.COMPLETE));
    }
}
}
