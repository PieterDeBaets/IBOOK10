/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 23/11/12
 * Time: 11:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher{
    /*************************************/
    //Properties
    /*************************************/

    public static var instance:AppModel;

    private var currentSpread:int;
    private var totalPages:int;
    private var totalSpreads:int;

    private var arrBook:Array; // enkele spreads, niet in chapters opgedeeld
    private var arrChapter:Array;
    private var spreadsPerChapter:Array;
    private var arrColors:Array;

    private var lightMode:Boolean;
    private var timelineVisible:Boolean;
    private var indexVisible:Boolean;


    /*************************************/
    //Constructor
    /*************************************/

    public function AppModel(enforcer:Enforcer) {
        trace("hier gaat er veel info in bijgehouden worden!");

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

}
}

internal class Enforcer{};
