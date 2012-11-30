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
    public var titleX:int;
    public var titleY:int;
    public var titleWidth:int;
    public var titleHeight:int;

    public var paragraph:String;
    public var paragraphX:int;
    public var paragraphY:int;
    public var paragraphWidth:int;
    public var paragraphHeight:int;

    public var image1:ImageLoader;
    public var image1X:int;
    public var image1Y:int;
    public var image1Width:int;
    public var image1Height:int;

    public var pageNumber:int;
    public var pageNumberX:int;
    public var pageNumberY:int;
    public var pageNumberWidth:int;
    public var pageNumberHeight:int;

    public var index:String;
    public var indexX:int;
    public var indexY:int;
    public var indexWidth:int;
    public var indexHeight:int;

    public var style:String;


    /*************************************/
    //Constructor
    /*************************************/

    public function PageVO() {
        //Check welke attributen beschikbaar zijn in XML
        //Sla op in de variabelen
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
