
package be.devine.cp3.bookApplication.timeline.scrollbar {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

public class ScrollBar extends Sprite{
    private var _config:ScrollBarOptions;
    private var _track:Sprite;

    private var _thumb:Sprite;

    private var _position:Number;

    private var _bounds:Rectangle;
    public static const POSITION_UPDATED:String = 'POSITION_UPDATED';

    public function ScrollBar(config:ScrollBarOptions) {
        _config = config;
        this.createTrack();
        this.createThumb();
        if (config != null)
        {
            _bounds = new Rectangle(0,0,0,_config.height-_config.thumbheight);
        }
        else
        {
            _bounds = new Rectangle(0,0,0,100-20);
        }
        _thumb.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
    }

    private function mouseDownHandler(event:MouseEvent):void {
        _thumb.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        _thumb.startDrag(false,_bounds);
    }

    private function mouseMoveHandler(event:MouseEvent):void {

        position = _thumb.y / (_config.height-_config.thumbheight);

    }

    private function mouseUpHandler(event:MouseEvent):void {
        stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        _thumb.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        _thumb.stopDrag();
    }

    private function createTrack():void{
        _track = new Sprite();
        if (_config != null)
        {
            _track.graphics.beginFill(_config.trackcolor,1);
            _track.graphics.drawRect(0,0,_config.width,_config.height);
        }
        else
        {
            _track.graphics.beginFill(0x000000,1);
            _track.graphics.drawRect(0,0,20,100);
        }
        _track.graphics.endFill();
        addChild(_track);
    }
    private function createThumb():void{
        _thumb = new Sprite();
        if (_config != null)
        {
            _thumb.graphics.beginFill(_config.thumbcolor,1);
            _thumb.graphics.drawRect(0,0,_config.width,_config.thumbheight);
        }
        else
        {
            _thumb.graphics.beginFill(0x555555,1);
            _thumb.graphics.drawRect(0,0,20,20);
        }
        _thumb.graphics.endFill();
        _thumb.buttonMode = true;
        addChild(_thumb);
    }


    public function get position():Number {
        return _position;
    }

    public function set position(value:Number):void {
        if(_position != value)
        {
            _position = value;

            dispatchEvent(new Event(POSITION_UPDATED));
        }
    }
}
}
