package be.devine.cp3.BookApplication {

import be.devine.cp3.AppModel;

import flash.display.Sprite;
import flash.text.TextField;

public class BookApplication extends Sprite {
    /*************************************/
    //Properties
    /*************************************/
    private var appModel:AppModel;

    /*************************************/
    //Constructor
    /*************************************/

    public function BookApplication() {
        var textField:TextField = new TextField();
        textField.text = "IBOOK 10 start";
        addChild(textField);
        trace("start up IBOOK10");

        appModel = AppModel.getInstance();
        trace(appModel);
        
        //instantie RequestQueue
        //xml inladen
        //instantie Appmodel
        //appmodel variabelen instellen adhv xml

        //instantie PageViewer
        //instantie Controls
        //instantie Index
        //instantie Timeline


    }



    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/
}
}
