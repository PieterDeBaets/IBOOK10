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
import starling.events.Event;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class PageIcon extends Sprite{
    /*************************************/
    //Properties
    /*************************************/

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

        trace(data.style);
        switch (data.style){
            case 'text':
                iconTexture = appModel.atlas.getTexture('textIcon');
                break;
            case 'front':
                iconTexture = appModel.atlas.getTexture('titleIcon');
                break;
            case 'empty':
                iconTexture = null;
                break;
            case 'index':
                iconTexture = appModel.atlas.getTexture('indexIcon');
                break;
            case 'image':
                iconTexture = appModel.atlas.getTexture('imageIcon');
                break;
        }

        if(iconTexture != null){
            iconImage = new Image(iconTexture);
            iconImage.alpha = 0.76;
            addChild(iconImage);
        }

        if(pageNumberString == 0){
            pageNumber.alpha = 0;
            backgroundColor.alpha = 0;
        }else{
            this.addEventListener(TouchEvent.TOUCH, newPageSelected);
        }

        this.flatten();
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
