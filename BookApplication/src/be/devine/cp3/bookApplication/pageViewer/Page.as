/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 30/11/12
 * Time: 09:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;
import be.devine.cp3.bookApplication.requestQueue.ImageTask;
import be.devine.cp3.bookApplication.requestQueue.RequestQueue;

import flash.display.Loader;

import starling.display.DisplayObject;

import starling.display.Sprite;
import starling.events.Event;


import starling.text.TextField;

public class Page extends starling.display.Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var title:TextField;
    private var paragraph:TextField;
    private var caption:TextField;
    private var chapter:TextField;
    private var image:Loader;
    private var pageNumber:int;
    private var pageNumberField:TextField;
    //private var backgroundColor:Sprite;
    private var color:int = 0x000000;
    private var queue:RequestQueue;
    private var imageX:uint;
    private var imageY:uint;
    private var appModel:AppModel;



    /*************************************/
    //Constructor
    /*************************************/

    public function Page(data:PageVO) {
        trace("IN PAGE");
        //test

        appModel = AppModel.getInstance();
        switch (data.style){
            case "index":
                //TODO CHAPTERS OPHALEN
                break;
            case "text":
                    trace("EERSTE TEKST");
               // string = string.split("\r").join("");
                    //var paragraphText:String;
                    //if(data.paragraph != "") paragraphText = removeTabsAndNewLines(data.paragraph);
                    paragraph = new TextField(data.paragraphWidth, data.paragraphHeight, data.paragraph, "Century", 12, color);
                    paragraph.x = data.paragraphX;
                    paragraph.y = data.paragraphY;
                    paragraph.hAlign = "left";
                    paragraph.vAlign = "top";
                    addChild(paragraph);

                break;
            case "image":
                    /*
                imageX = data.image1X;
                imageY = data.image1Height;
                queue = new RequestQueue();
                queue.add(new ImageTask(String(data.imageUrl)));
                queue.start();
                queue.addEventListener(Event.COMPLETE, requestQueueCompleted);
                    */
                break;
            case "front":

                    title = new TextField(data.titleWidth, data.titleHeight, data.title, "Gotham", 24, color);
                    title.x = data.titleX;
                    title.y = data.titleY;
                    addChild(title);

                break;
        }



        pageNumber = data.pageNumber;
        pageNumberField = new TextField(data.pageNumberWidth, data.pageNumberHeight, String(pageNumber), "Gotham", 12, color);
        pageNumberField.y = data.pageNumberY;

        /*
        trace("pagenumber " + pageNumber);
        trace("number width " + data.pageNumberWidth);
        trace("number height " + data.pageNumberHeight);
        trace("x " + data.pageNumberX_even);
        trace("y even" + data.pageNumberX_odd);
        trace("y odd" + data.pageNumberY);
        */

        if(isEven(pageNumber)){
            pageNumberField.x = data.pageNumberX_even;
            //NOG CURRENT CHAPTER OP TE HALEN


            chapter = new TextField(data.chapterWidth, data.chapterHeight, "test", "Gotham", 12, color);
            chapter.x = data.chapterX;
            chapter.y = data.chapterY;
            addChild(chapter);



        }else{
            pageNumberField.x = data.pageNumberX_odd;
        }
        addChild(pageNumberField);






    }



    /*************************************/
    //Methods
    /*************************************/
    private function requestQueueCompleted(event:Event):void {
        var xPos:uint = 0;
        for (var i:uint = 0; i < queue.completedTasks.length; i++) {
            var image:DisplayObject = queue.completedTasks[i] as DisplayObject;
            image.x = imageX;
            image.y = imageY;
            addChild(image);
        }
    }

    private function isEven(num:Number):Boolean
    {
        // if(num % 2 == 0){return true;}else{return false;} //<–old
        return !(num % 2);//shorter
        // return !(num & 1);//seems the fastest one
    }

    private function removeTabsAndNewLines($str:String):String
    {
        var rex:RegExp = /(\t|\r)/gi;
        $str = $str.replace(rex,'');
        return $str;
    }

    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
