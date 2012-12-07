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

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

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
    private var isVisible:Boolean = false;
    private var aChapterTitle:TextField;
    private var arrChapters:Array;
    private var btnIndexTexture:Texture;
    private var btnIndex:Image;
    private var arrColors:Array;

    private var texture:starling.textures.Texture = Texture.fromBitmap(new BookApplication.uiTexture);
    private var xml:XML = XML(new BookApplication.uiXml);
    private var atlas:TextureAtlas = new TextureAtlas(texture, xml);
    private var appModel:AppModel;
    private var textContainer:Sprite;
    private var animation:Tween;
    private var tweenSpeed:Number = .5;
    private var arrTextfields:Array;
    private var spaceIcon:Quad;






    /*************************************/
    //Constructor
    /*************************************/

    public function Index() {
        appModel = AppModel.getInstance();
        this.y = 5;

        //clickhandler dispatcht CURRENT_PAGE_CHANGED naar 1e pagina van het geselecteerde chapter
        trace("IN INDEX");

        //background is quad
        background = new Quad(212, 530, 0x000000);
        background.alpha = transparency;
        addChild(background);

        //PIJL
        btnIndexTexture = atlas.getTexture('timelineBtnSpatie');
        btnIndex = new Image(btnIndexTexture);
        btnIndex.pivotX = btnIndex.width/2;
        btnIndex.pivotY = btnIndex.height/2;
        btnIndex.rotation = Math.PI;
        btnIndex.alpha = transparency;
        btnIndex.addEventListener(starling.events.TouchEvent.TOUCH, clickHandler);
        addChild(btnIndex);


        arrChapters = appModel.arrChapter;
        arrChapters.shift();
        trace(arrChapters);

        arrColors = appModel.arrColors;


        textContainer = new Sprite();
        textContainer.width = background.width - 30;

        //HOOFDSTUKKEN
        arrTextfields = new Array();
        var yPos:int = 0;
        var xPos:int = 0;
        for(var i:int = 0; i < arrChapters.length; i++){

            var color:uint = arrColors[i];
            if(i<appModel.arrColors.length){
                color = arrColors[i];
            }else{
                color = arrColors[i-arrColors.length];
            }

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


        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
        appModel.addEventListener(AppModel.INDEXVISIBLE_CHANGED, toggleVisible);

    }








    /*************************************/
    //Methods
    /*************************************/
    private function addedToStageHandler(event:starling.events.Event):void {
        background.x = stage.stageWidth/2 - background.width/2;
        background.y = 192;

        btnIndex.x = stage.stageWidth/2;
        btnIndex.y = background.y - btnIndex.height/2;

        textContainer.x = background.x + 20;
        textContainer.y = background.y + 20;


        stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keydownHandler)
        toggleVisible(null);


    }

    private function keydownHandler(event:starling.events.KeyboardEvent):void {
        if(event.keyCode == Keyboard.SPACE){
            trace("space");
            appModel.indexVisible = !appModel.indexVisible;
        }

    }

    private function clickHandler(event:starling.events.TouchEvent):void{
        var touch:Touch = event.getTouch(btnIndex);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                trace("click op btnIndex");
               appModel.indexVisible = !appModel.indexVisible;


            }
        }
    }

    private function toggleVisible(event:flash.events.Event):void{
        if(!appModel.indexVisible){
            //this.y = stage.stageHeight-190;
            setupAnimation(stage.stageHeight-190);
        }else{
            //this.y = 5;
            setupAnimation(5);

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
                        //trace(textfield.text);
                        trace(arrTextfields.indexOf(textfield)); // 0 tot 7 index
                        var spreadsPerChapter:Array = appModel.spreadsPerChapter; //0-7 index
                        trace(spreadsPerChapter);

                        var currentSpread:uint=0;
                        for(var i:int = 0; i<arrTextfields.indexOf(textfield)+1; i++){
                            currentSpread += spreadsPerChapter[i];
                        }


                        appModel.currentSpread = currentSpread;


                    }

                }
            }
        }
    }

    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
