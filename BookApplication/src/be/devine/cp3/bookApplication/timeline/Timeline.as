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

import flash.ui.Keyboard;

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
    private var texture:Texture = Texture.fromBitmap(new BookApplication.uiTexture);
    private var xml:XML = XML(new BookApplication.uiXml);
    private var atlas:TextureAtlas = new TextureAtlas(texture, xml);

    private var background:Quad;
    private var btnTimelineTexture:Texture;
    private var btnTimeline:Image;

    private var isVisible:Boolean;
    private var timelineScroll:TimelineScroll;

    //private var tween:Tween;
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

        this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        appModel.addEventListener(AppModel.TIMELINEVISIBLE_CHANGED, toggleVisibility);

        toggleVisibility(null);

    }

    private function addedToStage(event:Event){
        //TODO added to stage vervangen

        //slide up en slide down toggle op pijltje
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function checkHover(event:TouchEvent){
        var touch:Touch = event.getTouch(this);

        if(touch){
            if(touch.phase == TouchPhase.HOVER){
            }else if(touch.phase == TouchPhase.BEGAN){
                appModel.timelineVisible = !appModel.timelineVisible;
            }else if(touch.phase == TouchPhase.ENDED){
            }else if(touch.phase == TouchPhase.MOVED){
            }else{
            }
        }
    }

    private function createBtn(state:String){
        if(btnTimeline != null){
            btnTimeline.removeEventListeners();
            btnTimeline.removeFromParent();
        }

        if(state == 'hover'){
            btnTimelineTexture= atlas.getTexture('timelineBtnHover');
            btnTimeline = new Image(btnTimelineTexture);
        }else{
            btnTimelineTexture= atlas.getTexture('timelineBtn');
            btnTimeline = new Image(btnTimelineTexture);
        }

        btnTimeline.x = background.width - btnTimeline.width;
        btnTimeline.y = background.height;
        btnTimeline.alpha = transparency;
        btnTimeline.addEventListener(TouchEvent.TOUCH, checkHover);
        addChild(btnTimeline);
    }


    private function keyHandler(event:KeyboardEvent){
        switch (event.keyCode){
            case Keyboard.UP:
                appModel.timelineVisible = false;
                trace('hide timeline');
                break;
            case Keyboard.DOWN:
                appModel.timelineVisible = true;
                trace('show timeline');
                break;
        }
    }

    private function toggleVisibility(state:String){
        if(appModel.timelineVisible){
            createBtn('hover');
            this.y = 0;
        }else{
            createBtn('normal');
            this.y = -this.height+btnTimeline.height;
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
