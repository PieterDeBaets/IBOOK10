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

    private var backgroundTexture:Texture;
    private var backgroundImage:Image;

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

        backgroundTexture = appModel.atlas.getTexture('BasicCenterSpreadBackground');
        backgroundImage = new Image(backgroundTexture);
        backgroundImage.y = 0;
        backgroundImage.scaleY=1.2;
        addChild(backgroundImage);

        spread = new Spread();

        backgroundImage.x = Starling.current.stage.stageWidth/2 - backgroundImage.width/2;
    }

    /*************************************/
    //Methods
    /*************************************/

    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
