/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 30/11/12
 * Time: 09:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer.vo {
import org.osmf.elements.ImageLoader;

public class PageVO {
    /*************************************/
    //Properties
    /*************************************/
    public var title:String;
    public var titleX:int= 58;
    public var titleY:int= 57;
    public var titleWidth:int = 390;
    public var titleHeight:int = 400;

    public var paragraph:String = '';
    public var paragraphX:int = 75;
    public var paragraphY:int= 70;
    public var paragraphWidth:int = 351;
    public var paragraphHeight:int = 489;

    //public var image1:ImageLoader;
    public var imageUrl:String = "assets/img/";
    public var image1X:int = 64;
    public var image1Y:int = 46;
    public var image1Width:int = 391;
    public var image1Height:int = 585;

    public var pageNumber:int;
    public var pageNumberY:int = 675;
    public var pageNumberX_odd:int = 407;
    public var pageNumberX_even:int = 90;
    public var pageNumberWidth:int = 30;
    public var pageNumberHeight:int = 30;

    public var index:String;
    public var indexX:int = 95;
    public var indexY:int = 70;
    public var indexWidth:int=351;
    public var indexHeight:int = 30;

    public var chapter:String;
    public var chapterWidth:int = 200;
    public var chapterHeight:int = 30;
    public var chapterX:int = 65;
    public var chapterY:int = paragraphY + paragraphHeight + 140;



    public var style:String;

    /*************************************/
    //Constructor
    /*************************************/

    public function PageVO() {

    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
