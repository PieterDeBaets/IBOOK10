package be.devine.cp3.bookApplication {

import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.controls.Controls;
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
    private var controls:Controls;
    private var pageViewer:PageViewer;


    /*************************************/
    //Constructor
    /*************************************/

    public function BookApplication() {
        //var textField:starling.text.TextField = new TextField(100, 20, "IBOOK 10 start", "Verdana", 12);
        //addChild(textField);

        appModel = AppModel.getInstance();

        bookService = new BookService();
        bookService.addEventListener(Event.COMPLETE, bookCompleted);
        bookService.load();

        appModel.addEventListener(AppModel.LIGHTMODE_CHANGED, lightModeChanged);
    }

    private function lightModeChanged(event:Event):void {
        if(q){
            removeChild(q);
        }

        if(appModel.lightMode){
            var q:Quad = new Quad( Starling.current.stage.stageWidth, Starling.current.stage.stageHeight, 0x333333);
            addChild(q);
        }
    }

    private function bookCompleted(event:Event){



        timeline = new Timeline();
        addChild(timeline);

        index = new Index();
        addChild(index);

        controls = new Controls();
        addChild(controls);

        setChildIndex(controls, 0);
        appModel.currentSpread = 0;


        pageViewer = new PageViewer();
        addChild(pageViewer);

        setChildIndex(pageViewer, 0);


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
