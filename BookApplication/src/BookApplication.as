package {

import be.devine.cp3.Appmodel;

import flash.display.Sprite;
import flash.text.TextField;

public class BookApplication extends Sprite {
    public function BookApplication() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
        trace("start up IBOOK10");
        var appmodel:Appmodel = new Appmodel();
        trace(appmodel);


    }
}
}
