/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.timeline {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.BookApplication;
import be.devine.cp3.bookApplication.timeline.vo.PageIconVO;

import starling.display.Image;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class PageIcon extends Sprite{
    /*************************************/
    //Properties
    /*************************************/

    /*private var texture:Texture = Texture.fromBitmap(new BookApplication.uiTexture);
    private var xml:XML = XML(new BookApplication.uiXml);
    private var atlas:TextureAtlas = new TextureAtlas(texture, xml);*/

    private var iconTexture:Texture;
    private var iconImage:Image;

    private var pageNumber:int;

    private var appModel:AppModel;

    /*************************************/
    //Constructor
    /*************************************/

    public function PageIcon(data:PageIconVO, pageNumberString:uint) {
        //juiste backgroundkleur instellen adhv data
        //juiste invulling van icon instellen adhv data

        appModel = AppModel.getInstance();
        this.pageNumber = pageNumberString;

        var backgroundColor:Quad = new Quad(33, 46, appModel.arrColors[(data.chapter-1)%appModel.arrColors.length]);
        addChild(backgroundColor);

        var pageNumber:starling.text.TextField = new TextField(backgroundColor.width, 20, String(pageNumberString), "Century", 14, 0xffffff);
        pageNumber.y = backgroundColor.height;
        addChild(pageNumber);

        /*iconTexture = atlas.getTexture('textIcon');
        iconImage = new Image(iconTexture);
        addChild(iconImage);*/

        this.addEventListener(TouchEvent.TOUCH, newPageSelected);
    }

    private function newPageSelected(event:TouchEvent){
        if(event.getTouch(this, TouchPhase.BEGAN)){
            trace("De nieuwe pagina is: " + pageNumber);
        }
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
