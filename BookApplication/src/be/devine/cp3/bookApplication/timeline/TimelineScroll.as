/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.timeline.scrollbar.ScrollBar;
import be.devine.cp3.bookApplication.timeline.scrollbar.ScrollBarOptions;

import starling.display.Quad;

import starling.display.Sprite;

public class TimelineScroll extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var scrollbar:ScrollBar;
    private var scrollbarOptions:ScrollBarOptions;
    private var totalSpreads:int;
    private var spreadsPerChapter:Array;
    private var content:Content;

    private var appModel:AppModel;

    /*************************************/
    //Constructor
    /*************************************/

    public function TimelineScroll() {

        appModel = AppModel.getInstance();
        //uitpluizen hoe je content in de scrollbar krijgt
        //scrollbar.position wordt upgedated adhv CURRENT_PAGE_CHANGE event uit appmodel
        generateScrollBar();
        generateContent();
    }

    private function generateContent(){
        content = new Content();
        addChild(content);
    }

    private function generateScrollBar(){
        var totalScroll:Sprite = new Sprite();
        var maxWidth = 1024-36;

        var xPos:uint = 0;
        for(var i:uint = 0; i < appModel.spreadsPerChapter.length; i++){
            var chapterWidth:uint = (appModel.spreadsPerChapter[i] / appModel.arrBook.length) * maxWidth;
            trace(chapterWidth);
            trace(appModel.spreadsPerChapter[i]);

            //als de kleuren op zijn begint hij opnieuw bij het eerste kleur
            if(i<appModel.arrColors.length){
                var color:uint = appModel.arrColors[i];
            }else{
                var color:uint = appModel.arrColors[i-appModel.arrColors.length];
            }

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

}
}
