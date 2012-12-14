/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:25
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.index {
import avmplus.factoryXml;

import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.BookApplication;

import flash.display.Sprite;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

import starling.animation.Transitions;


import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Image;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;


public class Index extends starling.display.Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var background:starling.display.Quad; // BasicIndexBackground
    private var transparency:Number = 0.76;
    private var arrChapters:Array;
    private var btnIndexTexture:Texture;
    private var btnIndex:Image;
    private var arrColors:Array;

    //private var texture:starling.textures.Texture = Texture.fromBitmap(new BookApplication.uiTexture);
    //private var xml:XML = XML(new BookApplication.uiXml);
    //private var atlas:TextureAtlas = new TextureAtlas(texture, xml);
    private var appModel:AppModel;
    private var textContainer:Sprite;
    private var animation:Tween;
    private var tweenSpeed:Number = .5;
    private var arrTextfields:Array;


    /*************************************/
    //Constructor
    /*************************************/

    public function Index() {
        appModel = AppModel.getInstance();
        this.y = 5;

        //clickhandler dispatcht CURRENT_PAGE_CHANGED naar 1e pagina van het geselecteerde chapter

        //background is quad

        background = new Quad(212, 530, 0x000000);
        background.alpha = transparency;
        addChild(background);

        //PIJL

        btnIndexTexture = appModel.atlas.getTexture('timelineBtnSpatie');
        btnIndex = new Image(btnIndexTexture);
        btnIndex.pivotX = btnIndex.width/2;
        btnIndex.pivotY = btnIndex.height/2;
        btnIndex.rotation = Math.PI;
        btnIndex.alpha = transparency;
        btnIndex.addEventListener(starling.events.TouchEvent.TOUCH, clickHandler);
        addChild(btnIndex);


        arrChapters = new Array();
        //arrChapters = appModel.arrChapter;
        for each (var chapter:String in appModel.arrChapter) {
            arrChapters.push(chapter);
        }
        arrChapters.shift();

        trace("appmodel.arrChapters " + appModel.arrChapter);
        trace("arrChapters " + arrChapters);
        arrColors = appModel.arrColors;


        textContainer = new Sprite();
        textContainer.width = background.width - 30;

        //HOOFDSTUKKEN

        arrTextfields = new Array();
        var yPos:int = 0;
        var xPos:int = 0;
        for(var i:int = 0; i < arrChapters.length; i++){

            //var color:uint = arrColors[i+1];
            var color:uint = appModel.arrColors[(i % appModel.arrColors.length)+1];

            var chapterString:String = i+1 +". "+arrChapters[i];
            //var t:starling.text.TextField = new TextField(162, 90, chapterString, "Century", 12 ,color);
            var t:IndexButton = new IndexButton(chapterString, color);
            t.x = xPos;
            t.y = yPos;
            t.addEventListener(starling.events.TouchEvent.TOUCH,chapterClickHandler);
            arrTextfields.push(t);
            textContainer.addChild(t);
            yPos += 50;
        }

        addChild(textContainer);

        //SCROLL OP TEXTCONTAINER
        //test
        //test
        //test
        //test
        //test
        //test




        appModel.addEventListener(AppModel.INDEXVISIBLE_CHANGED, toggleVisible);

        background.x = Starling.current.stage.stageWidth/2 - background.width/2;
        background.y = 192;

        btnIndex.x = Starling.current.stage.stageWidth/2;
        btnIndex.y = background.y - btnIndex.height/2;

        textContainer.x = background.x + 20;
        textContainer.y = background.y + 20;


        Starling.current.stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keydownHandler)
        toggleVisible(null);
    }


    /*************************************/
    //Methods
    /*************************************/

    //TODO als je blijft drukken op spatie dan flipt de index
    private function keydownHandler(event:starling.events.KeyboardEvent):void {
        if(event.keyCode == Keyboard.SPACE){
            appModel.indexVisible = !appModel.indexVisible;
        }

    }

    private function clickHandler(event:starling.events.TouchEvent):void{
        var touch:Touch = event.getTouch(btnIndex);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
               appModel.indexVisible = !appModel.indexVisible;


            }
        }
    }

    private function toggleVisible(event:flash.events.Event):void{
        if(!appModel.indexVisible){
            setupAnimation(Starling.current.stage.stageHeight-190);
        }else{
            setupAnimation(Starling.current.stage.stageHeight-this.height-60);

        }
    }

    private function setupAnimation(value:uint):void{
        if (animation) animation.reset(this, tweenSpeed,Transitions.EASE_OUT);
        else           animation = new Tween(this, tweenSpeed,Transitions.EASE_OUT);

        animation.animate("y", value);

        Starling.juggler.add(animation);
    }


    private function chapterClickHandler(event:starling.events.TouchEvent):void {
        var touch:Touch = event.getTouch(textContainer);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                for each (var textfield:Object in arrTextfields) {
                    if(event.currentTarget == textfield){
                        //trace(arrTextfields.indexOf(textfield)); // 0 tot 7 index
                        var spreadsPerChapter:Array = appModel.spreadsPerChapter; //0-7 index
                        //trace(spreadsPerChapter);

                        var currentSpread:uint=0;
                        for(var i:int = 0; i<arrTextfields.indexOf(textfield)+1; i++){
                            currentSpread += spreadsPerChapter[i];
                        }
                        appModel.currentSpread = currentSpread;
                    }
                }
            }else if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }

    }

    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
