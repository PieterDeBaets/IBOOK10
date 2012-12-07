package be.devine.cp3.bookApplication {

import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.index.Index;
import be.devine.cp3.bookApplication.pageViewer.Page;
import be.devine.cp3.bookApplication.pageViewer.PageViewer;
import be.devine.cp3.bookApplication.pageViewer.vo.SpreadVO;
import be.devine.cp3.bookApplication.service.BookService;
import be.devine.cp3.bookApplication.timeline.Timeline;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.core.Starling;

import starling.display.Quad;
import starling.text.TextField;

public class BookApplication extends starling.display.Sprite {
    /*************************************/
    //Properties
    /*************************************/
    private var appModel:AppModel;
    private var bookService:BookService;
    private var timeline:Timeline;
    private var index:Index;
    private var pageViewer:PageViewer;

    [Embed(source='../../../../../libs/IBookAssets.xml', mimeType='application/octet-stream')]
    public static const uiXml:Class;
    [Embed(source='../../../../../libs/IBookAssets.png')]
    public static const uiTexture:Class;

    /*************************************/
    //Constructor
    /*************************************/

    public function BookApplication() {
        var textField:starling.text.TextField = new TextField(100, 20, "IBOOK 10 start", "Verdana", 12);
        addChild(textField);

        appModel = AppModel.getInstance();

        bookService = new BookService();
        bookService.addEventListener(Event.COMPLETE, bookCompleted);
        bookService.load();

        //TODO FONTS EMBEDDEN
        /*
        var quad:Quad;
        var tween:Tween;


        quad = new Quad(100, 100, Math.random()* 0xffffff);
        quad.x = Math.random()*100;
        quad.y = Math.random()*100;
        quad.alpha = 0;
        quad.scaleX = quad.scaleY = 0;

        addChild(quad);

        tween = new Tween(quad, 1, "ease");
        tween.animate('x', 100 + Math.random()*100);
        tween.animate('y', 100 + Math.random()*100);
        tween.animate("scaleX", 1);
        tween.animate("scaleY", 1);
        tween.animate('alpha', 1);
        trace('tween');
        Starling.juggler.add(tween);
        */
    }

    private function bookCompleted(event:Event){
        trace('continue app');

        pageViewer = new PageViewer();
        addChild(pageViewer);

        timeline = new Timeline();
        addChild(timeline);

        index = new Index();
        addChild(index);



    }

    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/


        //instantie RequestQueue
        //xml inladen

        //instantie Appmodel
        //appmodel variabelen instellen adhv xml

        //instantie PageViewer
        //instantie Controls
        //instantie Index
        //instantie Timeline


    }

}
