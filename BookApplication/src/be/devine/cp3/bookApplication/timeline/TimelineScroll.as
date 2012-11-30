/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.bookApplication.timeline.scrollbar.ScrollBar;
import be.devine.cp3.bookApplication.timeline.scrollbar.ScrollBarOptions;

import flash.display.Sprite;

public class TimelineScroll extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var scrollbar:ScrollBar;
    private var scrollbarOptions:ScrollBarOptions;
    private var totalSpreads:int;
    private var spreadsPerChapter:Array;
    private var content:Content;

    /*************************************/
    //Constructor
    /*************************************/

    public function TimelineScroll() {
        //uitpluizen hoe je content in de scrollbar krijgt
        //scrollbar.position wordt upgedated adhv CURRENT_PAGE_CHANGE event uit appmodel

    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
