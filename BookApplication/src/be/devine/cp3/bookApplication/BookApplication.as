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
import starling.display.Image;

import starling.display.Quad;
import starling.text.TextField;
import starling.textures.Texture;

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
    private var background:Quad;

    private var backgroundTexture:Texture;
    private var backgroundImage:Image;


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

        backgroundTexture = appModel.atlas.getTexture('BasicCenterSpreadBackground');
        backgroundImage = new Image(backgroundTexture);
        backgroundImage.y = 0;
        backgroundImage.blendMode = 'multiply' ;
        backgroundImage.scaleY=1.2;
        addChild(backgroundImage);

        backgroundImage.x = Starling.current.stage.stageWidth/2 - backgroundImage.width/2;

        appModel.addEventListener(AppModel.LIGHTMODE_CHANGED, lightModeChanged);
    }

    private function lightModeChanged(event:Event):void {
        if(background){
            background.dispose();
            removeChild(background);
        }

        if(appModel.lightMode){
            background = new Quad( Starling.current.stage.stageWidth, Starling.current.stage.stageHeight, 0x000000);
            background.alpha = 0.7;
            addChildAt(background, 1);
            setChildIndex(backgroundImage, 0);

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


        pageViewer = new PageViewer();
        addChild(pageViewer);

        appModel.currentSpread = 0;
        setChildIndex(pageViewer, 0);

        setChildIndex(backgroundImage, 0);
        //setChildIndex(background, 0);

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
