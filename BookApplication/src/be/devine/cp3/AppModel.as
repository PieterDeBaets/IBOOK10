/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 23/11/12
 * Time: 11:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.bookApplication.BookApplication;

import flash.events.Event;
import flash.events.EventDispatcher;

import starling.textures.Texture;
import starling.textures.TextureAtlas;


public class AppModel extends EventDispatcher{
    /*************************************/
    //Properties
    /*************************************/

    [Embed(source='../../../../libs/IBookAssets.xml', mimeType='application/octet-stream')]
    public static const uiXml:Class;
    [Embed(source='../../../../libs/IBookAssets.png')]
    public static const uiTexture:Class;

    [Embed(source='../../../../libs/GothamMedium.otf', embedAsCFF="false", fontFamily='Gotham')]
    public static const HitRoad:Class;

    [Embed(source='../../../../libs/CENTURY.TTF', embedAsCFF="false", fontFamily='CENTURY')]
    public static const CENTURY:Class;

    public static var instance:AppModel;

    private var texture:Texture = Texture.fromBitmap(new uiTexture);
    private var xml:XML = XML(new uiXml);
    public var atlas:TextureAtlas = new TextureAtlas(texture, xml);

    //2 is random. gewoon om de setter te activeren de eerste keer.
    private var _currentSpread:int = 2;
    private var _currentChapter:int = 0;

    private var _totalPages:int = 0;
    private var _totalSpreads:int = 0;

    private var _arrBook:Array = []; // enkele spreads, niet in chapters opgedeeld
    private var _arrChapter:Array = [];
    private var _spreadsPerChapter:Array= new Array();
    private var _arrColors:Array = [0xDD675B, 0xE9D14E, 0x66BFB0, 0xCE3040,0x7A8A73, 0xFADBC2, 0x748B8A, 0x86778B, 0x64ACF1];

    private var _lightMode:Boolean = false;
    private var _timelineVisible:Boolean = false;
    private var _indexVisible:Boolean = false;

    public static const CURRENT_SPREAD_CHANGED:String="CURRENT_SPREAD_CHANGED";
    public static const LIGHTMODE_CHANGED:String="LIGHTMODE_CHANGED";
    public static const TIMELINEVISIBLE_CHANGED:String="TIMELINEVISIBLE_CHANGED";
    public static const INDEXVISIBLE_CHANGED:String="INDEXVISIBLE_CHANGED";

    /*************************************/
    //Constructor
    /*************************************/

    public function AppModel(enforcer:Enforcer) {
        if(enforcer == null){
            throw new Error('AppModel is a singleton');
        }
    }

    /*************************************/
    //Methods
    /*************************************/

    public static function getInstance():AppModel{
        if(instance == null){
            instance = new AppModel(new Enforcer());
        }
        return instance;
    }

    /*************************************/
    //Getters & Setters
    /*************************************/

    public function get currentSpread():int {
        return _currentSpread;
    }

    public function set currentSpread(value:int):void {
        if(value != _currentSpread){
            _currentSpread = value;
            if(_currentSpread < 0){
                _currentSpread = 0;
            }else if(_currentSpread > (arrBook.length -1)){
                _currentSpread = arrBook.length -1;
            }

            dispatchEvent(new Event(CURRENT_SPREAD_CHANGED))
        }
    }


    public function get totalPages():int {
        return _totalPages;
    }

    public function set totalPages(value:int):void {
        if(value != _totalPages){
            _totalPages = value;
        }
    }


    public function get totalSpreads():int {
        return _totalSpreads;
    }

    public function set totalSpreads(value:int):void {
        if(value != _totalSpreads){
            _totalSpreads = value;
        }
    }


    public function get arrBook():Array {
        return _arrBook;
    }

    public function set arrBook(value:Array):void {
        if(value != _arrBook){
            _arrBook = value;
        }
    }


    public function get arrChapter():Array {
        return _arrChapter;
    }

    public function set arrChapter(value:Array):void {
        if(value != _arrChapter){
            _arrChapter = value;
        }
    }


    public function get spreadsPerChapter():Array {
        return _spreadsPerChapter;
    }

    public function set spreadsPerChapter(value:Array):void {
        if(value != _spreadsPerChapter){
            _spreadsPerChapter = value;
        }
    }


    public function get arrColors():Array {
        return _arrColors;
    }

    public function set arrColors(value:Array):void {
        if(value != _arrColors){
            _arrColors = value;
        }
    }


    public function get lightMode():Boolean {
        return _lightMode;
    }

    public function set lightMode(value:Boolean):void {
        if(value != _lightMode){
            _lightMode = value;
            dispatchEvent(new Event(LIGHTMODE_CHANGED));
        }
    }


    public function get timelineVisible():Boolean {
        return _timelineVisible;
    }

    public function set timelineVisible(value:Boolean):void {
        if(_timelineVisible != value){
            _timelineVisible = value;
            dispatchEvent(new Event(TIMELINEVISIBLE_CHANGED));
        }

    }


    public function get indexVisible():Boolean {
        return _indexVisible;
    }

    public function set indexVisible(value:Boolean):void {
        if(_indexVisible != value){
            _indexVisible = value;
            dispatchEvent(new flash.events.Event(INDEXVISIBLE_CHANGED,true));
        }

    }

    public function get currentChapter():int {
        return _currentChapter;
    }

    public function set currentChapter(value:int):void {
        _currentChapter = value;
    }
}
}

internal class Enforcer{};
