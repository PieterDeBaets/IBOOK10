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


    /*************************************/
    //Constructor
    /*************************************/

    public function SpreadIcon(page1:PageVO, page2:PageVO, chapter, spreadNumber) {

        appModel = AppModel.getInstance();

        chapterIndex = chapter;
        this.spreadNumber = spreadNumber;

        //clickevent op this dispatcht CURRENT_PAGE_CHANGE
        trace('page 1: ' +page1.style);
        trace('page 2: ' + page2.style);

        var xpos:uint = 0;
        var thumbnailContainer:Sprite = new Sprite();

        var pageIcon:PageIcon = new PageIcon(PageIconVOFactory.createPageIconVO(page1.style, chapterIndex), page1.pageNumber);
        pageIcon.x = xpos;
        thumbnailContainer.addChild(pageIcon);

        xpos += pageIcon.width + 4;

        var pageIcon2:PageIcon = new PageIcon(PageIconVOFactory.createPageIconVO(page2.style, chapterIndex), page2.pageNumber);
        pageIcon2.x = xpos;
        thumbnailContainer.addChild(pageIcon2);

        addChild(thumbnailContainer);
        this.flatten();

        this.addEventListener(TouchEvent.TOUCH, selectNewSpread)
        //xpos += pageIcon2.width + 21;

    }

    private function selectNewSpread(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this);
        if(touch){
            if(touch.phase == TouchPhase.BEGAN){
                //trace(this.spreadNumber);
                appModel.currentSpread = this.spreadNumber;
            }
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
