/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 30/11/12
 * Time: 09:14
 * To change this template use File | Settings | File Templates.
 */
package {
import be.devine.cp3.bookApplication.BookApplication;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import starling.core.Starling;

[SWF(frameRate=60)]
public class Main extends Sprite {
    /*************************************/
    //Properties
    /*************************************/

    private var starling:Starling;

    /*************************************/
    //Constructor
    /*************************************/
    public function Main() {
        //stage settings
        //andere settings om het frame goed te stellen (Desktop-specifiek)
        //preloader laadt bookApplication in

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        starling = new Starling(BookApplication, stage);
        starling.start();
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
