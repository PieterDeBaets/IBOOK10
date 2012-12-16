/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:24
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.controls {
import be.devine.cp3.AppModel;

import flash.display.MovieClip;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.ui.Keyboard;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

import starling.core.Starling;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.KeyboardEvent;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Controls extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var nextButton:Image; // Komt uit assets
    private var prevButton:Image; // Komt uit assets
    private var lightSwitch:Image; // Komt uit assets
    private var currentPage:int;
    private var totalPages:int;

    private var appModel:AppModel;


    /*************************************/
    //Constructor
    /*************************************/

    public function Controls() {

        appModel = AppModel.getInstance();

        var nextButtonTexture = appModel.atlas.getTexture('BasicNextButton');
        nextButton = new Image(nextButtonTexture);
        nextButton.x = Starling.current.stage.stageWidth - nextButton.width;
        nextButton.y = Starling.current.stage.stageHeight - nextButton.height;
        nextButton.addEventListener(TouchEvent.TOUCH, nextPageHandler);
        addChild(nextButton);

        var prevButtonTexture = appModel.atlas.getTexture('BasicPrevButton');
        prevButton = new Image(prevButtonTexture);
        prevButton.x = 0;
        prevButton.y = Starling.current.stage.stageHeight - nextButton.height;
        prevButton.addEventListener(TouchEvent.TOUCH, prevPageHandler);
        addChild(prevButton);

        var lightSwitchTexture = appModel.atlas.getTexture('lightoff');
        lightSwitch = new Image(lightSwitchTexture);
        lightSwitch.x =18;
        lightSwitch.y = 11;
        lightSwitch.alpha = 0.3;
        lightSwitch.addEventListener(TouchEvent.TOUCH, lightMode);
        addChild(lightSwitch);

        appModel.addEventListener(AppModel.CURRENT_SPREAD_CHANGED, checkIfLastOrFirst);
        appModel.addEventListener(AppModel.LIGHTMODE_CHANGED, lightModeChanged);

        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function lightModeChanged(event:Event):void {
        if(appModel.lightMode){
            lightSwitch.texture = appModel.atlas.getTexture('lighton');
            lightSwitch.alpha = 1;
        }else{
            lightSwitch.texture = appModel.atlas.getTexture('lightoff');
            lightSwitch.alpha = 0.3;
        }

        checkIfLastOrFirst(null);
    }

    private function checkIfLastOrFirst(event:Event):void {
        if(appModel.currentSpread == 0){
            prevButton.alpha = 0;
            prevButton.removeEventListener(TouchEvent.TOUCH, prevPageHandler);
            Mouse.cursor = MouseCursor.ARROW;
        }else if(appModel.currentSpread == appModel.arrBook.length-1){
            nextButton.alpha = 0;
            nextButton.removeEventListener(TouchEvent.TOUCH, prevPageHandler);
            Mouse.cursor = MouseCursor.ARROW;
        }else{
            if(appModel.lightMode){
                prevButton.alpha = nextButton.alpha = 0.3;
            }else{
                prevButton.alpha = nextButton.alpha = 1;
            }

            if(!prevButton.hasEventListener(TouchEvent.TOUCH)){
                prevButton.addEventListener(TouchEvent.TOUCH, prevPageHandler);
            }

            if(! nextButton.hasEventListener(TouchEvent.TOUCH)){
                nextButton.addEventListener(TouchEvent.TOUCH, prevPageHandler);
            }
            Mouse.cursor = MouseCursor.BUTTON;
        }
    }

    private function lightMode(event:TouchEvent):void {
        var touch:Touch = event.getTouch(lightSwitch);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                appModel.lightMode = !appModel.lightMode;

            }else if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }
    }


    private function keyHandler(event:KeyboardEvent):void {
        switch (event.keyCode){
            case Keyboard.RIGHT:
                appModel.currentSpread ++;
                break;
            case Keyboard.LEFT:
                appModel.currentSpread --;
                break;
            case Keyboard.L:
                appModel.lightMode = !appModel.lightMode;
                lightModeChanged(null);
                break;
        }
    }

    private function prevPageHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(prevButton);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                appModel.currentSpread --;
                appModel.indexVisible = false;
            }else if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }
    }

    private function nextPageHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(nextButton);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                appModel.currentSpread ++;
                appModel.indexVisible = false;
            }else if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }

        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
