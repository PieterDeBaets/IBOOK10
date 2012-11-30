/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.bookApplication.timeline.vo.PageIconVO;

import flash.display.MovieClip;
import flash.display.Sprite;

public class PageIcon {
    /*************************************/
    //Properties
    /*************************************/
    private var icon:MovieClip; //uit flash-assets met verschillende frames
    private var background:Sprite;
    private var pageNumber:int;
    private var arrColors:Vector.<String>;


    /*************************************/
    //Constructor
    /*************************************/

    public function PageIcon(data:PageIconVO) {
        //juiste backgroundkleur instellen adhv data
        //juiste invulling van icon instellen adhv data

    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
