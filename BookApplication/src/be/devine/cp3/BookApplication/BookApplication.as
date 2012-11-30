package be.devine.cp3.bookApplication {

import be.devine.cp3.Appmodel;

import flash.display.Sprite;
import flash.text.TextField;

public class BookApplication extends Sprite {
    /*************************************/
    //Properties
    /*************************************/


    /*************************************/
    //Constructor
    /*************************************/

    public function BookApplication() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
        trace("start up IBOOK10");
        var appmodel:Appmodel = new Appmodel();
        trace(appmodel);

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
