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

import flash.events.Event;

import flash.system.ApplicationDomain;

import starling.display.Sprite;
import starling.events.Event;

public class Content extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var totalSpreads:int;
    private var currentSpread:int;
    private var spreadIconArray:Array;

    private var appModel:AppModel;


    /*************************************/
    //Constructor
    /*************************************/

    public function Content(){

        appModel = AppModel.getInstance();

        var spreadContainer:Sprite = new Sprite();
        spreadIconArray = new Array();
        spreadContainer.y = 25;
        spreadContainer.x = 18;
        var xpos:uint = 0;

        for each(var spread:SpreadVO in appModel.arrBook){
            var spreadIcon:SpreadIcon = new SpreadIcon(spread.page1, spread.page2, spread.chapterIndex, spread.spreadNumber);
            spreadIconArray.push(spreadIcon);
            spreadIcon.x = xpos;
            spreadContainer.addChild(spreadIcon);
            xpos += spreadIcon.width + 21;
        }
        addChild(spreadContainer);
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
