/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer {

import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.Page;
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.SpreadVO;

import starling.core.Starling;


import starling.display.Sprite;

public class Spread extends starling.display.Sprite{
    /*************************************/
    //Properties
    /*************************************/
    //private var background:BasicSpreadBackground;
    private var page1:Page;
    private var page2:Page;
    private var spreadChapter:int;
    private var appModel:AppModel;



    /*************************************/
    //Constructor
    /*************************************/

    public function Spread(data:SpreadVO) {
        appModel = AppModel.getInstance();
        trace("IN SPREAD");

        spreadChapter = data.chapterIndex;

        page1 = new Page(data.page1);
        page1.x = 0;
        page1.y = 0;
        addChild(page1);

        page2 = new Page(data.page2);
        page2.x = Starling.current.stage.stageWidth/2;
        page2.y = 0;

        addChild(page2);


        trace(data.page1.pageNumber);







        //2 instanties page



    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
