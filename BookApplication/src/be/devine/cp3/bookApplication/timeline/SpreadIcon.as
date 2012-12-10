/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.factory.PageIconVOFactory;
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;

import flash.events.Event;

import flash.ui.Mouse;
import flash.ui.MouseCursor;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class SpreadIcon extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var pageIcon1:PageIcon;
    private var pageIcon2:PageIcon;
    private var chapterIndex:uint;
    public var spreadNumber:uint;

    private var appModel:AppModel;

    private var borderQuad1:Quad;
    private var borderQuad2:Quad;


    /*************************************/
    //Constructor
    /*************************************/

    public function SpreadIcon(page1:PageVO, page2:PageVO, chapter, spreadNumber) {

        appModel = AppModel.getInstance();

        chapterIndex = chapter;
        this.spreadNumber = spreadNumber;

        //clickevent op this dispatcht CURRENT_PAGE_CHANGE
        var xpos:uint = 0;
        var thumbnailContainer:Sprite = new Sprite();

        var pageIcon:PageIcon = new PageIcon(PageIconVOFactory.createPageIconVO(page1.style, chapterIndex), page1.pageNumber);
        pageIcon.x = xpos;
        thumbnailContainer.addChild(pageIcon);

        xpos += pageIcon.width + 6;

        var pageIcon2:PageIcon = new PageIcon(PageIconVOFactory.createPageIconVO(page2.style, chapterIndex), page2.pageNumber);
        pageIcon2.x = xpos;
        thumbnailContainer.addChild(pageIcon2);

        addChild(thumbnailContainer);
        this.flatten();

        this.addEventListener(TouchEvent.TOUCH, selectNewSpread);
        appModel.addEventListener(AppModel.CURRENT_SPREAD_CHANGED, toggleBorder);

        //xpos += pageIcon2.width + 21;

        //toggleBorder(true);
    }

    private function selectNewSpread(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                //trace(this.spreadNumber);
                appModel.currentSpread = this.spreadNumber;
            }else if(touch.phase == TouchPhase.HOVER){
                Mouse.cursor = MouseCursor.BUTTON;
            }
        }else{
            Mouse.cursor = MouseCursor.ARROW;
        }

    }

    public function toggleBorder(event:Event){
        this.unflatten();
        if(this.spreadNumber == appModel.currentSpread){
            if(appModel.currentSpread != 0){
                borderQuad1 = new Quad(37, 50, 0xfcfdfd);
                addChild(borderQuad1);
                borderQuad1.x = borderQuad1.y =-2;
                setChildIndex(borderQuad1, 0);
            }

            borderQuad2 = new Quad(37, 50, 0xfcfdfd);
            addChild(borderQuad2);
            borderQuad2.x = 37;
            borderQuad2.y = -2;
            setChildIndex(borderQuad2, 0);
        }else{
            if(borderQuad1){
                removeChild(borderQuad1);
            }

            if(borderQuad2){
                removeChild(borderQuad2);
            }
        }

        this.flatten();
    }

    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
