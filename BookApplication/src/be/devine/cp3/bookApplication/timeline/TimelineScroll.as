/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.BookApplication;
import be.devine.cp3.bookApplication.timeline.scrollbar.ScrollBar;
import be.devine.cp3.bookApplication.timeline.scrollbar.ScrollBarOptions;

import flash.geom.Point;

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
import starling.textures.TextureAtlas;

public class TimelineScroll extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var scrollbar:ScrollBar;
    private var scrollbarOptions:ScrollBarOptions;
    private var totalSpreads:int;
    private var spreadsPerChapter:Array;
    private var _scrollProcent:Number;
    private var content:Content;

    private var appModel:AppModel;

    private var totalScroll:Sprite;

    private var button:Image;
    private var buttonTexture:Texture;
    private var texture:Texture = Texture.fromBitmap(new BookApplication.uiTexture);
    private var xml:XML = XML(new BookApplication.uiXml);
    private var atlas:TextureAtlas = new TextureAtlas(texture, xml);

    private var tween:Tween;
    private var tweenspeed:Number = 0.5;

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

    private function addButton(){
        buttonTexture= atlas.getTexture('scrubber');
        button = new Image(buttonTexture);
        button.x = totalScroll.x - (button.width/2) + 5;
        button.y = totalScroll.y -(button.height/2) + 5;
        addChild(button);

        button.addEventListener(TouchEvent.TOUCH, sleepHandler)
    }

    private function sleepHandler(event:TouchEvent):void {

        var touch:Touch = event.getTouch(button);

        if(touch){
            if(touch.phase == TouchPhase.MOVED){
                var position:Point = touch.getLocation(button.parent);
                button.x = position.x -  (button.width/2) + 5;

                if(button.x > totalScroll.x + totalScroll.width - ((button.width/2) + 5 ) ){
                    button.x = totalScroll.x + totalScroll.width -  ((button.width/2) + 5);
                }else if(button.x < totalScroll.x - ((button.width/2) - 5 )){
                    button.x = totalScroll.x - ((button.width/2) - 5 );
                }

                var scrollPosition = button.x - totalScroll.x + (button.width/2) - 5;
                var totalPosition = totalScroll.width - totalScroll.x + (button.width+5)/2 -10;
                scrollProcent = scrollPosition/totalPosition;

            }else if(touch.phase == TouchPhase.ENDED){

            }
        }
    }

    private function generateContent(){
        content = new Content();
        content.x = (totalScroll.width/2)-35;
        addChild(content);
    }

    private function generateScrollBar(){
        totalScroll = new Sprite();
        var maxWidth = 1024-36;

        var xPos:uint = 0;
        for(var i:uint = 0; i < appModel.spreadsPerChapter.length; i++){
            var chapterWidth:uint = (appModel.spreadsPerChapter[i] / appModel.arrBook.length) * maxWidth;
            trace(chapterWidth);
            trace(appModel.spreadsPerChapter[i]);

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

    }

    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

    public function get scrollProcent():Number {
        return _scrollProcent;
    }

    public function set scrollProcent(value:Number):void {
        if(value != _scrollProcent){
            _scrollProcent = value;
            trace(_scrollProcent);
            //content.x = ((totalScroll.width/2)-35) - ((content.width-71) * _scrollProcent );
            setupTween(((totalScroll.width/2)-35) - ((content.width-71) * _scrollProcent ));
        }
    }

    private function setupTween(value){
        trace('set up tween');
        if (tween) tween.reset(content, tweenspeed, Transitions.EASE_OUT);
        else tween = new Tween(content, tweenspeed, Transitions.EASE_OUT);

        trace('bla');
        tween.animate("x", value);
        Starling.juggler.add(tween);
    }
}
}
