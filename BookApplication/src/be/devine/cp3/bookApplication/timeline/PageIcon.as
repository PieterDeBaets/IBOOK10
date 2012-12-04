/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.timeline.vo.PageIconVO;

import flash.display.MovieClip;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;

public class PageIcon extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var icon:MovieClip; //uit flash-assets met verschillende frames
    private var background:Sprite;
    private var pageNumber:int;
    private var arrColors:Vector.<String>;

    private var appModel:AppModel;
    /*************************************/
    //Constructor
    /*************************************/

    public function PageIcon(data:PageIconVO, pageNumberString:uint) {
        //juiste backgroundkleur instellen adhv data
        //juiste invulling van icon instellen adhv data

        appModel = AppModel.getInstance();
        this.pageNumber = pageNumberString;

        var backgroundColor:Quad = new Quad(33, 46, appModel.arrColors[data.chapter-1]);
        addChild(backgroundColor);

        var pageNumber:starling.text.TextField = new TextField(backgroundColor.width, 20, String(pageNumberString), "Century", 14, 0xffffff);
        pageNumber.y = backgroundColor.height;
        addChild(pageNumber);

        this.addEventListener(TouchEvent.TOUCH, newPageSelected);
    }

    private function newPageSelected(event:TouchEvent){
        if(event.getTouch(this, TouchPhase.BEGAN)){
            trace("De nieuwe pagina is: " + pageNumber);
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
