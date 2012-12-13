/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 07/12/12
 * Time: 14:42
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.index {

import starling.display.Sprite;
import starling.text.TextField;

public class IndexButton extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    public var text:String;
    public var color:int;
    private var textfield:TextField;


    /*************************************/
    //Constructor
    /*************************************/

    public function IndexButton(text:String, color:int) {
        this.width = 162;
        this.height = 50;
        textfield = new TextField(162, 50, text, "Gotham", 12 ,color);
        textfield.hAlign = "left";
        addChild(textfield);

    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
