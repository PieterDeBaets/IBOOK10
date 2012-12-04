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
import be.devine.cp3.bookApplication.starlingExtensions.PixelMaskDisplayObject;

import flash.ui.Keyboard;

import starling.animation.Tween;
import starling.display.Image;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Timeline extends starling.display.Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var texture:Texture = Texture.fromBitmap(new BookApplication.uiTexture);
    private var xml:XML = XML(new BookApplication.uiXml);
    private var atlas:TextureAtlas = new TextureAtlas(texture, xml);

    private var isVisible:Boolean;
    private var timelineScroll:TimelineScroll;

    private var background:Sprite;
    private var tween:Tween;

    private var appModel:AppModel;

    /*************************************/
    //Constructor
    /*************************************/

    public function Timeline(){
        appModel = AppModel.getInstance();

        //background is asset
        var backgroundTexture:Texture = atlas.getTexture('BasicTimelineBackground');
        var backgroundImage:Image = new Image(backgroundTexture);
        backgroundImage.alpha = 0.76;
        addChild(backgroundImage);

        //check isVisible in appmodel
        if(appModel.timelineVisible){
            trace('tijdslijn visible');
            toggleVisibility('show');
        }else{
            trace('tijdslijn niet visible');
            toggleVisibility('hide');
        }

        this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);

        //instantie TimelineScroll
    }

    public function addedToStage(event:Event){
        //TODO added to stage vervangen
        //slide up en slide down toggle op pijltje
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function keyHandler(event:KeyboardEvent){
        switch (event.keyCode){
            case Keyboard.UP:
                toggleVisibility('hide');
                trace('hide timeline');
                break;
            case Keyboard.DOWN:
                toggleVisibility('show');
                trace('show timeline');
                break;
        }
    }

    private function toggleVisibility(state:String){
        switch (state){
            case'show':
                this.y = 0;
                break;
            case'hide':
                this.y = -this.height;
                break;
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
