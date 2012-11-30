
package be.devine.cp3.bookApplication.timeline.scrollbar {
public class ScrollBarOptions {
    private var _width:Number;
    private var _height:Number;
    private var _thumbcolor:Number;
    private var _trackcolor:Number;
    private var _thumbheight:Number;
    public function ScrollBarOptions() {
    }

    public function get width():Number {
        return _width;
    }

    public function set width(value:Number):void {
        _width = value;
    }

    public function get height():Number {
        return _height;
    }

    public function set height(value:Number):void {
        _height = value;
    }

    public function get thumbcolor():Number {
        return _thumbcolor;
    }

    public function set thumbcolor(value:Number):void {
        _thumbcolor = value;
    }

    public function get trackcolor():Number {
        return _trackcolor;
    }

    public function set trackcolor(value:Number):void {
        _trackcolor = value;
    }

    public function get thumbheight():Number {
        return _thumbheight;
    }

    public function set thumbheight(value:Number):void {
        _thumbheight = value;
    }
}
}
