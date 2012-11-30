/**
 * Created with IntelliJ IDEA.
 * User: pieterdebaets
 * Date: 30/11/12
 * Time: 09:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer {
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;

import flash.display.Loader;
import flash.display.Sprite;

import flash.printing.PrintJob;

import flash.text.TextField;

public class Page {
    /*************************************/
    //Properties
    /*************************************/
    private var title:TextField;
    private var paragraph:TextField;
    private var caption:TextField;
    private var chapter:TextField;
    private var image:Loader;
    private var pageNumber:int;
    private var backgroundColor:Sprite;



    /*************************************/
    //Constructor
    /*************************************/

    public function Page(data:PageVO) {
        //switch op properties van data: Check welke niet null zijn
        //
    }


    /*************************************/
    //Methods
    /*************************************/


    /*************************************/
    //Getters & Setters
    /*************************************/

}
}
