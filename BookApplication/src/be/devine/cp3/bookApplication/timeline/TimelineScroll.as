/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.AppModel;

import flash.events.Event;

import flash.geom.Point;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Image;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class TimelineScroll extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var _scrollProcent:Number;
    private var content:Content;

    private var appModel:AppModel;

    private var totalScroll:Sprite;

    private var button:Image;
    private var buttonTexture:Texture;

    private var tweenContent:Tween;
    private var tweenButton:Tween;
    private var tweenspeed:Number = 0.5;

    private var currentSpreadMarker:Quad;

    /*************************************/
    //Constructor
    /*************************************/

    public function TimelineScroll() {

        appModel = AppModel.getInstance();
        //uitpluizen hoe je content in de scrollbar krijgt
        //scrollbar.position wordt upgedated adhv CURRENT_PAGE_CHANGE event uit appmodel
        generateScrollBar();
        generateContent();
        addButton();
    }


    /*************************************/
    //Methods
    /*************************************/

    private function addButton():void{
        buttonTexture= appModel.atlas.getTexture('scrubber');
        button = new Image(buttonTexture);
        button.scaleX = button.scaleY = 0.9;
        button.x = totalScroll.x - (button.width/2);
        button.y = totalScroll.y -(button.height/2) + 5;
        addChild(button);

        button.addEventListener(TouchEvent.TOUCH, sleepHandler)
    }

    private function generateContent():void{
        content = new Content();
        content.x = (totalScroll.width/2)-35;
        addChild(content);
    }

    private function generateScrollBar():void{
        totalScroll = new Sprite();
        var maxWidth:uint = Starling.current.stage.stageWidth-36;

        var xPos:uint = 0;
        for(var i:uint = 0; i < appModel.spreadsPerChapter.length; i++){
            var chapterWidth:uint = (appModel.spreadsPerChapter[i] / appModel.arrBook.length) * maxWidth;

            //als de kleuren op zijn begint hij opnieuw bij het eerste kleur
            var color:uint = appModel.arrColors[i % appModel.arrColors.length];

            //trace('delen met rest ' + i % appModel.arrColors.length);
            var chapter:Quad = new Quad(chapterWidth, 13, color);
            chapter.x = xPos;
            totalScroll.addChild(chapter);

            xPos += chapterWidth;
        }

        addChild(totalScroll);
        totalScroll.x = 18;
        totalScroll.y =  123;
        totalScroll.addEventListener(TouchEvent.TOUCH, clickHandler);
    }

    private function sleepHandler(event:TouchEvent):void {

        var touch:Touch = event.getTouch(button);

        Mouse.cursor = MouseCursor.HAND;

        if(touch){
            if(touch.phase == TouchPhase.MOVED){
                var position:Point = touch.getLocation(button.parent);
                if(position.x < totalScroll.x){
                    this.scrollProcent = 0;
                }else if(position.x > totalScroll.x + totalScroll.width){
                    this.scrollProcent = 1;
                }else{
                    this.scrollProcent = ((position.x - totalScroll.x)/totalScroll.width);
                }
            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }
    }

    private function clickHandler(event:TouchEvent):void{
        var touch:Touch = event.getTouch(totalScroll);
        if(touch){
            var position:Point = new Point();
            if(touch.phase == TouchPhase.ENDED){
                Mouse.cursor = MouseCursor.ARROW;
                position = touch.getLocation(totalScroll);

                _scrollProcent =  (position.x/totalScroll.width);
                appModel.currentSpread = Math.round(appModel.arrBook.length * _scrollProcent);

            }else if(touch.phase == TouchPhase.MOVED){
                position = touch.getLocation(button.parent);

                if(position.x < totalScroll.x){
                    this.scrollProcent = 0;
                }else if(position.x > totalScroll.x + totalScroll.width){
                    this.scrollProcent = 1;
                }else{
                    this.scrollProcent = ((position.x - totalScroll.x)/totalScroll.width);
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

    public function get scrollProcent():Number{
        return _scrollProcent;
    }

    public function set scrollProcent(value:Number):void{
        if(value != _scrollProcent){
            _scrollProcent = value;

            //35 width van 1 pagina, 71 width van een spread
            var contentX:int = ((totalScroll.width/2)-35) - ((content.width-71) * _scrollProcent );
            setupTweenContent(contentX);

            var buttonX:uint = totalScroll.x + (totalScroll.width* scrollProcent) - (button.width/2);
            setupTweenButton(buttonX);
        }
    }

    private function setupTweenContent(value:int):void{
        if (tweenContent) tweenContent.reset(content, tweenspeed, Transitions.EASE_OUT);
        else tweenContent = new Tween(content, tweenspeed, Transitions.EASE_OUT);

        tweenContent.animate("x", value);
        Starling.juggler.add(tweenContent);
    }

    private function setupTweenButton(value:int):void{
        trace(value);
        if (tweenButton) tweenButton.reset(button, tweenspeed, Transitions.EASE_OUT);
        else tweenButton = new Tween(button, tweenspeed, Transitions.EASE_OUT);

        tweenButton.animate("x", value);
        Starling.juggler.add(tweenButton);
    }
}
}
