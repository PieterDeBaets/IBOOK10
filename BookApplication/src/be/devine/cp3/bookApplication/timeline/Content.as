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
import be.devine.cp3.bookApplication.factory.PageVOFactory;
import be.devine.cp3.bookApplication.pageViewer.Page;
import be.devine.cp3.bookApplication.pageViewer.vo.SpreadVO;
import be.devine.cp3.bookApplication.timeline.SpreadIcon;

import flash.system.ApplicationDomain;

import starling.display.Sprite;

public class Content extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var totalSpreads:int;
    private var currentSpread:int;
    private var arrBook:Array;
    private var spreadIcon:SpreadIcon;

    private var appModel:AppModel;


    /*************************************/
    //Constructor
    /*************************************/

    public function Content(){

        appModel = AppModel.getInstance();

        var thumbnailContainer:Sprite = new Sprite();
        thumbnailContainer.y = 25;
        thumbnailContainer.x = 18;
        var xpos:uint = 0;

        for each(var spread:SpreadVO in appModel.arrBook){
            var pageIcon:PageIcon = new PageIcon(PageIconVOFactory.createPageIconVO(spread.page1.style, spread.chapterIndex), spread.page1.pageNumber);
            pageIcon.x = xpos;
            thumbnailContainer.addChild(pageIcon);

            xpos += pageIcon.width + 4;

            var pageIcon2:PageIcon = new PageIcon(PageIconVOFactory.createPageIconVO(spread.page2.style, spread.chapterIndex), spread.page2.pageNumber);
            pageIcon2.x = xpos;
            thumbnailContainer.addChild(pageIcon2);

            xpos += pageIcon2.width + 21;

            /*trace(appModel.arrChapter[spread.chapterIndex-1]);
            trace(spread.page1.style);
            trace(spread.page2.style);*/
        }

        addChild(thumbnailContainer);
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
