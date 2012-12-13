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

import flash.display.Bitmap;

import flash.display.BitmapData;

import flash.display.Loader;
import flash.events.Event;
import flash.system.ApplicationDomain;

import starling.display.DisplayObject;
import starling.display.Image;

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

    public function Page(data:PageVO,spreadChapter:int) {
        trace("IN PAGE");
        //test
        //test

        appModel = AppModel.getInstance();

        lightModeChanged(null);

        switch (data.style){
            case "index":
                //TODO CHAPTERS OPHALEN
                    trace("IN INDEX");
                    trace(appModel.arrChapter);

                    var yPos:int = data.indexY;
                for(var i:int = 1; i < appModel.arrChapter.length; i++){
                    var c:TextField = new TextField(data.indexWidth, data.indexHeight, i + ". " +appModel.arrChapter[i], "Gotham", 14, color);
                    c.x = data.indexX;
                    c.y = yPos;
                    c.hAlign = "left";
                    addChild(c);

                    yPos += data.indexHeight + 10;
                }
                break;
            case "text":
                    trace("EERSTE TEKST");
               // string = string.split("\r").join("");
                    //var paragraphText:String;
                    //if(data.paragraph != "") paragraphText = removeTabsAndNewLines(data.paragraph);
                    paragraph = new TextField(data.paragraphWidth, data.paragraphHeight, data.paragraph, "GEORGIA", 14, color);
                    paragraph.x = data.paragraphX;
                    paragraph.y = data.paragraphY;
                    paragraph.hAlign = "left";
                    paragraph.vAlign = "top";
                    addChild(paragraph);

                break;
            case "image":
                trace("in page switch image");
                trace(data.imageUrl);
                imageX = data.image1X;
                imageY = data.image1Y;
                queue = new RequestQueue();
                queue.add(new ImageTask(String(data.imageUrl)));
                queue.start();
                queue.addEventListener(flash.events.Event.COMPLETE, requestQueueCompleted);

                break;
            case "front":

                    title = new TextField(data.titleWidth, data.titleHeight, data.title, "Gotham", 24, color);
                    title.x = data.titleX;
                    title.y = data.titleY;
                    addChild(title);

                break;
        }

        appModel.addEventListener(AppModel.LIGHTMODE_CHANGED, lightModeChanged);


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

            trace("CHAPTER");
            trace(appModel.arrChapter[spreadChapter]);

        }else{
            chapter = new TextField(data.chapterWidth, data.chapterHeight, String(appModel.arrChapter[spreadChapter - 1]), "Gotham", 12, color);
            chapter.hAlign = "left";
            chapter.x = data.chapterX;
            chapter.y = data.chapterY;
            addChild(chapter);
            pageNumberField.x = data.pageNumberX_odd;
        }

        if(pageNumber != 0) addChild(pageNumberField);
    }

    private function lightModeChanged(event:flash.events.Event):void {
        if(appModel.lightMode){
            color = 0xffffff;
        }else{
            color = 0x000000;
        }

        if(paragraph) paragraph.color = color;
        if(title) title.color = color;
        if(pageNumberField) pageNumberField.color = color;
        if(chapter) chapter.color = color;
    }

    /*************************************/
    //Methods
    /*************************************/
    private function requestQueueCompleted(event:flash.events.Event):void {
        var xPos:uint = 0;
        for (var i:uint = 0; i < queue.completedTasks.length; i++) {
            var imageFlash:flash.display.DisplayObject = queue.completedTasks[i] as flash.display.DisplayObject;
            var bd:BitmapData = new BitmapData(imageFlash.width, imageFlash.height, true,0xFFFFFFFF);
            bd.draw(imageFlash);
            var b:Bitmap = new Bitmap(bd);
            var image:Image = Image.fromBitmap(b);

            //TODO scalen van te grote images
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
