/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.BookApplication;
import be.devine.cp3.bookApplication.pageViewer.Spread;

import flash.events.Event;

import starling.core.Starling;

import starling.display.Image;

import starling.display.Sprite;
import starling.display.Stage;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class PageViewer extends Sprite{
    /*************************************/
    //Properties
    /*************************************/
    private var currentSpread:int;
    private var spread: Spread;
    private var appModel:AppModel;



    /*************************************/
    //Constructor
    /*************************************/

    public function PageViewer() {
        //instantie background (de gradients)
        //instantie Spread
        //Spread luistert naar CHANGE_CURRENT_SPREAD
        //animatie
        trace("IN PAGEVIEWER");

        appModel = AppModel.getInstance();

        trace(appModel.arrBook[appModel.currentSpread]);
        appModel.addEventListener(AppModel.CURRENT_SPREAD_CHANGED, currentSpreadChangedHandler)

       // trace(appModel.currentSpread);
        //trace(appModel.arrBook);

    }


    /*************************************/
    //Methods
    /*************************************/

    private function currentSpreadChangedHandler(event:flash.events.Event):void {
        if(spread){
            spread.dispose();
            this.removeChild(spread);
        }

        spread = new Spread(appModel.arrBook[appModel.currentSpread]);
        addChild(spread);
        trace("IN CURRENTSPREADCHANGEDHANDLER PAGEVIEWER");


    }
    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
