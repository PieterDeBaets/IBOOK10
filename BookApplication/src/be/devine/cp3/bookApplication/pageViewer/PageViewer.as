/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 29/11/12
 * Time: 15:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.Spread;

public class PageViewer {
    /*************************************/
    //Properties
    /*************************************/
    private var currentSpread:int;
    private var background:*; // BasicPageViewerBackground
    private var spread: Spread;
    private var appModel:AppModel;


    /*************************************/
    //Constructor
    /*************************************/

    public function PageViewer() {
        appModel = AppModel.getInstance();

        //instantie background (de gradients)
        //instantie Spread
        //Spread luistert naar CHANGE_CURRENT_SPREAD
        //animatie


    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
