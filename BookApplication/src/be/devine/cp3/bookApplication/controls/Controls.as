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

        var lightSwitchTexture = appModel.atlas.getTexture('BasicLightOn');
        lightSwitch = new Image(lightSwitchTexture);
        lightSwitch.x =18;
        lightSwitch.y = 11;
        lightSwitch.alpha = 0.3;
        lightSwitch.addEventListener(TouchEvent.TOUCH, lightModeChanged);
        addChild(lightSwitch);

        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function lightModeChanged(event:TouchEvent):void {
        var touch:Touch = event.getTouch(lightSwitch);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                appModel.lightMode = !appModel.lightMode;
                trace(appModel.lightMode);
            }else if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }
    }

    private function keyHandler(event:KeyboardEvent):void {
        trace('------------');
        switch (event.keyCode){
            case Keyboard.RIGHT:
                appModel.currentSpread ++;
                break;
            case Keyboard.LEFT:
                appModel.currentSpread --;
                break;
        }
    }

    private function prevPageHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(prevButton);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                trace('prev page');
                appModel.currentSpread --;
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
                trace('next page');
                appModel.currentSpread ++;
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
