package be.devine.cp3.BookApplication {

import be.devine.cp3.AppModel;

import flash.display.Sprite;
import flash.text.TextField;

public class BookApplication extends Sprite {

    private var appModel:AppModel;

    public function BookApplication() {
        var textField:TextField = new TextField();
        textField.text = "IBOOK 10 start";
        addChild(textField);
        trace("start up IBOOK10");

        appModel = AppModel.getInstance();

        trace(appModel);

    }
}
}
