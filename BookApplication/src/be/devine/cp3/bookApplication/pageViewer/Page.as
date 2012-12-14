/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 30/11/12
 * Time: 09:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer {
import avmplus.variableXml;

import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.vo.FrontPageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.ImagePageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.IndexPageVo;
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.TextPageVO;
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
    private var c:TextField;
    private var indexArr:Array = new Array();
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

        appModel = AppModel.getInstance();

        lightModeChanged(null);

        switch (data.style){
            case "index":
                    createIndexPage(data);
                break;
            case "text":
                    createTextPage(data);
                break;
            case "image":
                    crateImagePage(data);
                break;
            case "front":
                    createFrontPage(data);
                break;
        }

        appModel.addEventListener(AppModel.LIGHTMODE_CHANGED, lightModeChanged);

        pageNumber = data.pageNumber;
        pageNumberField = new TextField(data.pageNumberWidth, data.pageNumberHeight, String(pageNumber), "Gotham", 12, color);
        pageNumberField.y = data.pageNumberY;

        if(isEven(pageNumber)){
            pageNumberField.x = data.pageNumberX_even;
            //NOG CURRENT CHAPTER OP TE HALEN

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

    private function createIndexPage(data:PageVO):void {
        var ivo:IndexPageVo = data as IndexPageVo;

        //TODO CHAPTERS OPHALEN
        trace("IN INDEX");
        trace(appModel.arrChapter);

        var yPos:int = ivo.y;
        for(var i:int = 1; i < appModel.arrChapter.length; i++){
            c = new TextField(ivo.width, ivo.width, i + ". " +appModel.arrChapter[i], "Gotham", 14, color);
            c.x = ivo.x;
            c.y = yPos;
            c.hAlign = "left";
            addChild(c);
            indexArr.push(c);
            yPos += ivo.height + 10;
        }
    }

    private function createFrontPage(data:PageVO):void {
        var fvo:FrontPageVO = data as FrontPageVO;
        title = new TextField(fvo.width, fvo.height, fvo.title, "Gotham", 24, color);
        title.x = fvo.x;
        title.y = fvo.y;
        addChild(title);
    }

    private function crateImagePage(data:PageVO):void {
        var imgvo:ImagePageVO = data as ImagePageVO;
        imageX = imgvo.x;
        imageY = imgvo.y;
        queue = new RequestQueue();
        queue.add(new ImageTask(String(imgvo.imgUrl)));
        queue.start();
        queue.addEventListener(flash.events.Event.COMPLETE, requestQueueCompleted);
    }

    private function createTextPage(data:PageVO):void {
        var tvo:TextPageVO = data as TextPageVO;
        paragraph = new TextField(tvo.width, tvo.height, tvo.paragraph, "GEORGIA", 14, color);
        paragraph.x = tvo.x;
        paragraph.y = tvo.y;
        paragraph.hAlign = "left";
        paragraph.vAlign = "top";
        addChild(paragraph);
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
        if(indexArr.length >0){
            for each (var o:TextField in indexArr) {
                o.color = color;
            }
        }
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
        this.flatten();
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
