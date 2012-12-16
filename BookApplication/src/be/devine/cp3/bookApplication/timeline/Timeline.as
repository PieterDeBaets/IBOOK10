/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {

import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.BookApplication;

import flash.events.Event;

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
import starling.textures.Texture;
import starling.textures.TextureAtlas;


public class Timeline extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var background:Quad;
    private var btnTimelineTexture:Texture;
    private var btnTimeline:Image;

    private var timelineScroll:TimelineScroll;

    private var tween:Tween;
    private var tweenspeed:Number = 0.5;
    private var transparency:Number = 0.76;

    private var appModel:AppModel;


    /*************************************/
    //Constructor
    /*************************************/

    public function Timeline(){
        appModel = AppModel.getInstance();

        //background is asset
        background = new Quad(1024, 159, 0x000000);
        background.alpha = transparency;
        addChild(background);

        //instantie TimelineScroll
        timelineScroll = new TimelineScroll();
        addChild(timelineScroll);

        appModel.addEventListener(AppModel.TIMELINEVISIBLE_CHANGED, toggleVisibility);
        appModel.addEventListener(AppModel.CURRENT_SPREAD_CHANGED, changePosition);
        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);

        btnTimelineTexture= appModel.atlas.getTexture('timelineBtnUp');
        btnTimeline = new Image(btnTimelineTexture);
        btnTimeline.x = background.width - btnTimeline.width;
        btnTimeline.y = background.height;
        btnTimeline.alpha = transparency;
        btnTimeline.addEventListener(TouchEvent.TOUCH, checkHover);
        addChild(btnTimeline);

        toggleVisibility(null);

    }



    /*************************************/
    //Methods
    /*************************************/

    private function changePosition(event:flash.events.Event):void {
        timelineScroll.scrollProcent = appModel.currentSpread/(appModel.totalSpreads-1);
    }

    private function checkHover(event:TouchEvent){
        var touch:Touch = event.getTouch(this);

        if(touch){
            if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }else if(touch.phase == TouchPhase.ENDED){
                appModel.timelineVisible = !appModel.timelineVisible;
            }else if(touch.phase == TouchPhase.ENDED){
            }else if(touch.phase == TouchPhase.MOVED){
            }else{

            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }
    }

    private function keyHandler(event:KeyboardEvent){
        switch (event.keyCode){
            case Keyboard.UP:
                appModel.timelineVisible = false;
                break;
            case Keyboard.DOWN:
                appModel.timelineVisible = true;
                break;
        }
    }

    private function toggleVisibility(event:flash.events.Event){
        if(appModel.timelineVisible){
            btnTimeline.texture = appModel.atlas.getTexture('timelineBtnUp');
            setupTween(0);
        }else{
            btnTimeline.texture = appModel.atlas.getTexture('timelineBtnHover');
            setupTween(-this.height+btnTimeline.height);
        }
    }

    private function setupTween(value){
        if (tween) tween.reset(this, tweenspeed, Transitions.EASE_OUT);
        else tween = new Tween(this, tweenspeed, Transitions.EASE_OUT);

        tween.animate("y", value);
        Starling.juggler.add(tween);
    }

    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
