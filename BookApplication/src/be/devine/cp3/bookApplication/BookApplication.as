package be.devine.cp3.bookApplication {

import be.devine.cp3.AppModel;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.core.Starling;


import starling.display.Quad;
import starling.text.TextField;

public class BookApplication extends starling.display.Sprite {
    /*************************************/
    //Properties
    /*************************************/
    private var appModel:AppModel;

    /*************************************/
    //Constructor
    /*************************************/

    public function BookApplication() {
        var textField:starling.text.TextField = new TextField(100, 20, "IBOOK 10 start", "Verdana", 12);
        addChild(textField);

        trace("start up IBOOK10");

        appModel = AppModel.getInstance();

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
